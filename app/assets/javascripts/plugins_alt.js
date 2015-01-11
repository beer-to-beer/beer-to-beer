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
//= require javascripts/ace/jquery-1.8.2.min
//= require javascripts/ace/modernizr.custom
//= require plugins/ace/bootstrap/js/bootstrap.min.js
//= require plugins/ace/flexslider/jquery.flexslider-min.js
//= require plugins/ace/parallax-slider/js/modernizr.js
//= require plugins/ace/parallax-slider/js/jquery.cslider.js
//= require plugins/ace/back-to-top.js
//= require javascripts/ace/app.js
//= require javascripts/ace/pages/index.js




    <script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <!-- JS Page Level -->
    <script type="text/javascript" src="assets/js/app.js"></script>
    <script type="text/javascript" src="assets/js/pages/index.js"></script>
    <script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initFancybox();
        App.initSliders();
        Index.initRevolutionSlider();
        });
    </script>
    <!--[if lt IE 9]>
        <script src="assets/js/respond.js"></script>
    <![endif]-->
    <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-29166220-1']);
    _gaq.push(['_setDomainName', 'htmlstream.com']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>