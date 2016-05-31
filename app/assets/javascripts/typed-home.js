$(document).ready(function(){
  $(function(){
      $(".element").typed({
          strings: ["Manon.", "Olivier.", "Jean.", "Roger.", "nos Whizers !"],
          loop: false,
          // time before typing starts
          startDelay: 50,
          // backspacing speed
          backSpeed: 100,
          typeSpeed: 200,
          // loop
          loop: false,
      });
  });
});
