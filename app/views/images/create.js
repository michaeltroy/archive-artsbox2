// views/reviews/create.js.erb
$("#new_image").before('<div id="flash_notice"><%= escape_javascript(flash.delete(:notice)) %></div>');
//$("#images").append("<%= escape_javascript(render(:partial => @image)) %>");