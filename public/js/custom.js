$(window).on("load",function(){"use strict";setTimeout(function(){$(".loader").addClass("fade-dark"),$(".loader__logo").removeClass("slideInDown").addClass("flipOutY"),$(".loader__caption").removeClass("slideInUp").addClass("fadeOutDown")},1e3),setTimeout(function(){$(".loader").addClass("loaded")},100),setTimeout(function(){$("#main").addClass("loaded")},100)}),$(function(){"use strict";var e=$("#bgndVideo");e.length&&e.mb_YTPlayer({mute:!0,containment:"#video-wrapper",showControls:!1,autoPlay:!0,loop:!0,startAt:0,quality:"default"});var n=$("#bgndKenburns");n.length&&n.vegas({timer:!1,delay:1e4,transition:"fade2",transitionDuration:2e3,slides:[{src:"http://via.placeholder.com/1400x1200"},{src:"http://via.placeholder.com/1400x1200"},{src:"http://via.placeholder.com/1400x1200"}],animation:["kenburnsUp","kenburnsDown","kenburnsLeft","kenburnsRight"]});var i=$("#bgndKenburns-color-1");i.length&&i.vegas({timer:!1,delay:1e4,transition:"fade2",transitionDuration:2e3,slides:[{src:"img/backgrounds/1400x1200-bg-kenburns-1_1.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-1_2.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-1_3.jpg"}],animation:["kenburnsUp","kenburnsDown","kenburnsLeft","kenburnsRight"]});var t=$("#bgndKenburns-color-2");t.length&&t.vegas({timer:!1,delay:1e4,transition:"fade2",transitionDuration:2e3,slides:[{src:"img/backgrounds/1400x1200-bg-kenburns-2_1.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-2_2.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-2_3.jpg"}],animation:["kenburnsUp","kenburnsDown","kenburnsLeft","kenburnsRight"]});var a=$("#bgndKenburns-color-3");a.length&&a.vegas({timer:!1,delay:1e4,transition:"fade2",transitionDuration:2e3,slides:[{src:"img/backgrounds/1400x1200-bg-kenburns-3_1.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-3_2.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-3_3.jpg"}],animation:["kenburnsUp","kenburnsDown","kenburnsLeft","kenburnsRight"]});var s=$("#bgndKenburns-color-4");s.length&&s.vegas({timer:!1,delay:1e4,transition:"fade2",transitionDuration:2e3,slides:[{src:"img/backgrounds/1400x1200-bg-kenburns-4_1.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-4_2.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-4_3.jpg"}],animation:["kenburnsUp","kenburnsDown","kenburnsLeft","kenburnsRight"]});var o=$("#bgndKenburns-color-5");o.length&&o.vegas({timer:!1,delay:1e4,transition:"fade2",transitionDuration:2e3,slides:[{src:"img/backgrounds/1400x1200-bg-kenburns-5_1.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-5_2.jpg"},{src:"img/backgrounds/1400x1200-bg-kenburns-5_3.jpg"}],animation:["kenburnsUp","kenburnsDown","kenburnsLeft","kenburnsRight"]}),$("#countdown").countdown({until:$.countdown.UTCDate(10,2021,12,19),format:"D"}),$("#countdown-large").countdown({until:$.countdown.UTCDate(10,2021,12,19),format:"DHMS"}),$(".notify-form").ajaxChimp({callback:function(e){"success"===e.result?($(".notify").find(".form").addClass("is-hidden"),$(".notify").find(".subscription-ok").addClass("is-visible"),setTimeout(function(){$(".notify").find(".subscription-ok").removeClass("is-visible"),$(".notify").find(".form").delay(300).removeClass("is-hidden"),$(".notify-form").trigger("reset")},5e3)):"error"===e.result&&($(".notify").find(".form").addClass("is-hidden"),$(".notify").find(".subscription-error").addClass("is-visible"),setTimeout(function(){$(".notify").find(".subscription-error").removeClass("is-visible"),$(".notify").find(".form").delay(300).removeClass("is-hidden"),$(".notify-form").trigger("reset")},5e3))},url:"https://besaba.us10.list-manage.com/subscribe/post?u=e8d650c0df90e716c22ae4778&amp;id=54a7906900"}),$("#stayintouch-form").submit(function(){var e=$(this);return $.ajax({type:"POST",url:"mail.php",data:e.serialize()}).done(function(){$(".stayintouch").find(".form").addClass("is-hidden"),$(".stayintouch").find(".reply-group").addClass("is-visible"),setTimeout(function(){$(".stayintouch").find(".reply-group").removeClass("is-visible"),$(".stayintouch").find(".form").removeClass("is-hidden"),e.trigger("reset")},5e3)}),!1}),$("#contact-form").submit(function(){var e=$(this);return $.ajax({type:"POST",url:"mail.php",data:e.serialize()}).done(function(){$(".contact").find(".form").addClass("is-hidden"),$(".contact").find(".reply-group").addClass("is-visible"),setTimeout(function(){$(".contact").find(".reply-group").removeClass("is-visible"),$(".contact").find(".form").delay(300).removeClass("is-hidden"),e.trigger("reset")},5e3)}),!1}),$(window).on("load",function(){$("#stars-js").length&&particlesJS("stars-js",{particles:{number:{value:80,density:{enable:!0,value_area:800}},color:{value:"#ffffff"},shape:{type:"star",stroke:{width:0,color:"#000000"},polygon:{nb_sides:5},image:{src:"img/github.svg",width:100,height:100}},opacity:{value:.5,random:!0,anim:{enable:!0,speed:1,opacity_min:.1,sync:!1}},size:{value:5,random:!1,anim:{enable:!0,speed:10,size_min:.1,sync:!1}},line_linked:{enable:!1,distance:150,color:"#ffffff",opacity:.4,width:1},move:{enable:!0,speed:2,direction:"top",random:!0,straight:!1,out_mode:"out",bounce:!1,attract:{enable:!0,rotateX:600,rotateY:1200}}},interactivity:{detect_on:"canvas",events:{onhover:{enable:!0,mode:"repulse"},onclick:{enable:!0,mode:"push"},resize:!0},modes:{grab:{distance:400,line_linked:{opacity:1}},bubble:{distance:400,size:40,duration:2,opacity:8,speed:3},repulse:{distance:200,duration:.4},push:{particles_nb:4},remove:{particles_nb:2}}},retina_detect:!0}),$("#snow-js").length&&particlesJS("snow-js",{particles:{number:{value:300,density:{enable:!0,value_area:800}},color:{value:"#ffffff"},shape:{type:"circle",stroke:{width:0,color:"#000000"},polygon:{nb_sides:5},image:{src:"img/github.svg",width:100,height:100}},opacity:{value:.4,random:!0,anim:{enable:!0,speed:.2,opacity_min:.05,sync:!1}},size:{value:3,random:!0,anim:{enable:!1,speed:2.4,size_min:3,sync:!1}},line_linked:{enable:!1,distance:150,color:"#ffffff",opacity:.4,width:1},move:{enable:!0,speed:1,direction:"bottom",random:!0,straight:!1,out_mode:"out",bounce:!1,attract:{enable:!0,rotateX:600,rotateY:1200}}},interactivity:{detect_on:"canvas",events:{onhover:{enable:!1,mode:"repulse"},onclick:{enable:!1,mode:"push"},resize:!0},modes:{grab:{distance:400,line_linked:{opacity:1}},bubble:{distance:400,size:40,duration:2,opacity:8,speed:3},repulse:{distance:200,duration:.4},push:{particles_nb:4},remove:{particles_nb:2}}},retina_detect:!0}),$("#particles-js").length&&particlesJS("particles-js",{particles:{number:{value:80,density:{enable:!0,value_area:800}},color:{value:"#ffffff"},shape:{type:"circle",stroke:{width:0,color:"#000000"},polygon:{nb_sides:5},image:{src:"img/github.svg",width:100,height:100}},opacity:{value:.6,random:!0,anim:{enable:!0,speed:1,opacity_min:.1,sync:!1}},size:{value:3,random:!0,anim:{enable:!1,speed:80,size_min:.1,sync:!1}},line_linked:{enable:!0,distance:180,color:"#ffffff",opacity:.3,width:1},move:{enable:!0,speed:3,direction:"none",random:!1,straight:!1,out_mode:"out",bounce:!1,attract:{enable:!1,rotateX:600,rotateY:1200}}},interactivity:{detect_on:"canvas",events:{onhover:{enable:!0,mode:"repulse"},onclick:{enable:!1,mode:"push"},resize:!0},modes:{grab:{distance:800,line_linked:{opacity:1}},bubble:{distance:800,size:80,duration:2,opacity:.8,speed:3},repulse:{distance:100,duration:.4},push:{particles_nb:4},remove:{particles_nb:2}}},retina_detect:!0}),$("#bokeh-js").length&&particlesJS("bokeh-js",{particles:{number:{value:40,density:{enable:!0,value_area:800}},color:{value:"#fcc820"},shape:{type:"circle",stroke:{width:0,color:"#000000"}},opacity:{value:.3,random:!0,anim:{enable:!0,speed:.6,opacity_min:0,sync:!1}},size:{value:13,random:!0,anim:{enable:!1,speed:120,size_min:.1,sync:!1}},line_linked:{enable:!1},move:{enable:!0,speed:.2,direction:"bottom-left",random:!0,straight:!1,out_mode:"out",bounce:!1,attract:{enable:!0,rotateX:3286.994724774322,rotateY:1200}}},interactivity:{detect_on:"canvas",events:{onhover:{enable:!0,mode:"bubble"},onclick:{enable:!1,mode:"push"},resize:!0},modes:{bubble:{distance:85,size:45,duration:1.5,opacity:.2,speed:3}}},retina_detect:!0}),$("#polygons-js").length&&particlesJS("polygons-js",{particles:{number:{value:24,density:{enable:!0,value_area:650}},color:{value:"#ffffff"},shape:{type:"polygon",stroke:{width:0,color:"#000000"},polygon:{nb_sides:5},image:{src:"img/github.svg",width:100,height:100}},opacity:{value:.2324947488255008,random:!1,anim:{enable:!0,speed:.48724632738080703,opacity_min:.06496617698410762,sync:!1}},size:{value:19.728691040806815,random:!0,anim:{enable:!0,speed:7.308694910712106,size_min:.1,sync:!1}},line_linked:{enable:!1,distance:150,color:"#ffffff",opacity:.4,width:1},move:{enable:!0,speed:2,direction:"top",random:!0,straight:!1,out_mode:"out",bounce:!1,attract:{enable:!1,rotateX:4249.041961293636,rotateY:3206.8241217310456}}},interactivity:{detect_on:"canvas",events:{onhover:{enable:!1,mode:"repulse"},onclick:{enable:!1,mode:"push"},resize:!0},modes:{grab:{distance:400,line_linked:{opacity:1}},bubble:{distance:400,size:40,duration:2,opacity:8,speed:3},repulse:{distance:200,duration:.4},push:{particles_nb:4},remove:{particles_nb:2}}},retina_detect:!0})})});