var initPhotoSwipeFromDOM=function(e){for(var t=function(e){(e=e||window.event).preventDefault?e.preventDefault():e.returnValue=!1;var t=function e(t,n){return t&&(n(t)?t:e(t.parentNode,n))}(e.target||e.srcElement,function(e){return e.tagName&&"FIGURE"===e.tagName.toUpperCase()});if(t){for(var r,i=t.parentNode,o=t.parentNode.childNodes,a=o.length,l=0,d=0;d<a;d++)if(1===o[d].nodeType){if(o[d]===t){r=l;break}l++}return r>=0&&n(r,i),!1}},n=function(e,t,n,r){var i,o,a=document.querySelectorAll(".pswp")[0];if(o=function(e){for(var t,n,r,i,o=e.childNodes,a=o.length,l=[],d=0;d<a;d++)1===(t=o[d]).nodeType&&(r=(n=t.children[0]).getAttribute("data-size").split("x"),i={src:n.getAttribute("href"),w:parseInt(r[0],10),h:parseInt(r[1],10)},t.children.length>1&&(i.title=t.children[1].innerHTML),n.children.length>0&&(i.msrc=n.children[0].getAttribute("src")),i.el=t,l.push(i));return l}(t),i={showHideOpacity:!0,galleryUID:t.getAttribute("data-pswp-uid"),getThumbBoundsFn:function(e){var t=o[e].el.getElementsByTagName("img")[0],n=window.pageYOffset||document.documentElement.scrollTop,r=t.getBoundingClientRect();return{x:r.left,y:r.top+n,w:r.width}}},r)if(i.galleryPIDs){for(var l=0;l<o.length;l++)if(o[l].pid==e){i.index=l;break}}else i.index=parseInt(e,10)-1;else i.index=parseInt(e,10);isNaN(i.index)||(n&&(i.showAnimationDuration=0),new PhotoSwipe(a,PhotoSwipeUI_Default,o,i).init())},r=document.querySelectorAll(e),i=0,o=r.length;i<o;i++)r[i].setAttribute("data-pswp-uid",i+1),r[i].onclick=t;var a=function(){var e=window.location.hash.substring(1),t={};if(e.length<5)return t;for(var n=e.split("&"),r=0;r<n.length;r++)if(n[r]){var i=n[r].split("=");i.length<2||(t[i[0]]=i[1])}return t.gid&&(t.gid=parseInt(t.gid,10)),t}();a.pid&&a.gid&&n(a.pid,r[a.gid-1],!0,!0)};initPhotoSwipeFromDOM(".my-gallery");