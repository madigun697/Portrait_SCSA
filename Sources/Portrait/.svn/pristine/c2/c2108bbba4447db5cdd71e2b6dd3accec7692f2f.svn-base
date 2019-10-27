var jQueryScriptOutputted = false;
function initJQuery() {

    //if the jQuery object isn't available
    if (typeof(jQuery) == 'undefined') {

        if (! jQueryScriptOutputted) {
            //only output the script once..
            jQueryScriptOutputted = true;

            //output the script (load it from google api)
            document.write("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js\"></script>");
        }
        setTimeout("initJQuery()", 50);
    } else {

        jQuery(function() {
            //do anything that needs to be done on document.ready
        });
    }

}
initJQuery();