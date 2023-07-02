# first , run this command and then , run code :
# pip install pillow

from PIL import Image

width, height  = input("Enter width and next,  height : ").split()
width = int(width)
height = int(height) 
# Load the binary file
with open('binary-output.bin', 'rb') as f:
    contents = f.read()
    
# Convert the file to an image
img = Image.frombytes('RGB', (width, height), contents)
    
# Save the image as a JPEG file
img.save('final-output.jpg')

