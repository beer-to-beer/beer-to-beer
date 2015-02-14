// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-migrate-min
//= require jquery_ujs
//= require jquery.turbolinks
//= require javascripts/ace/modernizr.custom
//= require plugins/ace/bootstrap/js/bootstrap.min.js
//= require plugins/ace/flexslider/jquery.flexslider-min.js
//= require plugins/ace/back-to-top.js
//= require plugins/ace/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min
//= require plugins/ace/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min
//= require javascripts/ace/app.js
//= require javascripts/ace/pages/index.js
//= require jquery.barrating.js
//= require turbolinks
jQuery(document).ready(function() {
    App.init();
    App.initSliders();
    Index.initRevolutionSlider();
    });
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-29166220-1']);
_gaq.push(['_setDomainName', 'htmlstream.com']);
_gaq.push(['_trackPageview']);

(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();