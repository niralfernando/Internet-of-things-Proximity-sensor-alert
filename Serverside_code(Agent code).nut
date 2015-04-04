//Author: Niral Fernando  
//Email: niral.fernando@mgail.com
//MidnightMaker's project and tvdl's project in http://www.instructables.com/
//were instrumental in the success of this project


device.on("senddata", function(data) {
  // Set URL to your web service
  //local url = "http://www.eng.uwaterloo.ca/~mn2ferna/index.php/";
  local url = "http://rocky-earth-5231.herokuapp.com/";
  //local url = "http://shielded-wildwood-9233.herokuapp.com/test/";
  //http://www.eng.uwaterloo.ca/~mn2ferna/test.php
  //local url = "https://ece.uwaterloo.ca/~mn2ferna/index.php/"

 
  // Set Content-Type header to json
  local headers = { "Content-Type": "application/json" };
 
  // encode data and log
  local body = http.jsonencode(data);
  server.log(body);
  
  // send data to your web service
  http.post(url, headers, body).sendsync();
  
  //sending the text to my phone
  sendSMSStatus();
}); 


//--------------------------------------------------------------------------------------------------------
//Send SMS Door Status Message
//--------------------------------------------------------------------------------------------------------  
function sendSMSStatus()
{
    //  putting "\"" simply allows the quotation mark to stay within the string
    //ie; local json = " { \"ala\" : "\wariya\" } means the json looks like --> {"ala":"wariya"}
    //ABOUT SENDHUB API --> 500 API Requests allowed per month
    // --> to find group ID, type,
    //https://api.sendhub.com/v1/groups/?username=6479229265&api_key=Your911464e291ee9739fc9e45e08714824477cd593a
    local json = "{\"contacts\": [\"+16479229265\" ],   \"text\":\"INTRUDER\"}";
    local req = http.post("https://api.sendhub.com/v1/messages/?username=6479229265&api_key=911464e291ee9739fc9e45e08714824477cd593a", 
        { "Content-Type" : "application/json" }, json );
          
    local res = req.sendsync();
    if(res.statuscode != 201) {
        server.log("Error sending SMS");
    }
    else
    {
        server.log("Sent SMS Door State");
    }
} 