// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// public/javascripts/application.js
 
// setup the document
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})
 
jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};
 
jQuery(function($) {
  $("#new_comment").submitWithAjax();
})
 
jQuery(function($) {
  $("#new_user").submitWithAjax();
})
 
// form validations
function errorMessages(responseText){
    var json = eval(responseText);
    var errorText = "";
    var len = json.length;
    
		for (var x = 0; x <len; x++)
    {
      errorText += "<span class='error'>" + json[x][1] + "</span>";
    }
    if (len > 0){
        errorText = "<p class='errors'>" + errorText + "<p";
    }
    return errorText;
}