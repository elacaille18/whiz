// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Ceci est le javascript de la gem BootstrapWizard (pour missions/new)

$(document).ready(function() {
    $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {

    }, onTabShow: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      $('#rootwizard').find('.bar').css({width:$percent+'%'});
      if(index==3) {
        console.log("tata");
        $('.next').addClass("hidden");
      }
      $('#rootwizard').find('#icon').css({width:$percent+'%'})
    }});
});


