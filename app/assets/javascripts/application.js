// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require stickyfill.min
// require froala_editor.min
// require froala_editor.pkgd.min
//= require tether
//= require bootstrap-filestyle.min
//= require bootstrap.min
//= require init
//= require_tree .

// $(function() {
//   $('textarea#froala-editor').froalaEditor()
// });

$(function pageLoad(){
  $('[data-toggle="tooltip"]').tooltip()

  if ($(".dropdown-menu").length){
  //   // $(".dropdown-menu").click(function(event){
  //   $(".dropdown a.dropdown-toggle").click(function(event){
  //     console.log("I see main the click");
  //     event.stopPropagation();
  //   });

    $(".dropdown a.dropdown-toggle").click(function(event){
      var $parent = $(this).offsetParent(".dropdown-menu");
      $(this).parent("li, div").toggleClass("show");
      console.log("I see the click");
      $(".dropdown li.show").not( $(this).parents("li, div")).removeClass("show") ;
      return false;
    });
  }
});
