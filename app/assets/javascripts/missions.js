// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Ceci est le javascript de la gem BootstrapWizard (pour missions/new)

$(document).ready(function() {
    $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {
      var regex = new RegExp("^(0[1-678])(?:[ _.-]?([0-9]{2})){4}$");
      if ((index==3) && ($("#sender_phone").length != 0)) {
        var phone = $("#sender_phone").val();
        if (regex.test(phone) ) {
           console.log("valide");
        } else {
          console.log("ok das non");
          $("#error_on_phone").removeClass("hidden");
          return false
        }
      }
      if ((index==3)){
        var receiver_phone = $("#mission_receiver_phone").val();
        if (regex.test(receiver_phone) ) {
           console.log("valide");
        } else {
          console.log("ok das non");
          $("#error_on_receiver_phone").removeClass("hidden");
          return false
        }
      }
    }, onTabShow: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      $('#rootwizard').find('.bar').css({width:$percent+'%'});
      if(index==3) {
        $('.next').addClass("hidden");
      }
      $('#rootwizard').find('#icon').css({width:$percent+'%'})
    }});
});


