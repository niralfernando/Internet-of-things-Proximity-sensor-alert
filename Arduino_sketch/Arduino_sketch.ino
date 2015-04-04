 /*
Author: Niral Fernando
Email: niral.fernando@gmail.com
*/

 #include <SoftwareSerial.h> //Allows one to do serial communication in digital pins
 #include <CapacitiveSensor.h> //Library for capacitive proximity sensor

 
 //defining the Pins for TX and RX UART serial communication
 SoftwareSerial electricimpSerial(9,10);
 CapacitiveSensor   cs_4_2 = CapacitiveSensor(4,2);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired
 int lightvalue = 3;
 
 void setup() {
 //open Arduino serial port so values are shown in the Arduino serial monitor
 Serial.begin(9600);
 //open software serial port so values can be passed on to the electric imp
 electricimpSerial.begin(9600);
  cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF); // turn off autocalibrate on channel 1 - just as an example
 }

 void loop() {
   long start = millis();
   long total1 =  cs_4_2.capacitiveSensor(30);
   lightvalue = total1;  
   Serial.print("Proximity level: ");
   Serial.println(lightvalue);
   //Write information to electric imp
   electricimpSerial.print("no");

   if (lightvalue > 100 ) //MNS ADDED : if the serial reading goes over 100 (threshold), send an Alert message to imp
   {
     electricimpSerial.println("3"); //I chose the number 3 to be indicator that an object is at close proximity
     Serial.print("3");
   }               

 delay(1000);
 }


