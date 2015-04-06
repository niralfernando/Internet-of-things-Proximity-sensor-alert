#"INTERNET OF THINGS"-PROXIMITY SENSITIVE SMARTPHONE ALERT SYSTEM#

<img src="https://raw.github.com/niralfernando/Internet-of-things-Proximity-sensor-alert/master/images/IMG_1.png" 
alt="IMAGE ALT TEXT HERE" width="700" height="450" border="10" />


The following project utilizes a capacitive proximity sensor that alerts a web application and a smartphone via SMS when an object is closer than a defined distance. In other words, it is simply a security/monitoring system.

##How capacitive proximity sensor works:
There are different kinds of proximity sensors. They are

 * Capacitive proximity sensor
 * Inductive proximity sensor
 * Photoelectric proximity sensor
 * Ultrasonic proximity sensor


According to <http://playground.arduino.cc//Main/CapacitiveSensor?from=Main.CapSense>, "Research has shown that a small capacitor (100 pF) or so from sensor pin to ground improves stability and repeatability...Adding small capacitor (20 - 400 pF) in parallel with the body capacitance, is highly desirable too, as it stabilizes the sensed readings."

Basically a weak signal is sent through the _send pin_ and how quickly the object's voltage changes is measure via the _receive pin_(aka sensor terminal)

When the send pin changes state, it will eventually change the state of the receive pin. The delay between the send pin changing and the receive pin changing is determined by an RC time constant, defined by R * C, where R is the value of the resistor and C is the capacitance at the receive pin, plus any other capacitance (e.g. human body interaction) present at the sensor (receive) pin.

##Capacitive proximity sensor --> Internet

<img src="https://raw.github.com/niralfernando/Internet-of-things-Proximity-sensor-alert/master/images/IMG_2.png" 
alt="IMAGE ALT TEXT HERE" width="700" height="450" border="10" />


The capacitive proximity sensor I built works with an Aruduino UNO. When an object comes to close proximity, the Arduino triggers an alert. This alert is sent to an wifi-adapting micro-controller (electric imp) via UART communication. The alert is sent from electric imp's device code to server side code. I programmed the server code so it sends a text to my smart-phone and POSTS a JSON encoded alert to a give server. In my case, I developed a PHP application that receives the POST request made by electric imp's server and outputs a .txt file has a log of POST requests.

<img src="https://raw.github.com/niralfernando/Internet-of-things-Proximity-sensor-alert/master/images/ScreenShot.png" 
alt="IMAGE ALT TEXT HERE" width="700" height="450" border="10" />

<img src="https://raw.github.com/niralfernando/Internet-of-things-Proximity-sensor-alert/master/images/website_update.png" 
alt="IMAGE ALT TEXT HERE" width="700" height="450" border="10" />
  


_Author: [Niral Fernando](http://www.eng.uwaterloo.ca/~mn2ferna/)_

_Email : <niral.fernando@gmail.com>_

_Phone: 647-922-9265_