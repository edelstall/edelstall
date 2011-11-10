/*
 * jQuery Backstretch
 * Version 1.2.0
 * http://srobbin.com/jquery-plugins/jquery-backstretch/
 *
 * Add a dynamically-resized background image to the page
 *
 * Copyright (c) 2011 Scott Robbin (srobbin.com)
 * Dual licensed under the MIT and GPL licenses.
*/
(function(a){a.backstretch=function(k,g,l){function m(c){try{h={left:0,top:0},d=e.width(),b=d/j,b>=e.height()?(i=(b-e.height())/2,f.centeredY&&a.extend(h,{top:"-"+i+"px"})):(b=e.height(),d=b*j,i=(d-e.width())/2,f.centeredX&&a.extend(h,{left:"-"+i+"px"})),a("#backstretch img:last").width(d).height(b).css(h)}catch(g){}typeof c=="function"&&c()}var n={centeredX:!0,centeredY:!0,speed:0},c=a("#backstretch"),f=c.data("settings")||n;c.data("settings");var e="onorientationchange"in window?a(document):a(window),j,d,b,i,h;g&&typeof g=="object"&&a.extend(f,g);a(document).ready(function(){if(k){var b;c.length==0?c=a("<div />").attr("id","backstretch").css({left:0,top:0,position:"fixed",overflow:"hidden",zIndex:-999999,margin:0,padding:0}):c.find("img").addClass("deleteable");b=a("<img />").css({position:"fixed",display:"none",margin:0,padding:0,border:"none"}).bind("load",function(){var b=a(this);b.css({width:"auto",height:"auto"});j=this.width/this.height;m(function(){b.fadeIn(f.speed,function(){c.find(".deleteable").remove();typeof l=="function"&&l()})})}).appendTo(c);a("body #backstretch").length==0&&a("body").prepend(c);c.data("settings",f);b.attr("src",k);a(window).resize(m)}});return this}})(jQuery);