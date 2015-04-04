//Author: Niral Fernando  
//Email: niral.fernando@mgail.com
//MidnightMaker's project and tvdl's project in http://www.instructables.com/
//were instrumental in the success of this project

arduino <- hardware.uart57;

function initUart()
{
    hardware.configure(UART_57);    // Using UART on pins 5 and 7
    hardware.uart57.configure(9600, 8, PARITY_NONE, 1, NO_CTSRTS, serialRead); // 19200 baud worked well, no parity, 1 stop bit, 8 data bits
}

// serialRead() will be called whenever serial data is passed to the imp. It
//  will read the data in, and send it out to the agent.
function serialRead()
{

    imp.wakeup(0.1, serialRead.bindenv(this));    // schedule the next poll in 10us
    local bcnt = 0;
    local s = "";
    local byte = hardware.uart57.read();    // read the UART buffer
    // This will return -1 if there is no data to be read.
    while (byte != -1)  // otherwise, we keep reading until there is no data to be read.
    {
        s+=byte.tochar();
//        s+=byte;
        bcnt++;
        //  server.log(format("%c", byte)); // send the character out to the server log. Optional, great for debugging
        // impeeOutput.set(byte);  // send the valid character out the impee's outputPort
        byte = hardware.uart57.read();  // read from the UART buffer again (not sure if it's a valid character yet)
        // server.show(byte);
    }
    if (bcnt > 0)
    {
//        server.show("String received");
        server.log(s);
        
        if (s.tostring()=="o3" || s.tostring()=="3")
        {
          //each data has a key with it (eg: pin1 & pin2) which are keys, this is how jason works
          local data = { "target": 1 , "channel": 2}
          //local data = { "target": "123" , "channel": "456" };
          server.log("ALTERT!!")
          agent.send("senddata", data);
        } 
    } 
    
}
 
///////////
// Setup //
///////////
server.log("Serial Pipeline Open!"); // A warm greeting to indicate we've begun
//initLEDs(); // Initialize the LEDs
initUart(); // Initialize the UART
serialRead()

// From here, all of our main action will take place in serialRead() and the
// agent.on functions. It's all event-driven.


//////////////////Sleep avoiding code block//////////////////////
function dontsleep() {
  imp.wakeup(5,dontsleep);
  server.log("Server Online");
}
dontsleep();
//////////////////Sleep avoiding code block//////////////////////