//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require autocomplete
//= require twitter-bootstrap-wizard

//= require moment
//= require bootstrap-datetimepicker

//= require_tree .



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
    }});
});
