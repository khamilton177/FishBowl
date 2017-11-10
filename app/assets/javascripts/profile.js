// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("DOMContentLoaded", function(){
  var avatarPic=document.querySelector("#profile_avatar");

  function handleFileSelect(evt) {
    console.log ("DOING CHANGE EVENT");
    var file = evt.target.files; // FileList object
      f=file[0];
      // Only process image files.
      if (f.type.match('image.*')) {
        var reader = new FileReader();
        reader.onload = (function(theFile) {
          return function(e) {
            // alert(e.target.result);
            document.querySelector(".avatar-preview").src=e.target.result;
          };
        })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
      }
  }

  if (avatarPic != null || avatarPic !== undefined){
    console.log ("I'm Here!!!");
    avatarPic.addEventListener("change", handleFileSelect, false);
  }
})
