(window.webpackJsonp=window.webpackJsonp||[]).push([[92],{"4LiD":function(t,e,n){"use strict";var r=n("dyZX"),o=n("XKFU"),i=n("KroJ"),s=n("3Lyj"),c=n("Z6vF"),u=n("SlkY"),a=n("9gX7"),h=n("0/R4"),f=n("eeVq"),l=n("XMVh"),p=n("fyDq"),d=n("Xbzi");t.exports=function(t,e,n,v,g,_){var b=r[t],y=b,m=g?"set":"add",w=y&&y.prototype,I={},E=function(t){var e=w[t];i(w,t,"delete"==t||"has"==t?function(t){return!(_&&!h(t))&&e.call(this,0===t?0:t)}:"get"==t?function(t){return _&&!h(t)?void 0:e.call(this,0===t?0:t)}:"add"==t?function(t){return e.call(this,0===t?0:t),this}:function(t,n){return e.call(this,0===t?0:t,n),this})};if("function"==typeof y&&(_||w.forEach&&!f((function(){(new y).entries().next()})))){var T=new y,R=T[m](_?{}:-0,1)!=T,O=f((function(){T.has(1)})),M=l((function(t){new y(t)})),k=!_&&f((function(){for(var t=new y,e=5;e--;)t[m](e,e);return!t.has(-0)}));M||((y=e((function(e,n){a(e,y,t);var r=d(new b,e,y);return null!=n&&u(n,g,r[m],r),r}))).prototype=w,w.constructor=y),(O||k)&&(E("delete"),E("has"),g&&E("get")),(k||R)&&E(m),_&&w.clear&&delete w.clear}else y=v.getConstructor(e,t,g,m),s(y.prototype,n),c.NEED=!0;return p(y,t),I[t]=y,o(o.G+o.W+o.F*(y!=b),I),_||v.setStrong(y,t,g),y}},"9AAn":function(t,e,n){"use strict";var r=n("wmvG"),o=n("s5qY");t.exports=n("4LiD")("Map",(function(t){return function(){return t(this,arguments.length>0?arguments[0]:void 0)}}),{get:function(t){var e=r.getEntry(o(this,"Map"),t);return e&&e.v},set:function(t,e){return r.def(o(this,"Map"),0===t?0:t,e)}},r,!0)},T39b:function(t,e,n){"use strict";var r=n("wmvG"),o=n("s5qY");t.exports=n("4LiD")("Set",(function(t){return function(){return t(this,arguments.length>0?arguments[0]:void 0)}}),{add:function(t){return r.def(o(this,"Set"),t=0===t?0:t,t)}},r)},Wr5T:function(t,e){!function(t,e){"use strict";if("IntersectionObserver"in t&&"IntersectionObserverEntry"in t&&"intersectionRatio"in t.IntersectionObserverEntry.prototype)"isIntersecting"in t.IntersectionObserverEntry.prototype||Object.defineProperty(t.IntersectionObserverEntry.prototype,"isIntersecting",{get:function(){return this.intersectionRatio>0}});else{var n=[];o.prototype.THROTTLE_TIMEOUT=100,o.prototype.POLL_INTERVAL=null,o.prototype.USE_MUTATION_OBSERVER=!0,o.prototype.observe=function(t){if(!this._observationTargets.some((function(e){return e.element==t}))){if(!t||1!=t.nodeType)throw new Error("target must be an Element");this._registerInstance(),this._observationTargets.push({element:t,entry:null}),this._monitorIntersections(),this._checkForIntersections()}},o.prototype.unobserve=function(t){this._observationTargets=this._observationTargets.filter((function(e){return e.element!=t})),this._observationTargets.length||(this._unmonitorIntersections(),this._unregisterInstance())},o.prototype.disconnect=function(){this._observationTargets=[],this._unmonitorIntersections(),this._unregisterInstance()},o.prototype.takeRecords=function(){var t=this._queuedEntries.slice();return this._queuedEntries=[],t},o.prototype._initThresholds=function(t){var e=t||[0];return Array.isArray(e)||(e=[e]),e.sort().filter((function(t,e,n){if("number"!=typeof t||isNaN(t)||t<0||t>1)throw new Error("threshold must be a number between 0 and 1 inclusively");return t!==n[e-1]}))},o.prototype._parseRootMargin=function(t){var e=(t||"0px").split(/\s+/).map((function(t){var e=/^(-?\d*\.?\d+)(px|%)$/.exec(t);if(!e)throw new Error("rootMargin must be specified in pixels or percent");return{value:parseFloat(e[1]),unit:e[2]}}));return e[1]=e[1]||e[0],e[2]=e[2]||e[0],e[3]=e[3]||e[1],e},o.prototype._monitorIntersections=function(){this._monitoringIntersections||(this._monitoringIntersections=!0,this.POLL_INTERVAL?this._monitoringInterval=setInterval(this._checkForIntersections,this.POLL_INTERVAL):(i(t,"resize",this._checkForIntersections,!0),i(e,"scroll",this._checkForIntersections,!0),this.USE_MUTATION_OBSERVER&&"MutationObserver"in t&&(this._domObserver=new MutationObserver(this._checkForIntersections),this._domObserver.observe(e,{attributes:!0,childList:!0,characterData:!0,subtree:!0}))))},o.prototype._unmonitorIntersections=function(){this._monitoringIntersections&&(this._monitoringIntersections=!1,clearInterval(this._monitoringInterval),this._monitoringInterval=null,s(t,"resize",this._checkForIntersections,!0),s(e,"scroll",this._checkForIntersections,!0),this._domObserver&&(this._domObserver.disconnect(),this._domObserver=null))},o.prototype._checkForIntersections=function(){var e=this._rootIsInDom(),n=e?this._getRootRect():{top:0,bottom:0,left:0,right:0,width:0,height:0};this._observationTargets.forEach((function(o){var i=o.element,s=c(i),u=this._rootContainsTarget(i),a=o.entry,h=e&&u&&this._computeTargetAndRootIntersection(i,n),f=o.entry=new r({time:t.performance&&performance.now&&performance.now(),target:i,boundingClientRect:s,rootBounds:n,intersectionRect:h});a?e&&u?this._hasCrossedThreshold(a,f)&&this._queuedEntries.push(f):a&&a.isIntersecting&&this._queuedEntries.push(f):this._queuedEntries.push(f)}),this),this._queuedEntries.length&&this._callback(this.takeRecords(),this)},o.prototype._computeTargetAndRootIntersection=function(n,r){if("none"!=t.getComputedStyle(n).display){for(var o,i,s,u,h,f,l,p,d=c(n),v=a(n),g=!1;!g;){var _=null,b=1==v.nodeType?t.getComputedStyle(v):{};if("none"==b.display)return;if(v==this.root||v==e?(g=!0,_=r):v!=e.body&&v!=e.documentElement&&"visible"!=b.overflow&&(_=c(v)),_&&(o=_,i=d,s=void 0,u=void 0,h=void 0,f=void 0,l=void 0,p=void 0,s=Math.max(o.top,i.top),u=Math.min(o.bottom,i.bottom),h=Math.max(o.left,i.left),f=Math.min(o.right,i.right),p=u-s,!(d=(l=f-h)>=0&&p>=0&&{top:s,bottom:u,left:h,right:f,width:l,height:p})))break;v=a(v)}return d}},o.prototype._getRootRect=function(){var t;if(this.root)t=c(this.root);else{var n=e.documentElement,r=e.body;t={top:0,left:0,right:n.clientWidth||r.clientWidth,width:n.clientWidth||r.clientWidth,bottom:n.clientHeight||r.clientHeight,height:n.clientHeight||r.clientHeight}}return this._expandRectByRootMargin(t)},o.prototype._expandRectByRootMargin=function(t){var e=this._rootMarginValues.map((function(e,n){return"px"==e.unit?e.value:e.value*(n%2?t.width:t.height)/100})),n={top:t.top-e[0],right:t.right+e[1],bottom:t.bottom+e[2],left:t.left-e[3]};return n.width=n.right-n.left,n.height=n.bottom-n.top,n},o.prototype._hasCrossedThreshold=function(t,e){var n=t&&t.isIntersecting?t.intersectionRatio||0:-1,r=e.isIntersecting?e.intersectionRatio||0:-1;if(n!==r)for(var o=0;o<this.thresholds.length;o++){var i=this.thresholds[o];if(i==n||i==r||i<n!=i<r)return!0}},o.prototype._rootIsInDom=function(){return!this.root||u(e,this.root)},o.prototype._rootContainsTarget=function(t){return u(this.root||e,t)},o.prototype._registerInstance=function(){n.indexOf(this)<0&&n.push(this)},o.prototype._unregisterInstance=function(){var t=n.indexOf(this);-1!=t&&n.splice(t,1)},t.IntersectionObserver=o,t.IntersectionObserverEntry=r}function r(t){this.time=t.time,this.target=t.target,this.rootBounds=t.rootBounds,this.boundingClientRect=t.boundingClientRect,this.intersectionRect=t.intersectionRect||{top:0,bottom:0,left:0,right:0,width:0,height:0},this.isIntersecting=!!t.intersectionRect;var e=this.boundingClientRect,n=e.width*e.height,r=this.intersectionRect,o=r.width*r.height;this.intersectionRatio=n?o/n:this.isIntersecting?1:0}function o(t,e){var n,r,o,i=e||{};if("function"!=typeof t)throw new Error("callback must be a function");if(i.root&&1!=i.root.nodeType)throw new Error("root must be an Element");this._checkForIntersections=(n=this._checkForIntersections.bind(this),r=this.THROTTLE_TIMEOUT,o=null,function(){o||(o=setTimeout((function(){n(),o=null}),r))}),this._callback=t,this._observationTargets=[],this._queuedEntries=[],this._rootMarginValues=this._parseRootMargin(i.rootMargin),this.thresholds=this._initThresholds(i.threshold),this.root=i.root||null,this.rootMargin=this._rootMarginValues.map((function(t){return t.value+t.unit})).join(" ")}function i(t,e,n,r){"function"==typeof t.addEventListener?t.addEventListener(e,n,r||!1):"function"==typeof t.attachEvent&&t.attachEvent("on"+e,n)}function s(t,e,n,r){"function"==typeof t.removeEventListener?t.removeEventListener(e,n,r||!1):"function"==typeof t.detatchEvent&&t.detatchEvent("on"+e,n)}function c(t){var e;try{e=t.getBoundingClientRect()}catch(t){}return e?(e.width&&e.height||(e={top:e.top,right:e.right,bottom:e.bottom,left:e.left,width:e.right-e.left,height:e.bottom-e.top}),e):{top:0,bottom:0,left:0,right:0,width:0,height:0}}function u(t,e){for(var n=e;n;){if(n==t)return!0;n=a(n)}return!1}function a(t){var e=t.parentNode;return e&&11==e.nodeType&&e.host?e.host:e}}(window,document)},fadw:function(t,e,n){"use strict";n.r(e);var r=n("cDcd"),o=n.n(r),i=n("faye");n("17x9"),n("QLaP"),n("6DQo");function s(t){return o.a.isValidElement(t)&&"string"==typeof t.type}var c=/^-?\d*\.?\d+(px|%)$/;function u(t){var e=(t?t.trim():"0px").split(/\s+/).map((function(t){if(!c.test(t))throw new Error("rootMargin must be a string literal containing pixels and/or percent values");return t})),n=e[0],r=void 0===n?"0px":n,o=e[1],i=void 0===o?r:o,s=e[2],u=void 0===s?r:s,a=e[3];return r+" "+i+" "+u+" "+(void 0===a?i:a)}function a(t,e){return Array.isArray(t)&&Array.isArray(e)&&t.length===e.length?t.some((function(n,r){return a(t[r],e[r])})):t!==e}var h=new Map;function f(t,e){var n=h.get(t);if(n)for(var r=n.values(),o=void 0;o=r.next().value;)if(o.target===e.target)return o;return null}function l(t,e){for(var n=0;n<t.length;n++){var r=f(e,t[n]);r&&r.handleChange(t[n])}}function p(t){return function(){for(var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},e=t.root||null,n=u(t.rootMargin),r=Array.isArray(t.threshold)?t.threshold:[null!=t.threshold?t.threshold:0],o=h.keys(),i=void 0;i=o.next().value;){var s=e!==i.root||n!==i.rootMargin||a(r,i.thresholds);if(!s)return i}return null}(t)||new IntersectionObserver(l,t)}function d(t){h.has(t.observer)||h.set(t.observer,new Set),h.get(t.observer).add(t),t.observer.observe(t.target)}function v(t){if(h.has(t.observer)){var e=h.get(t.observer);e.delete(t)&&(e.size>0?t.observer.unobserve(t.target):(t.observer.disconnect(),h.delete(t.observer)))}}var g=function(){function t(t,e){for(var n=0;n<e.length;n++){var r=e[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,r.key,r)}}return function(e,n,r){return n&&t(e.prototype,n),r&&t(e,r),e}}();function _(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}function b(t,e){if(!t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!e||"object"!=typeof e&&"function"!=typeof e?t:e}var y=["root","rootMargin","threshold"],m=["disabled"].concat(y),w=Object.prototype,I=function(t){function e(){var n,r;_(this,e);for(var o=arguments.length,c=Array(o),u=0;u<o;u++)c[u]=arguments[u];return n=r=b(this,t.call.apply(t,[this].concat(c))),r.handleChange=function(t){r.props.onChange(t,r.unobserve),r.props.onlyOnce&&t.isIntersecting&&r.unobserve()},r.handleNode=function(t){"function"==typeof r.props.children.ref&&r.props.children.ref(t),r.targetChanged=null!=(r.renderedTarget&&t)&&r.renderedTarget!==t,r.targetChanged&&r.unobserve(),r.target=t},r.observe=function(){r.target=s(r.target)?r.target:Object(i.findDOMNode)(r.target),r.observer=p(r.options),d(r)},r.unobserve=function(){null!=r.target&&v(r)},b(r,n)}return function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):t.__proto__=e)}(e,t),e.prototype.componentDidMount=function(){this.props.disabled||this.observe()},e.prototype.componentDidUpdate=function(t){var e=this,n=m.some((function(n){return a(e.props[n],t[n])}));n&&this.unobserve(),(this.targetChanged||n)&&(this.props.disabled||this.observe())},e.prototype.componentWillUnmount=function(){this.unobserve()},e.prototype.render=function(){return this.renderedTarget=this.target,o.a.cloneElement(o.a.Children.only(this.props.children),{ref:this.handleNode})},g(e,[{key:"options",get:function(){var t=this;return y.reduce((function(e,n){if(w.hasOwnProperty.call(t.props,n)){var r="root"===n&&"[object String]"===w.toString.call(t.props[n]);e[n]=r?document.querySelector(t.props[n]):t.props[n]}return e}),{})}}]),e}(o.a.Component);I.displayName="IntersectionObserver";var E=I;n.d(e,"default",(function(){return E})),n.d(e,"parseRootMargin",(function(){return u}))},s5qY:function(t,e,n){var r=n("0/R4");t.exports=function(t,e){if(!r(t)||t._t!==e)throw TypeError("Incompatible receiver, "+e+" required!");return t}},wmvG:function(t,e,n){"use strict";var r=n("hswa").f,o=n("Kuth"),i=n("3Lyj"),s=n("m0Pp"),c=n("9gX7"),u=n("SlkY"),a=n("Afnz"),h=n("1TsA"),f=n("elZq"),l=n("nh4g"),p=n("Z6vF").fastKey,d=n("s5qY"),v=l?"_s":"size",g=function(t,e){var n,r=p(e);if("F"!==r)return t._i[r];for(n=t._f;n;n=n.n)if(n.k==e)return n};t.exports={getConstructor:function(t,e,n,a){var h=t((function(t,r){c(t,h,e,"_i"),t._t=e,t._i=o(null),t._f=void 0,t._l=void 0,t[v]=0,null!=r&&u(r,n,t[a],t)}));return i(h.prototype,{clear:function(){for(var t=d(this,e),n=t._i,r=t._f;r;r=r.n)r.r=!0,r.p&&(r.p=r.p.n=void 0),delete n[r.i];t._f=t._l=void 0,t[v]=0},delete:function(t){var n=d(this,e),r=g(n,t);if(r){var o=r.n,i=r.p;delete n._i[r.i],r.r=!0,i&&(i.n=o),o&&(o.p=i),n._f==r&&(n._f=o),n._l==r&&(n._l=i),n[v]--}return!!r},forEach:function(t){d(this,e);for(var n,r=s(t,arguments.length>1?arguments[1]:void 0,3);n=n?n.n:this._f;)for(r(n.v,n.k,this);n&&n.r;)n=n.p},has:function(t){return!!g(d(this,e),t)}}),l&&r(h.prototype,"size",{get:function(){return d(this,e)[v]}}),h},def:function(t,e,n){var r,o,i=g(t,e);return i?i.v=n:(t._l=i={i:o=p(e,!0),k:e,v:n,p:r=t._l,n:void 0,r:!1},t._f||(t._f=i),r&&(r.n=i),t[v]++,"F"!==o&&(t._i[o]=i)),t},getEntry:g,setStrong:function(t,e,n){a(t,e,(function(t,n){this._t=d(t,e),this._k=n,this._l=void 0}),(function(){for(var t=this._k,e=this._l;e&&e.r;)e=e.p;return this._t&&(this._l=e=e?e.n:this._t._f)?h(0,"keys"==t?e.k:"values"==t?e.v:[e.k,e.v]):(this._t=void 0,h(1))}),n?"entries":"values",!n,!0),f(e)}}}}]);
//# sourceMappingURL=https://hrcdn.net/community-frontend/assets/sourcemaps/hackerrank_r_intersection_observer-3718f5c9f6.js.map