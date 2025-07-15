# //Install Quartos Software <br />
https://www.intel.com/content/www/us/en/software-kit/849770/intel-quartus-prime-lite-edition-design-software-version-24-1-for-windows.html
<img width="1486" height="309" alt="image" src="https://github.com/user-attachments/assets/e3c90b7d-d577-4842-b830-9bf70dc10cd8" />
# //Starting New Project <br />
### Find and Click **New Project Wizard**.
<img width="1213" height="188" alt="image" src="https://github.com/user-attachments/assets/4dfc7923-6640-4560-a414-3e3a156a15bf" />
### Select **Next>**.
<img width="802" height="660" alt="image" src="https://github.com/user-attachments/assets/b0526677-e145-4673-807d-7b7a1edb3124" />
### Fill out **Directory**, **Name**, and **Top-Level Entity**. Then, click **Next >**.
<img width="802" height="660" alt="image" src="https://github.com/user-attachments/assets/0f01a9e2-40e4-4fa2-b94f-0d46728c7916" />
### On project type, select **Empty Project** and click **Next >**.
<img width="802" height="660" alt="image" src="https://github.com/user-attachments/assets/3fb377bf-a705-42e8-9c7d-737df0d5226b" />
### Add files if you have existing file, then, click **Next >**.
<img width="929" height="720" alt="image" src="https://github.com/user-attachments/assets/e7e72841-ed7e-4356-af53-425a59318006" />
### On Family, Device & Board Settings, In the Device Family, select **MAX 10 (DA/DF/DC/SA/SC)**, and in the name filter search and select **10M50DAF484C7G**.
<img width="1029" height="720" alt="image" src="https://github.com/user-attachments/assets/2a85eaa3-4207-4aa0-96e7-d44ae35f50ec" />
### On EDA Tool Settings, select **ModelSim-Altera** for simulation toolname, and **Verilog HDL** for format(s). Then, click **Next >**.
<img width="929" height="720" alt="image" src="https://github.com/user-attachments/assets/92fd15e5-e7c6-4c21-aef9-1b9be73bba01" />
### Review Summary, if all information are correct, click **Finish**.
<img width="929" height="720" alt="image" src="https://github.com/user-attachments/assets/dd15e9f2-2c9d-4ef1-8149-b680979ceef9" />
# Creating Verilog HDL code and Uploading to the FPGA board
### Select New (CTRL + N), find and select **Verilog HDL**. A new utility window would be open and now you can create your code. In the upper left corner,  the code can be check for errors using **Analysis and Elaborate** and Analysis and Synthesis**. Once everything is in right place, the code can compiled using the **Compilation** button.
<img width="1217" height="745" alt="image" src="https://github.com/user-attachments/assets/c1be3fec-9c86-44de-b355-3e089105cd51" />
### After compiling, in the messages, critical warnings, and warnings would be seen. NOTE: Some warnings can be neglected and some are not. Example, critical warning 169085, the warning states that there are 12 pin of 12 total pins are not assigned with pin location. This could be solve through the pin planner (CTRL + SHIFT + N) and assign the pin location.
<img width="1890" height="275" alt="image" src="https://github.com/user-attachments/assets/c53bdeff-ea18-4fad-ae78-7111ff3df375" />
### When assigning the pin location, use the manual for the DE10-Elite Altera MAX 10 FPGA Board. <br/>
https://www.terasic.com.tw/cgi-bin/page/archive_download.pl?Language=English&No=1021&FID=a13a2782811152b477e60203d34b1baa
<br/>
### Example assigment of pin location, and run **Compilation**, if done.
<img width="1305" height="320" alt="image" src="https://github.com/user-attachments/assets/83d7eb45-2886-455d-8dd3-fdd081cd293b" />

### After compilation critical warning 169085 is gone.
<img width="1890" height="295" alt="image" src="https://github.com/user-attachments/assets/bd53a777-c946-4b9f-992c-0db6d56c1610" />



# // USB Blaster












