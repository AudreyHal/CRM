// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"


/*--- Accordion --->*/
var acc = document.getElementsByClassName("accordion1");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    /* Toggle between adding and removing the "active" class,
    to highlight the button that controls the panel */
    this.classList.toggle("active");

    /* Toggle between hiding and showing the active panel */
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
} 

/*--- Accounts Page js --->*/
  //  Hide/Show details for account page
 document.getElementById("acc_account").onclick = function() {
    var x = document.getElementById("hidden1_account_details");
if (x.style.display === "none") {x.style.display = "block";} 
    else { x.style.display = "none";    } };

  //  Hide/Show contact info for account page
  document.getElementById("acc2_account").onclick = function() {
    var x = document.getElementById("hide_account_contact");
    if (x.style.display === "none") {x.style.display = "block";} 
    else { x.style.display = "none";    } };

  //  Hide/Show new note for account page
  document.getElementById("b1_account").onclick = function() {
    var x = document.getElementById("hidden_account_note");
    if (x.style.display === "none") {x.style.display = "block";} 
    else { x.style.display = "none";    } };



/*--- Opportunity Page js --->*/
  //  Hide/Show details for opportunity page
 document.getElementById("acc_opportunity").onclick = function() {
  var x = document.getElementById("hidden1_opportunity_details");
  if (x.style.display === "none") {x.style.display = "block";}
   else { x.style.display = "none";    } };

 //  Hide/Show contact info for opportunity page
document.getElementById("acc2_opportunity").onclick = function() {
  var x = document.getElementById("hide_opportunity_contact");
  if (x.style.display === "none") {x.style.display = "block";}
   else { x.style.display = "none";    } };

 //  Hide/Show new note for opportunity page
document.getElementById("b1_opportunity").onclick = function() {
  var x = document.getElementById("hidden_opportunity_note");
  if (x.style.display === "none") {x.style.display = "block";} 
  else { x.style.display = "none";    } };
   

  /*--- Contacts Page js --->*/
  //  Hide/Show details for contact page
 document.getElementById("acc_contact").onclick = function() {
  var x = document.getElementById("hidden1_contact_details");
  if (x.style.display === "none") {x.style.display = "block";}
   else { x.style.display = "none";    } };

  //  Hide/Show contact info for contact page
document.getElementById("acc2_contact").onclick = function() {
  var x = document.getElementById("hide_contact_contact");
  if (x.style.display === "none") {x.style.display = "block";} 
  else { x.style.display = "none";    } };

//  Hide/Show new note for contact page
document.getElementById("b1_contact").onclick = function() {
  var x = document.getElementById("hidden_contact_note");
  if (x.style.display === "none") {x.style.display = "block";} 
  else { x.style.display = "none";    } };


  /*--- Leads Page js --->*/
  //  Hide/Show details for lead page
 document.getElementById("acc_lead").onclick = function() {
    var x = document.getElementById("hidden1_lead_details");
    if (x.style.display === "none") {x.style.display = "block";} 
    else { x.style.display = "none";    } };

  //  Hide/Show contact info for lead page
  document.getElementById("acc2_lead").onclick = function() {
    var x = document.getElementById("hide_lead_contact");
    if (x.style.display === "none") {x.style.display = "block";} 
    else { x.style.display = "none";    } };

  //  Hide/Show new note for lead page
  document.getElementById("b1_lead").onclick = function() {
    var x = document.getElementById("hidden_lead_note");
    if (x.style.display === "none") {x.style.display = "block";}
     else { x.style.display = "none";    } };





