#! /usr/bin/python
'''
File Name: image2coe.py
Author: Jesse Millwood
Python Version: 2.7
Date: March 12 2014


Description:
	This script loads in an image defined by the user and converts it to a
	Xilinx Coefficients File (.coe)
	The majority of this code is just adapted from a MATLAB script, "IMG2coe8.m",
	that was found in an on-line example at: 
	http://www.lbebooks.com/downloads.htm#vhdlnexys
	The specific example is at:
	http://www.lbebooks.com/downloads/exportal/VHDL_NEXYS_Example24.pdf

TO USE:
	The easiest way to use this script is to copy this module to the directory
	that contains the image that you want to convert. Then  start and instance 
	or your terminal emulator or command prompt in that same directory. Run this 
	module with the python command from the terminal emulator or command prompt
	text editor and change the contents of the string named ImageName. 
	Then run the script from a command line.
'''
# Imported Standard Modules
import sys
import os
from PIL import Image 




def Convert (ImageName):
	"""
		This converts the given image into a Xilinx Coefficients (.coe) file.
		Pass it the name of the image including the file suffix.
		The file must reside in the directory from which this function is called
		or provide the absolute path. 
	"""
	# Open image
	img 	= Image.open(ImageName)
	# Verify that the image is in the 'RGB' mode, every pixel is described by 
	# three bytes
	if img.mode != 'RGB':
		img = img.convert('RGB')

	# Store Width and height of image
	width 	= img.size[0]
	height	= img.size[1]

	# Create a .coe file and open it.
	# Write the header to the file, where lines that start with ';' 
	# are commented
	filetype = ImageName[ImageName.find('.'):]
	filename = ImageName.replace(filetype,'.coe')
	imgcoe	= open(filename,'wb')
	imgcoe.write(';	VGA Memory Map\n'.encode())
	imgcoe.write('; .COE file with hex coefficients\n'.encode())
	imgcoe.write('; Height: {0}, Width: {1}\n'.format(height,width).encode())
	imgcoe.write('memory_initialization_radix = 16;\n'.encode())
	imgcoe.write('memory_initialization_vector =\n'.encode())
	
	# Iterate through every pixel, retain the 3 least significant bits for the
	# red and green bytes and the 2 least significant bits for the blue byte. 
	# These are then combined into one byte and their hex equivalent is written
	# to the .coe file
	cnt = 0
	line_cnt = 0
	for r in range(0, height):
		for c in range(0, width):
			cnt += 1
			# Check for IndexError, usually occurs if the script is trying to 
			# access an element that does not exist
			try:
				R,G,B = img.getpixel((c,r))
			except IndexError:
				print ('Index Error Occurred At:')
				print ('c: {}, r:{}'.format(c,r))
				sys.exit()
			# convert the value (0-255) to a binary string by cutting off the 
			# '0b' part and left filling zeros until the string represents 8 bits
			# then slice off the bits of interest with [5:] for red and green
			# or [6:] for blue
			Rb = bin(R)[2:].zfill(8)
			
			Outbyte = Rb
			# Check for Value Error, happened when the case of the pixel being 
			# zero was not handled properly	
			try:
				imgcoe.write('%2.2X'.encode()%int(Outbyte,2))
			except ValueError:
				print ('Value Error Occurred At:')
				print ('Contents of Outbyte: {0} at r:{1} c:{2}'.format(Outbyte,r,c))
				print ('R:{0} G:{1} B{2}'.format(R,G,B))
				print ('Rb:{0} Gb:{1} Bb:{2}'.format(Rb,Gb,Bb))
				sys.exit()
			# Write correct punctuation depending on line end, byte end,
			# or file end
			if c==width-1 and r==height-1:
				imgcoe.write(';'.encode())
			else:
				if cnt%32 == 0:
					imgcoe.write(',\n'.encode())
					line_cnt+=1
				else:
					imgcoe.write(','.encode())
	imgcoe.close()
	print ('Xilinx Coefficients File:{} DONE'.format(filename))
	print ('Converted from {} to .coe'.format(filetype))
	print ('Size: h:{} pixels w:{} pixels'.format(height,width))
	print ('COE file is 32 bits wide and {} bits deep'.format(line_cnt))
	print ()



Convert('output-onlinejpgtools.jpg')
