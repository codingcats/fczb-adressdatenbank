// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

 

$( document ).ready(function() {

  function generateIndexNumber() {

    //Get all input tags with type 'text'
    var textFields = $("input[type='text']");

    //Filter text fields by id attribute and return only textfields starting with contact_emails_attributes_
    var emailTextFields = $.grep(textFields, function(textField) {
      var id = $(textField).attr("id");
      return id.startsWith("contact_emails_attributes_");
    });
    return emailTextFields.length;
  }

  function createName() {
    return "contact[emails_attributes]["+ generateIndexNumber() +"][value]";
  }

  function createId() {
    return "contact_emails_attributes_"+ generateIndexNumber() +"_value";
  }
  
  //Hier geht die Funktion los! Die CSS-Klasse .add-email (der +Button) wird geklickt und dann wird ein neues Textfeld in den Container hinzugefügt.
  $(".add-email").click(function(){
    var div = $("<div>").html($("<input>").attr("type","text")
                                .attr("id", createId())
                                .attr("name", createName()));
    $(".email-container").append(div);
  });
  
  // Löschen über Checkbox bei Submit (mit Sicherheitsabfragefenster)
  $("input[type='submit']").click(function(e){
    if ($("form input:checkbox:checked").length >0 ){
      if (!confirm('Möchten Sie die markierten Emailadressen löschen?')) {
        e.preventDefault();
      }
    }
  });
  
});