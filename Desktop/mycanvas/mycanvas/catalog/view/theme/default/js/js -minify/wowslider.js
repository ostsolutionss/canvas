function ws_caption_fade(t,e,n,i){e.stop(1,1).fadeOut(t.captionDuration/3,function(){e.html(i),e.fadeIn(t.captionDuration,function(){this.filters&&this.style.removeAttribute("filter")})})}function ws_caption_move(t,e,n,i){var o=[{left1:"100%",top2:"100%"},{left1:"80%",left2:"-50%"},{top1:"-100%",top2:"100%",distance:.7,easing:"easeOutBack"},{top1:"-80%",top2:"-80%",distance:.3,easing:"easeOutBack"},{top1:"-80%",left2:"80%"},{left1:"80%",left2:"80%"}];o=o[Math.floor(Math.random()*o.length)];var a=.5,s="easeOutElastic1";e.stop(1,1).fadeOut(t.captionDuration/3,function(){function n(e){var n=$(r[e]).css("opacity");$(r[e]).css({visibility:"visible"}).css({opacity:0}).animate({opacity:n},t.captionDuration,"easeOutCirc").animate({top:0,left:0},{duration:t.captionDuration,easing:o.easing||s,queue:!1})}e.html(i);var r=e.find(">span,>div").get();$(r).css({position:"relative",visibility:"hidden"}),e.show();for(var l in o)if(/\%/.test(o[l])){o[l]=parseInt(o[l])/100;var c=e.offset()[/left/.test(l)?"left":"top"],f=/left/.test(l)?"width":"height";o[l]*=o[l]<0?c:t.$this[f]()-e[f]()-c}$(r[0]).css({left:(o.left1||0)+"px",top:(o.top1||0)+"px"}),$(r[1]).css({left:(o.left2||0)+"px",top:(o.top2||0)+"px"}),n(0),setTimeout(function(){n(1)},t.captionDuration*(o.distance||a))})}function ws_caption_parallax(t,e,n,i,o,a){function s(t,e,n){var i=1*new Date,o=function(){var a=(1*new Date-i)/e;a>=1?(t(1),cancelAnimationFrame(o),n&&n()):(t(a),requestAnimationFrame(o))};o()}e.parent().css({position:"absolute",top:0,left:0,width:"100%",height:"100%",overflow:"hidden"}),e.html(i).css("width","100%").stop(1,1),n.html(o).css("width","100%").stop(1,1),function(e,n,i,o,a,r){function l(e,n){return e.css(t.support.transform?{transform:"translate3d("+n+"px,0px,0px)"}:{marginLeft:n}).css("display","inline-block")}var c=15,f=t.$this.width();if(c*=f/100,t.prevIdx==t.curIdx)l(e,0).fadeIn(a/3),l($(">div,>span",e),0);else{var d=$(">div",e),u=$(">div",n),p=$(">span",e),h=$(">span",n),g=c+f*(r?-1:1),v=c+f*(r?1:-1),m=(r?-1:1)*c;l(e,g).show(),l(n,0).show(),l(d,m),l(u,0),l(p,2*m),l(h,0),s(function(t){t=$.easing.swing(t),l(e,(1-t)*g),l(n,t*v)},t.duration);var w=.8;s(function(t){t*=w,l(p,2*(1-t)*m),l(d,(1-t)*m),l(h,-2*t*m),l(u,t*-m)},t.duration,function(){s(function(t){t=$.easing.easeOutCubic(1,t,0,1,1,1);var e=2*(1-w)*m,n=(1-w)*m,i=-2*w*m,o=w*-m;l(p,(1-t)*e),l(d,(1-t)*n),l(h,(1-t)*i+-2*t*m),l(u,(1-t)*o+t*-m)},/Firefox/g.test(navigator.userAgent)?1500:t.delay)})}}(e,n,i,o,t.captionDuration,a)}function ws_caption_slide(t,e,n,i){function o(t,e){var n,i=document.defaultView;if(i&&i.getComputedStyle){var o=i.getComputedStyle(t,"");o&&(n=o.getPropertyValue(e))}else{var a=e.replace(/\-\w/g,function(t){return t.charAt(1).toUpperCase()});n=t.currentStyle?t.currentStyle[a]:t.style[a]}return n}function a(t,e,n){for(var i="padding-left|padding-right|border-left-width|border-right-width".split("|"),a=0,s=0;s<i.length;s++)a+=parseFloat(o(t,i[s]))||0;var r=parseFloat(o(t,"width"))||(t.offsetWidth||0)-a;return e&&(r+=a),n&&(r+=(parseFloat(o(t,"margin-left"))||0)+(parseFloat(o(t,"margin-right"))||0)),r}function s(t,e,n){for(var i="padding-top|padding-bottom|border-top-width|border-bottom-width".split("|"),a=0,s=0;s<i.length;s++)a+=parseFloat(o(t,i[s]))||0;var r=parseFloat(o(t,"height"))||(t.offsetHeight||0)-a;return e&&(r+=a),n&&(r+=(parseFloat(o(t,"margin-top"))||0)+(parseFloat(o(t,"margin-bottom"))||0)),r}function r(t,e){var n={position:0,top:0,left:0,bottom:0,right:0};for(var i in n)n[i]=t.get(0).style[i];t.show();var r={width:a(t.get(0),1,1),height:s(t.get(0),1,1),"float":t.css("float"),overflow:"hidden",opacity:0};for(var i in n)r[i]=n[i]||o(t.get(0),i);var l=$("<div></div>").css({fontSize:"100%",background:"transparent",border:"none",margin:0,padding:0});t.wrap(l),l=t.parent(),"static"==t.css("position")?(l.css({position:"relative"}),t.css({position:"relative"})):($.extend(r,{position:t.css("position"),zIndex:t.css("z-index")}),t.css({position:"absolute",top:0,left:0,right:"auto",bottom:"auto"})),l.css(r).show();var c=e.direction||"left",f="up"==c||"down"==c?"top":"left",d="up"==c||"left"==c,u=e.distance||("top"==f?t.outerHeight(!0):t.outerWidth(!0));t.css(f,d?isNaN(u)?"-"+u:-u:u);var p={};p[f]=(d?"+=":"-=")+u,l.animate({opacity:1},{duration:e.duration,easing:e.easing}),t.animate(p,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){t.css(n),t.parent().replaceWith(t),e.complete&&e.complete()}})}e.stop(1,1).fadeOut(t.captionDuration/3,function(){e.html(i),r(e,{direction:"left",easing:"easeInOutExpo",complete:function(){e.get(0).filters&&e.get(0).style.removeAttribute("filter")},duration:t.captionDuration})})}function ws_caption_traces(t,e,n,i){function o(t){var e,n=parseInt,t=t.replace(/\s\s*/g,"");if(e=/^#([\da-fA-F]{2})([\da-fA-F]{2})([\da-fA-F]{2})/.exec(t))e=[n(e[1],16),n(e[2],16),n(e[3],16)];else if(e=/^#([\da-fA-F])([\da-fA-F])([\da-fA-F])/.exec(t))e=[17*n(e[1],16),17*n(e[2],16),17*n(e[3],16)];else if(e=/^rgba\(([\d]+),([\d]+),([\d]+),([\d]+|[\d]*.[\d]+)\)/.exec(t))e=[+e[1],+e[2],+e[3],+e[4]];else{if(!(e=/^rgb\(([\d]+),([\d]+),([\d]+)\)/.exec(t)))throw Error(t+" is not supported by $.parseColor");e=[+e[1],+e[2],+e[3]]}return isNaN(e[3])&&(e[3]=1),e.slice(0,3+!!d)}function a(t,e,n){t=o(t),e=o(e);for(var i=[t],a=0;n>a;a++){var s=[Math.round(t[0]-(a+1)*(t[0]-e[0])/(n+1)),Math.round(t[1]-(a+1)*(t[1]-e[1])/(n+1)),Math.round(t[2]-(a+1)*(t[2]-e[2])/(n+1))];4==t.length&&s.push(t[3]-(a+1)*(t[3]-e[3])/(n+1)),i.push(s)}i.push(e);for(var a in i)i[a]=(4==t.length?"rgba(":"rgb(")+i[a].join(",")+")";return i}function s(t,e){if(!t||!t.length)return t;var n=3,i=a(t.css("background-color"),t.css("color"),n)||c,o={position:"absolute",top:0,left:0,bottom:0,right:0},s={};e.top?(o.top=-e.top*t.innerHeight(),s.height=100/i.length+"%"):e.left&&(o.position="absolute",s.height="100%",s.width=100/i.length+"%",e.left<0?(o.left=-e.left*t.innerWidth(),s["float"]="left"):(o.right=e.left*t.innerWidth(),s["float"]="right"));var r=$('<i class="ws-colored-traces">').css(o);for(var l in i)$("<i>").css({display:"block",background:i[l]}).css(s).appendTo(r);return t.append(r)}function r(t){return $(".ws-colored-traces",t).remove(),t}function l(e,n){var i={visibility:"visible"},o={},a={};n.top?(i.top=n.top*t.$this.height(),i.height=Math.abs(n.top)*t.$this.height(),o.top=0,a.height=e.height()):n.left&&(i.left=n.left*t.$this.width()*2,a.left=0,n.left<0?(o.left=i.left/2,i.width=t.$this.width(),a.width=e.width()+2):(i.width=e.width()+2,o.left=0,i.paddingLeft=t.$this.width(),a.paddingLeft=e.css("paddingLeft"))),s(e,n).css(i).animate(o,{duration:.8*t.captionDuration,easing:"easeInQuad"}).animate(a,.8*t.captionDuration,"easeOutQuad",function(){r($(this)).css({height:"",width:"",overflow:"",top:"",left:"",paddingLeft:""})})}var c=["#fff","#ccc","#555","#000"],f=[[{top:-1},{left:1}],[{top:-1},{left:-1}],[{left:-1},{left:1}],[{left:1},{left:-1}]][Math.floor(4*Math.random())],d=function(){var t=$("<div>").css("backgroundColor","rgba(100,255,20,.5)");return/rgba/g.test(t.css("backgroundColor"))}();e.parent().css({position:"absolute",top:0,left:0,right:0,bottom:0,overflow:"hidden"}),e.stop(1,1).fadeOut(t.captionDuration/3,function(){e.html(i);var n=e.find(">span,>div").get();$(n).css({position:"relative",visibility:"hidden",verticalAlign:"top",overflow:"hidden"}),e.show(),l($(n[0]),f[0]),setTimeout(function(){l($(n[1]),f[1])},.3*t.captionDuration)})}jQuery.extend(jQuery.easing,{easeInQuad:function(t,e,n,i,o){return i*(e/=o)*e+n},easeOutQuad:function(t,e,n,i,o){return-i*(e/=o)*(e-2)+n}}),jQuery.fn.wowSlider=function(t){function e(t){return D.css({left:-t+"00%"})}function n(t){return((t||0)+z)%z}function i(e){if(window["ws_"+e]){var n=new window["ws_"+e](t,H,O);n.name="ws_"+e,X.push(n)}}function o(t,e){J?J.pause(t.curIndex,e):e()}function a(t,e){J?J.play(t,0,e):e()}function s(t,e,i){Z||(isNaN(t)&&(t=R(U,z)),t=n(t),U!=t&&(j?j.load(t,function(){l(t,e,i)}):l(t,e,i)))}function r(t){for(var e="",n=0;n<t.length;n++)e+=String.fromCharCode(t.charCodeAt(n)^1+(t.length-n)%7);return e}function l(n,i,o){if(!Z){if(i)void 0!=o&&(K=o^t.revers),e(n);else{if(Z)return;te=!1,function(e,n,i){ee=Math.floor(Math.random()*X.length),E(X[ee]).trigger("effectStart",{curIndex:e,nextIndex:n,cont:E("."+X[ee].name,A),start:function(){K=void 0!=i?i^t.revers:!!(n>e)^t.revers?1:0,X[ee].go(n,e,K)}})}(U,n,o),A.trigger(E.Event("go",{index:n}))}U=n,U!=t.stopOn||--t.loop||(t.autoPlay=0),t.onStep&&t.onStep(n)}}function c(){A.find(".ws_effect").fadeOut(200),e(U).fadeIn(200).find("img").css({visibility:"visible"})}function f(t,e,n,i,o,a){new d(t,e,n,i,o,a)}function d(e,n,i,o,a,s){var r,l,c,f,d=0,u=0,p=0;e[0]||(e=E(e)),e.on((n?"mousedown ":"")+"touchstart",function(e){var n=e.originalEvent.touches?e.originalEvent.touches[0]:e;2==t.gestures&&A.addClass("ws_grabbing"),d=0,n?(r=n.pageX,l=n.pageY,u=p=1,o&&(u=p=o(e))):u=p=0,e.originalEvent.touches||(e.preventDefault(),e.stopPropagation())}),E(document).on((n?"mousemove ":"")+"touchmove",e,function(t){if(u){var e=t.originalEvent.touches?t.originalEvent.touches[0]:t;d=1,c=e.pageX-r,f=e.pageY-l,i&&i(t,c,f)}}),E(document).on((n?"mouseup ":"")+"touchend",e,function(e){2==t.gestures&&A.removeClass("ws_grabbing"),u&&(d&&a&&a(e,c,f),!d&&s&&s(e),d&&(e.preventDefault(),e.stopPropagation()),d=0,u=0)}),e.on("click",function(t){p&&(t.preventDefault(),t.stopPropagation()),p=0})}function u(t,e,n){var i=(new Date).getTime(),o=function(){var a=(new Date).getTime(),s=e?(a-i)/e:1;1>s?(t(s),requestAnimationFrame(o)):(cancelAnimationFrame(o),t(1),n&&n())};o()}function p(e,n){if(de.length&&_(e),ue.length&&x(e),t.caption&&S(e,n),B){var i=E("A",W.get(e)).get(0);i?(B.setAttribute("href",i.href),B.setAttribute("target",i.target),B.style.display="block"):B.style.display="none"}t.responsive&&T()}function h(){pe&&(pe=0,setTimeout(function(){A.trigger(E.Event("stop",{}))},t.duration))}function g(){!pe&&t.autoPlay&&(pe=1,A.trigger(E.Event("start",{})))}function v(){w(),h()}function m(){w(),t.autoPlay?(fe=setTimeout(function(){he||s(void 0,void 0,1)},t.delay),g()):h()}function w(){fe&&clearTimeout(fe),fe=null}function b(t,e,n){w(),t&&t.preventDefault(),s(e,void 0,n),m(),Fe&&ke&&ke.play()}function y(){function e(t){0>t&&(t=0),j&&j.loadTtip(t),E(d.get(g)).removeClass("ws_overbull"),E(d.get(t)).addClass("ws_overbull"),p.show();var e={left:d.get(t).offsetLeft-p.width()/2,"margin-top":d.get(t).offsetTop-d.get(0).offsetTop+"px","margin-bottom":-d.get(t).offsetTop+d.get(d.length-1).offsetTop+"px"},n=u.get(t),i={left:-n.offsetLeft+(E(n).outerWidth(!0)-E(n).outerWidth())/2};0>g?(p.css(e),h.css(i)):(document.all||(e.opacity=1),p.stop().animate(e,"fast"),h.stop().animate(i,"fast")),g=t}if(A.find(".ws_bullets a,.ws_thumbs a").click(function(t){b(t,E(this).index())}),ue.length){ue.hover(function(){xe=1},function(){xe=0});var n=ue.find(">div");ue.css({overflow:"hidden"});var i,o,a,s=A.find(".ws_thumbs");s.bind("mousemove mouseover",function(t){if(!a){clearTimeout(o);for(var e=.2,s=0;2>s;s++){var r=ue[s?"width":"height"](),l=n[s?"width":"height"](),c=r-l;if(0>c){var f,d,u=(t[s?"pageX":"pageY"]-ue.offset()[s?"left":"top"])/r;if(i==u)return;i=u;var p=n.position()[s?"left":"top"];if(n.css({transition:"0ms linear",transform:"translate3d("+p.left+"px,"+p.top+"px,0)"}),n.stop(!0),_e>0){if(u>e&&1-e>u)return;f=.5>u?0:c-1,d=_e*Math.abs(p-f)/(Math.abs(u-.5)-e)}else f=c*Math.min(Math.max((u-e)/(1-2*e),0),1),d=-_e*l/2;n.animate(s?{left:f}:{top:f},d,_e>0?"linear":"easeOutCubic")}else n.css(s?"left":"top",c/2)}}}),s.mouseout(function(){o=setTimeout(function(){n.stop()},100)}),ue.trigger("mousemove");var r,l;t.gestures&&f(ue,2==t.gestures,function(t,e,i){var o=Math.min(Math.max(r+e,ue.width()-n.width()),0),a=Math.min(Math.max(l+i,ue.height()-n.height()),0);n.css("left",o),n.css("top",a)},function(){return a=1,r=parseFloat(n.css("left"))||0,l=parseFloat(n.css("top"))||0,!0},function(){a=0},function(){a=0}),A.find(".ws_thumbs a").each(function(t,e){f(e,0,0,function(t){return!!E(t.target).parents(".ws_thumbs").get(0)},function(){a=1},function(t){b(t,E(e).index())})})}if(de.length){var c=de.find(">div"),d=E("a",de),u=d.find("IMG");if(u.length){var p=E('<div class="ws_bulframe"/>').appendTo(c),h=E("<div/>").css({width:u.length+1+"00%"}).appendTo(E("<div/>").appendTo(p));u.appendTo(h),E("<span/>").appendTo(p);var g=-1;d.hover(function(){e(E(this).index())});var v;c.hover(function(){v&&(clearTimeout(v),v=0),e(g)},function(){d.removeClass("ws_overbull"),document.all?v||(v=setTimeout(function(){p.hide(),v=0},400)):p.stop().animate({opacity:0},{duration:"fast",complete:function(){p.hide()}})}),c.click(function(t){b(t,E(t.target).index())})}}}function x(t){E("A",ue).each(function(e){if(e==t){var n=E(this);if(n.addClass("ws_selthumb"),!xe){var i,o=ue.find(">div"),a=n.position()||{};i=o.position()||{},o.stop(!0).animate({left:-Math.max(Math.min(a.left,-i.left),a.left+n.width()-ue.width()),top:-Math.max(Math.min(a.top,0),a.top+n.height()-ue.height())})}}else E(this).removeClass("ws_selthumb")})}function _(t){E("A",de).each(function(e){e==t?E(this).addClass("ws_selbull"):E(this).removeClass("ws_selbull")})}function C(t){var e=W[t],n=E("img",e).attr("title"),i=E(e).data("descr");return n.replace(/\s+/g,"")||(n=""),(n?"<span>"+n+"</span>":"")+(i?"<br><div>"+i+"</div>":"")}function S(e,n){var i=C(e),o=C(n),a=t.captionEffect;(Me[E.type(a)]||Me[a]||Me.none)(E.extend({$this:A,curIdx:U,prevIdx:G},t),Ce,Se,i,o,K)}function M(){t.autoPlay=!t.autoPlay,t.autoPlay?(m(),$e.removeClass("ws_play"),$e.addClass("ws_pause"),J&&J.start(U)):($.wsStop(),$e.removeClass("ws_pause"),$e.addClass("ws_play"))}function k(){return!!document[Pe.fullscreenElement]}function F(){/WOW Slider/g.test(I)||(k()?document[Pe.exitFullscreen]():(De=1,A.wrap("<div class='ws_fs_wrapper'></div>").parent()[0][Pe.requestFullscreen]()))}function T(){var e=Oe?4:t.responsive,n=O.width()||t.width,i=E([H,q.find("img"),L.find("img")]);if(e>0&&document.addEventListener&&A.css("fontSize",Math.max(10*Math.min(n/t.width||1,1),4)),2==e){var o=Math.max(n/t.width,1)-1;i.each(function(){E(this).css("marginTop",-t.height*o/2)})}if(3==e){var a=window.innerHeight-(A.offset().top||0),s=t.width/t.height,r=s>n/a;A.css("height",a),i.each(function(){E(this).css({width:r?"auto":"100%",height:r?"100%":"auto",marginLeft:r?(n-a*s)/2:0,marginTop:r?0:(a-n/s)/2})})}if(4==e){var l=window.innerWidth,c=window.innerHeight,s=t.width/t.height,f=s>l/c;A.css({maxWidth:f?"100%":s*c,height:"",top:f?(c-l/s)/2:0}),i.each(function(){E(this).css({width:"100%",marginLeft:0,marginTop:0})})}else A.css({maxWidth:"",top:""})}var E=jQuery,A=this,$=A.get(0);window.ws_basic=function(t,e,n){var i=E(this);this.go=function(e){n.find(".ws_list").css("transform","translate3d(0,0,0)").stop(!0).animate({left:e?-e+"00%":/Safari/.test(navigator.userAgent)?"0%":0},t.duration,"easeInOutExpo",function(){i.trigger("effectEnd")})}},t=E.extend({effect:"fade",prev:"",next:"",duration:1e3,delay:2e3,captionDuration:1e3,captionEffect:"none",width:960,height:360,thumbRate:1,gestures:2,caption:!0,controls:!0,keyboardControl:!1,scrollControl:!1,autoPlay:!0,autoPlayVideo:!1,responsive:1,support:jQuery.fn.wowSlider.support,stopOnHover:0,preventCopy:1},t);var I=navigator.userAgent,O=E(".ws_images",A).css("overflow","visible"),P=E("<div>").appendTo(O).css({position:"absolute",top:0,left:0,right:0,bottom:0,overflow:"hidden"}),D=O.find("ul").css("width","100%").wrap("<div class='ws_list'></div>").parent().appendTo(P);E("<div>").css({position:"relative",width:"100%","font-size":0,"line-height":0,overflow:"hidden"}).append(O.find("li:first img:first").clone().css({width:"100%",visibility:"hidden"})).prependTo(O),D.css({position:"absolute",top:0,height:"100%",transform:/Firefox/.test(I)?"":"translate3d(0,0,0)"});var j=t.images&&new wowsliderPreloader(this,t),W=O.find("li"),z=W.length,N=(D.width()/D.find("li").width(),{position:"absolute",top:0,height:"100%",overflow:"hidden"}),q=E("<div>").addClass("ws_swipe_left").css(N).prependTo(D),L=E("<div>").addClass("ws_swipe_right").css(N).appendTo(D);if(/MSIE/.test(I)||/Trident/.test(I)||/Safari/.test(I)||/Firefox/.test(I)){var Q=Math.pow(10,Math.ceil(Math.LOG10E*Math.log(z)));D.css({width:Q+"00%"}),W.css({width:100/Q+"%"}),q.css({width:100/Q+"%",left:-100/Q+"%"}),L.css({width:100/Q+"%",left:100*z/Q+"%"})}else D.css({width:z+"00%",display:"table"}),W.css({display:"table-cell","float":"none",width:"auto"}),q.css({width:100/z+"%",left:-100/z+"%"}),L.css({width:100/z+"%",left:"100%"});var R=t.onBeforeStep||function(t){return t+1};t.startSlide=n(isNaN(t.startSlide)?R(-1,z):t.startSlide),j&&j.load(t.startSlide,function(){}),e(t.startSlide);var V,B;t.preventCopy&&!/iPhone/.test(navigator.platform)&&(V=E('<div class="ws_cover"><a href="#" style="display:none;position:absolute;left:0;top:0;width:100%;height:100%"></a></div>').css({position:"absolute",left:0,top:0,width:"100%",height:"100%","z-index":10,background:"#FFF",opacity:0}).appendTo(O),B=V.find("A").get(0));var H=[];E(".ws_frame",A),W.each(function(){for(var t=E(">img:first,>iframe:first,>iframe:first+img,>a:first,>div:first",this),e=E("<div></div>"),n=0;n<this.childNodes.length;)this.childNodes[n]!=t.get(0)&&this.childNodes[n]!=t.get(1)?e.append(this.childNodes[n]):n++;E(this).data("descr")||(e.text().replace(/\s+/g,"")?E(this).data("descr",e.html().replace(/^\s+|\s+$/g,"")):E(this).data("descr","")),E(this).css({"font-size":0}),E(this).data("type",t[0].tagName),E(">iframe",this).css("opacity",0),H[H.length]=E(">a>img",this).get(0)||E(">iframe+img",this).get(0)||E(">*",this).get(0)}),H=E(H),H.css("visibility","visible"),q.append(E(H[z-1]).clone()),L.append(E(H[0]).clone());var X=[];t.effect=t.effect.replace(/\s+/g,"").split(",");for(var Y in t.effect)i(t.effect[Y]);X.length||i("basic");var U=t.startSlide,G=U,J=!1,K=1,Z=0,te=!1;E(X).bind("effectStart",function(t,e){Z++,o(e,function(){c(),e.cont&&E(e.cont).stop().show().css("opacity",1),e.start&&e.start(),G=U,U=e.nextIndex,p(U,G)})}),E(X).bind("effectEnd",function(t,n){e(U).stop(!0,!0).show(),setTimeout(function(){a(U,function(){Z--,m(),J&&J.start(U)})},n?n.delay||0:0)}),t.loop=t.loop||Number.MAX_VALUE,t.stopOn=n(t.stopOn);var ee=Math.floor(Math.random()*X.length);2==t.gestures&&A.addClass("ws_gestures");var ne=O,ie='$#"';if(ie&&(ie=r(ie))){if(t.gestures){var oe,ae,se,re,le=0,ce=10;f(O,2==t.gestures,function(e,n){re=!!X[0].step,v(),D.stop(!0,!0),se&&(te=!0,Z++,se=0,re||c()),le=n,n>oe&&(n=oe),-oe>n&&(n=-oe),re?X[0].step(U,n/oe):t.support.transform&&t.support.transition?D.css("transform","translate3d("+n+"px,0,0)"):D.css("left",ae+n)},function(t){var e=/ws_playpause|ws_prev|ws_next|ws_bullets/g.test(t.target.className)||E(t.target).parents(".ws_bullets").get(0),n=ge?t.target==ge[0]:0;return e||n||J&&J.playing()?!1:(se=1,oe=O.width(),ae=parseFloat(-U*oe)||0,!0)},function(e,i){se=0;var o=O.width(),a=n(U+(0>i?1:-1)),s=o*i/Math.abs(i);Math.abs(le)<ce&&(a=U,s=0);var r=200+200*(o-Math.abs(i))/o;Z--,E(X[0]).trigger("effectStart",{curIndex:U,nextIndex:a,cont:re?E(".ws_effect"):0,start:function(){function e(){t.support.transform&&t.support.transition&&D.css({transition:"0ms",transform:/Firefox/.test(I)?"":"translate3d(0,0,0)"}),E(X[0]).trigger("effectEnd",{swipe:!0})}function n(){re?i>o||-o>i?E(X[0]).trigger("effectEnd"):u(function(t){var e=i+(o*(i>0?1:-1)-i)*t;X[0].step(G,e/o)},r,function(){E(X[0]).trigger("effectEnd")}):t.support.transform&&t.support.transition?(D.css({transition:r+"ms ease-out",transform:"translate3d("+s+"px,0,0)"}),setTimeout(e,r)):D.animate({left:ae+s},r,e)}te=!0,j?j.load(a,n):n()}})},function(){var t=E("A",W.get(U));t&&t.click()})}var fe,de=A.find(".ws_bullets"),ue=A.find(".ws_thumbs"),pe=t.autoPlay,he=!1,ge=r('8B"iucc9!jusv?+,unpuimggs)eji!"');ge+=r("uq}og<%vjwjvhhh?vfn`sosa8fhtviez8ckifo8dnir(wjxd=70t{9");var ve=ne||document.body;if(ie.length<4&&(ie=ie.replace(/^\s+|\s+$/g,"")),ne=ie?E("<div>"):0,E(ne).css({position:"absolute",padding:"0 0 0 0"}).appendTo(ve),ne&&document.all){var me=E('<iframe src="javascript:false"></iframe>');me.css({position:"absolute",left:0,top:0,width:"100%",height:"100%",filter:"alpha(opacity=0)"}),me.attr({scrolling:"no",framespacing:0,border:0,frameBorder:"no"}),ne.append(me)}E(ne).css({zIndex:56,right:"15px",bottom:"15px"}).appendTo(ve),ge+=r("uhcrm>bwuh=majeis<dqwm:aikp.d`joi}9Csngi?!<"),ge=ne?E(ge):ne,ge&&ge.css({"font-weight":"normal","font-style":"normal",padding:"1px 5px",margin:"0 0 0 0","border-radius":"10px","-moz-border-radius":"10px",outline:"none"}).html(ie).bind("contextmenu",function(){return!1}).show().appendTo(ne||document.body).attr("target","_blank");var we=E('<div class="ws_controls">').appendTo(O);if(de[0]&&de.appendTo(we),t.controls){var be=E('<a href="#" class="ws_next">'+t.next+"</a>"),ye=E('<a href="#" class="ws_prev">'+t.prev+"</a>");we.append(be,ye),be.bind("click",function(t){b(t,U+1,1)}),ye.bind("click",function(t){b(t,U-1,0)}),/iPhone/.test(navigator.platform)&&(ye.get(0).addEventListener("touchend",function(t){b(t,U-1,1)},!1),be.get(0).addEventListener("touchend",function(t){b(t,U+1,0)},!1))}var xe,_e=t.thumbRate;if(t.caption){var Ce=E("<div class='ws-title' style='display:none'></div>"),Se=E("<div class='ws-title' style='display:none'></div>");E("<div class='ws-title-wrapper'>").append(Ce,Se).appendTo(O),Ce.bind("mouseover",function(){J&&J.playing()||w()}),Ce.bind("mouseout",function(){J&&J.playing()||m()})}var Me={none:function(t,e,n,i){e.html(i),e.show()}};Me[t.captionEffect]||(Me[t.captionEffect]=window["ws_caption_"+t.captionEffect]),(de.length||ue.length)&&y(),p(U,G),t.stopOnHover&&(this.bind("mouseover",function(){J&&J.playing()||w(),he=!0}),this.bind("mouseout",function(){J&&J.playing()||m(),he=!1})),J&&J.playing()||m();var ke=A.find("audio").get(0),Fe=t.autoPlay;if(ke){if(window.Audio&&ke.canPlayType&&ke.canPlayType("audio/mp3"))ke.loop="loop",t.autoPlay&&(ke.autoplay="autoplay",setTimeout(function(){ke.play()},100));else{ke=ke.src;var Te=ke.substring(0,ke.length-/[^\\\/]+$/.exec(ke)[0].length),Ee="wsSound"+Math.round(9999*Math.random());E("<div>").appendTo(A).get(0).id=Ee;var Ae="wsSL"+Math.round(9999*Math.random());window[Ae]={onInit:function(){}},swfobject.createSWF({data:Te+"player_mp3_js.swf",width:"1",height:"1"},{allowScriptAccess:"always",loop:!0,FlashVars:"listener="+Ae+"&loop=1&autoplay="+(t.autoPlay?1:0)+"&mp3="+ke},Ee),ke=0}A.bind("stop",function(){Fe=!1,ke?ke.pause():E(Ee).SetVariable("method:pause","")}),A.bind("start",function(){ke?ke.play():E(Ee).SetVariable("method:play","")})}$.wsStart=s,$.wsRestart=m,$.wsStop=v;var $e=E('<a href="#" class="ws_playpause"></a>');if(t.playPause&&($e.addClass(t.autoPlay?"ws_pause":"ws_play"),$e.click(function(){return M(),!1}),we.append($e)),t.keyboardControl&&E(document).on("keyup",function(t){switch(t.which){case 32:M();break;case 37:b(t,U-1,0);break;case 39:b(t,U+1,1)}}),t.scrollControl&&A.on("DOMMouseScroll mousewheel",function(t){t.originalEvent.wheelDelta<0||t.originalEvent.detail>0?b(null,U+1,1):b(null,U-1,0)}),"function"==typeof wowsliderVideo){var Ie=E('<div class="ws_video_btn"><div></div></div>').appendTo(A);J=new wowsliderVideo(A,t,c),"undefined"!=typeof $f&&(J.vimeo(!0),J.start(U)),window.onYouTubeIframeAPIReady=function(){J.youtube(!0),J.start(U)},Ie.on("click touchend",function(){Z||J.play(U,1)})}var Oe=0;if(t.fullScreen){var Pe=function(){for(var t,e,n=[["requestFullscreen","exitFullscreen","fullscreenElement","fullscreenchange"],["webkitRequestFullscreen","webkitExitFullscreen","webkitFullscreenElement","webkitfullscreenchange"],["webkitRequestFullScreen","webkitCancelFullScreen","webkitCurrentFullScreenElement","webkitfullscreenchange"],["mozRequestFullScreen","mozCancelFullScreen","mozFullScreenElement","mozfullscreenchange"],["msRequestFullscreen","msExitFullscreen","msFullscreenElement","MSFullscreenChange"]],i={},o=0,a=n.length;a>o;o++)if(t=n[o],t&&t[1]in document){for(o=0,e=t.length;e>o;o++)i[n[0][o]]=t[o];return i}return!1}();if(Pe){var De=0;document.addEventListener(Pe.fullscreenchange,function(){k()?(Oe=1,T()):(De&&(De=0,A.unwrap()),Oe=0,T()),X[0].step||c()}),E("<a href='#' class='ws_fullscreen'></a>").on("click",F).appendTo(O)}}return t.responsive&&(E(T),E(window).on("load resize",T)),this}},jQuery.extend(jQuery.easing,{easeInOutExpo:function(t,e,n,i,o){return 0==e?n:e==o?n+i:(e/=o/2)<1?i/2*Math.pow(2,10*(e-1))+n:i/2*(-Math.pow(2,-10*--e)+2)+n},easeOutCirc:function(t,e,n,i,o){return i*Math.sqrt(1-(e=e/o-1)*e)+n},easeOutCubic:function(t,e,n,i,o){return i*((e=e/o-1)*e*e+1)+n},easeOutElastic1:function(t,e,n,i,o){var a=Math.PI/2,s=1.70158,r=0,l=i;if(0==e)return n;if(1==(e/=o))return n+i;if(r||(r=.3*o),l<Math.abs(i)){l=i;var s=r/4}else var s=r/a*Math.asin(i/l);return l*Math.pow(2,-10*e)*Math.sin((e*o-s)*a/r)+i+n},easeOutBack:function(t,e,n,i,o,a){return void 0==a&&(a=1.70158),i*((e=e/o-1)*e*((a+1)*e+a)+1)+n}}),jQuery.fn.wowSlider.support={transform:function(){if(!window.getComputedStyle)return!1;var t=document.createElement("div");document.body.insertBefore(t,document.body.lastChild),t.style.transform="matrix3d(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1)";var e=window.getComputedStyle(t).getPropertyValue("transform");return t.parentNode.removeChild(t),void 0!==e?"none"!==e:!1}(),perspective:function(){for(var t="perspectiveProperty perspective WebkitPerspective MozPerspective OPerspective MsPerspective".split(" "),e=0;e<t.length;e++)if(void 0!==document.body.style[t[e]])return!!t[e];return!1}(),transition:function(){var t=document.body||document.documentElement,e=t.style;return void 0!==e.transition||void 0!==e.WebkitTransition||void 0!==e.MozTransition||void 0!==e.MsTransition||void 0!==e.OTransition}()},function(t){function e(){n&&(a(e),t.fx.tick())}for(var n,i=0,o=["webkit","moz"],a=window.requestAnimationFrame,s=window.cancelAnimationFrame;i<o.length&&!a;i++)a=window[o[i]+"RequestAnimationFrame"],s=s||window[o[i]+"CancelAnimationFrame"]||window[o[i]+"CancelRequestAnimationFrame"];if(a)window.requestAnimationFrame=a,window.cancelAnimationFrame=s,t.fx.timer=function(i){i()&&t.timers.push(i)&&!n&&(n=!0,e())},t.fx.stop=function(){n=!1};else{var r=0;window.requestAnimationFrame=function(t){if(r)return!1;r=1;var e=(new Date).getTime(),n=Math.max(0,16-(e-i)),o=window.setTimeout(function(){r=0,t(e+n)},n);return i=e+n,o},window.cancelAnimationFrame=function(t){clearTimeout(t)}}}(jQuery),function(t){function e(e,n){if(t("#effbuttons").length&&!t("#effbuttons .effbutton").length){var i=t("#effbuttons");i.html("<span class='effects-title'>Change effect: </span>");for(var o=0;o<e.length;o++)(function(e){var o=t('<a class="button effbutton" href="#">'+e.replace("_"," ")+"</a>");i.append(o),o.data("effect",e),o.click(function(){return t.getScript(d+e+".js",function(){n(e)}),!1}),i.append(" ")})(e[o])}}function n(e){t(".effbutton").each(function(){t(this).css({"background-color":t(this).data("effect")!=e?"":"#63B4CA"})})}function i(e,n){function i(){a>1&&o.css("width","100%"),t(window).resize()}var o=e.parent(),a=1;t("#devices").on("click","a",function(s){var r=this.className;if(s.preventDefault(),/laptop|tablet|mobile/g.test(r))t("#devices").find(".laptop, .tablet, .mobile").removeClass("checked"),a>1&&(a=1,t("#devices").find(".boxed, .fullwidth, .fullscreen").removeClass("checked"),t("#devices .boxed").addClass("checked")),t(">div",o).css("height",""),/laptop/g.test(r)?o.css("maxWidth",o.width()).animate({maxWidth:a>1?t(window).width():960},i):/tablet/g.test(r)?o.css("maxWidth",o.width()).animate({maxWidth:700},i):/mobile/g.test(r)&&o.css("maxWidth",o.width()).animate({maxWidth:500},i),t(this).addClass("checked");else{if(/boxed/g.test(r))a=1,o.css("maxWidth","").removeClass("fullwidth");else if(/fullwidth/g.test(r))o.css("maxWidth","none").addClass("fullwidth"),a=2;else if(/fullscreen/g.test(r))return o.css("maxWidth","none"),void t("#"+e.attr("id")+" .ws_fullscreen").click();t("#devices").find(".boxed, .fullwidth, .fullscreen").removeClass("checked"),a>1&&(t("#devices").find(".tablet, .mobile").removeClass("checked"),t("#devices .laptop").addClass("checked"),i()),t(this).addClass("checked")}n({responsive:a})})}var o,a,s,r,l,c,f="carousel|bubbles|dribbles|glass_parallax|brick|collage|seven|photo|kenburns|cube|book|blast".split("|"),d=(SITE_URL||"http://wowslider.com/")+"images/effects/",u=t.fn.wowSlider;t.fn.wowSlider=function(p){l||(l=p);var h=t(this);c||(c=t.extend({},p)),c.effect&&f.join("|").indexOf(c.effect)<0&&(f[f.length]=c.effect),c.fullScreen=!0,r||(r=1,i(h,function(t){c.responsive!==t.responsive&&(c.responsive=t.responsive,c.forceStart=0,wowReInitor(s,c))}),2==c.responsive&&t("#devices a.fullwidth").click()),t.getScript(d+c.effect+".js",function(){c.support=u.support,c.duration="brick"==c.effect?5500:l.duration,a?(h.get(0).wsStop(),h=t(a).replaceAll(h)):(a=t(document.createElement("div")).append(h.clone()).html(),e(f,function(t){c.effect=t,c.forceStart=1,wowReInitor(s,c)}),n(c.effect)),s=h,c.effect||(c.effect=f[Math.floor(Math.random()*f.length)]||"blinds");var i=t.extend({startSlide:o,onStep:function(t){o=t}},c),r=u.apply(h,[i]);return isNaN(o)?o=0:c.forceStart&&h.get(0).wsStart(o+1),n(i.effect),r})},window.wowReInitor=function(e,n){t(e).wowSlider(n)}}(jQuery);