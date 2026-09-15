<h3># Lab1_RGB_Blinker_Isaac_Lewis </h3>
<br>
#IMPORTANT NOTE <br>
#I ended up making both the procedure and lab in the same project originally. <br>
#THEREFORE "Blinking_led_procedure" is the procedure <br>
#folder "Blinking_led" is the blinking RGB lab <br> 

<h2>#Overview</h2> <br>
#This lab required us to design a blinking led then blinking rgb (color based on switch activiation) on a one second blink timer. The design will be down using sequential logic as we are using hardware based code.

<br> <br>

<h2>Design Summary</h2>
#For the procedure, I used if, elsif, and else statements to manage led outcomes. I first checked if the led was off and if it was I used the conditionals to tell if it was a rst off or if it was actually just not switched on. Then if it was on I used conditions to control the blinking effect. <br> 
#Now for the rgb/task section, I used a switch statement to cover the three switch option 1,2, and 3 (covering r,g,b, respectfully.). When any of the three switches are active alone, I assign that blink out signal into the correct color led. At the same time we were told to use the original blinking led file to manage the blinking of the led in the same way I did in the procedure.

<br><br> 

<h2>#Verification and Results</h2> <br>
#Verification was pretty simple this week, for the the rgb we just needed to prove the test cases worked in practice. My testcases were, testing each switch individually, the reset signal, two switches on at once, and then all three on. After those passes sim, I plugged in the FPGA and checked each case with the on board switches. 

<br><br> 

<h2>#Known Issues or Limitation</h2> <br>
#No known issues or limitations in this project that don't align with the required lab assignment and instructions. 

<br><br> 

<h2>#Sources</h2><br> 
ChatGPT

<h2>#RGB with test WAVEFORM </h2> <br>
<img width="939" height="500" alt="ECE520Lab1rgbWaveform" src="https://github.com/user-attachments/assets/ed5f393a-5418-4b2e-89c3-30aac4baf0b9" />

<br>

<h2>#Blinking led </h2> <br>
<img width="939" height="500" alt="Screenshot 2026-09-14 121452" src="https://github.com/user-attachments/assets/0df6f333-774b-4feb-9b1b-1bd74ab4179f" />

#
