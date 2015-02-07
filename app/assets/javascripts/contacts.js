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
    if (arguments.length === 0){
      var attribute = "value";
    }
    else {
      var attribute = arguments[0];
    }  
    return "contact[emails_attributes]["+ generateIndexNumber() +"][" + attribute + "]";
  }

  function createId() {
    if (arguments.length === 0){
      var attribute = "_value";
    }
    else {
      var attribute = arguments[0];
    }  
    return "contact_emails_attributes_"+ generateIndexNumber() + attribute;
  }
  
  //Hier geht die Funktion los! Die CSS-Klasse .add-email (der +Button) wird geklickt und dann wird ein neues Textfeld in den Container hinzugefügt.
  $(".add-email").click(function(){
    /*var div = $("<div>").html($("<input>").attr("type","text")
                                .attr("id", createId())
                                .attr("name", createName()));
    $(".email-container").append(div);*/

    var row = $("<tr>");
    var td = $("<td>");
    var input = $("<input>").attr("type","text")
                                .attr("id", createId())
                                .attr("name", createName());
    var del_but = $("<input>").attr("type","checkbox")
                              .attr("id", createId("_destroy"))
                              .attr("name", createName("_destroy"));
    var delete_td = $("<td>").attr("class", "email_delete");

    delete_td.append(del_but);
    td.append(input);
    row.append(td);
    row.append(delete_td);
    $(".email-container table").append(row);
  });
  
  // Löschen über Checkbox bei Submit (mit Sicherheitsabfragefenster)
  $('#submit-contact-detail').click(function(e){
    if ($("form input:checkbox:checked").length >0 ){
      if (!confirm('Möchten Sie die markierte(n) E-Mail-Adresse(n) löschen?')) {
        e.preventDefault();
      }
    }
  });
  
});