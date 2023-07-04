# Extract-text-from-image
Image processing and extracting text from gray scale image (for fpga course project at university)

it is implemented and designed for `virtex5-XC5VLX110T-FF1136` fpga board .

## Input
#### make .coe file from gray scale image:
In `image_to_coe.py` just pass image directory in to `convert` function and run it .

One byte of data is stored for each image .
#### Implementation :
we implement a single port RAM using the **Block Memory Generator** ip core . 

Images are loaded and read in `readMemory.v` and connect to logic using `intermediate.v` module . 

## Logic
`logic.v` is a Verilog code receives the image from the input and separates the text from image and delivers it to the output in one clock ( combinational ).

## Output
logic output is connected to `VGA_Controller.v` in `topModule.v` . 

VGA_Controller outputs used in `.ucf` file .
## Contacts
 
- [Zahra Sarami](https://github.com/zahrasarami) : z.sarami81@gmail.com
- [Alireza Falakian](https://github.com/falakian) : ali.falakian20@gmail.com
- [Mohammad Sadegh Montazeri](https://github.com/msm1984) : sadeghmomo2020@gmail.com
- [Ali Ghafoori](https://github.com/aligh7987) : 444ghafoori@gmail.com
- [Mohadeseh Salimian](https://github.com/Mohadeseh8120) 
- [Behnaz Aalipur](https://github.com/BehnazAalipur)
