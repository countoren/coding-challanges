(window.webpackJsonp=window.webpackJsonp||[]).push([[27],{"61np":function(e,t,o){"use strict";var n=o("pVnL"),r=o.n(n),p=o("QILm"),i=o.n(p),a=o("cDcd"),c=o("TSYQ"),s=o.n(c),u=o("cKCp");o("GSOj");t.a=function(e){var t=e.content,o=e.children,n=e.className,p=i()(e,["content","children","className"]);return a.createElement(u.a,r()({className:s()("ui-tooltip",n),popupContent:t,aliveTime:300},p),o)}},"9YLm":function(e,t,o){},EA6I:function(e,t,o){"use strict";o("a1Th"),o("h7Nl"),o("I5cv"),o("V+eJ");var n=o("lwsE"),r=o.n(n),p=o("W8MJ"),i=o.n(p),a=o("PJYZ"),c=o.n(a),s=o("7W2i"),u=o.n(s),l=o("a1gu"),v=o.n(l),f=o("Nsbk"),h=o.n(f),d=o("pVnL"),m=o.n(d),g=o("QILm"),T=o.n(g),P=o("lSNA"),y=o.n(P),O=o("cDcd"),b=o.n(O),w=o("TSYQ"),k=o.n(w),E=o("dvg7"),W=o.n(E),C=o("vN+2"),N=o.n(C),L=o("TXrv"),S=o("3N0A");o("dcnl");function D(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}var H=25,I=parseInt(10,10)+parseInt(H,10)/2,A=function(e){u()(n,e);var t,o=(t=n,function(){var e,o=h()(t);if(D()){var n=h()(this).constructor;e=Reflect.construct(o,arguments,n)}else e=o.apply(this,arguments);return v()(this,e)});function n(){var e;r()(this,n);for(var t=arguments.length,p=new Array(t),i=0;i<t;i++)p[i]=arguments[i];return e=o.call.apply(o,[this].concat(p)),y()(c()(e),"popoverElement",void 0),y()(c()(e),"popoverWrap",void 0),y()(c()(e),"popoverTip",void 0),y()(c()(e),"getNewAlignment",(function(t,o,n){var r=["top","top-right","top-left","right","left","bottom","bottom-right","bottom-left"],p=0,i=t,a=r.indexOf(t);0!==a&&(t.indexOf("-right")>0||t.indexOf("-left")>0)?a-=1:a+=1;do{if(++p===r.length)break;i=r[a%=r.length]}while(!e.checkPopoverOverflow(r[a++],o,n));return i})),y()(c()(e),"checkPopoverOverflow",(function(t,o,n){var r=e.getPopoverDimension(),p=r.popoverWrapHeight,i=r.popoverWrapWidth,a=e.getPopupCoordinates(t),c=a.left,s=a.top;return c+i>o||s+p>n||s<0||c<0})),y()(c()(e),"getPopupCoordinates",(function(t){var o,n,r=e.getPopoverDimension(),p=r.popoverWrapHeight,i=r.popoverWrapWidth,a=e.getTargetOffsets(),c=a.offsetTop,s=a.offsetLeft,u=a.offsetWidth,l=a.offsetHeight,v=e.props,f=v.popoverSpace,h=v.showTip&&u<2*I?I-u/2:0;switch(t){case"top":o=s+u/2-i/2,n=c-p-f;break;case"top-right":o=s+u-i+h,n=c-p-f;break;case"top-left":o=s-h,n=c-p-f;break;case"right":o=s+u+f,n=c+l/2-p/2;break;case"bottom":o=s+u/2-i/2,n=c+l+f;break;case"bottom-right":o=s+u-i+h,n=c+l+f;break;case"bottom-left":o=s-h,n=c+l+f;break;case"left":o=s-i-f,n=c+l/2-p/2;break;default:o=0,n=0}return{left:o,top:n}})),y()(c()(e),"positionPopover",(function(){var t=c()(e),o=t.popoverWrap,n=t.popoverTip,r=t.props,p=r.open,i=r.target,a=r.align,s=r.coordinate,u=r.showTip;if(p){var l,v,f=e.getContainmentDimension(),h=f.containmentWidth,d=f.containmentHeight;s?Object(L.c)(o,s):i&&(e.checkPopoverOverflow(a,h,d)?(l=e.getNewAlignment(a,h,d),v=e.getPopupCoordinates(l),u&&(n.classList.remove("align-tip-".concat(a)),n.classList.add("align-tip-".concat(l))),o.classList.remove("align-popover-".concat(a)),o.classList.add("align-popover-".concat(l))):v=e.getPopupCoordinates(a),Object(L.c)(o,{left:"".concat(v.left,"px"),top:"".concat(v.top,"px")}))}})),e}return i()(n,[{key:"componentDidMount",value:function(){this.positionPopover(),window.addEventListener("resize",this.positionPopover)}},{key:"shouldComponentUpdate",value:function(e){var t=this.props;return e.open!==t.open||e.children!==t.children}},{key:"componentDidUpdate",value:function(){this.positionPopover()}},{key:"componentWillUnmount",value:function(){window.removeEventListener("resize",this.positionPopover)}},{key:"getPopoverDimension",value:function(){var e=this.popoverWrap,t=e.offsetWidth;return{popoverWrapHeight:e.offsetHeight,popoverWrapWidth:t}}},{key:"getContainmentDimension",value:function(){return{containmentWidth:window.innerWidth,containmentHeight:document.documentElement.scrollHeight}}},{key:"getTargetOffsets",value:function(){var e=this.props.target,t=Object(L.a)(e),o=t.top,n=t.left,r=e.getBoundingClientRect();return{offsetTop:o,offsetLeft:n,offsetWidth:r.width,offsetHeight:r.height}}},{key:"render",value:function(){var e=this,t=this.props,o=t.target,n=t.coordinate,r=t.align,p=t.showTip,i=t.open,a=t.className,c=t.onClose,s=(t.popoverSpace,T()(t,["target","coordinate","align","showTip","open","className","onClose","popoverSpace"]));return i&&(o||n)?b.a.createElement(S.a,null,b.a.createElement(W.a,{onClickOutside:c},b.a.createElement("div",{className:k()("custom-popover",a),ref:function(t){e.popoverElement=t}},b.a.createElement("div",m()({ref:function(t){e.popoverWrap=t},className:k()("popover-wrap","align-popover-".concat(r),{"has-tip":p})},s),b.a.createElement("div",{className:"content"},this.props.children),p&&b.a.createElement("div",{ref:function(t){e.popoverTip=t},className:k()("tip","align-tip-".concat(r))}))))):null}}]),n}(O.Component);y()(A,"defaultProps",{align:"top",showTip:!0,open:!1,popoverSpace:15,onClose:N.a}),t.a=A},GSOj:function(e,t,o){},cKCp:function(e,t,o){"use strict";o("a1Th"),o("h7Nl"),o("I5cv"),o("bWfx"),o("2Spj");var n=o("lSNA"),r=o.n(n),p=o("lwsE"),i=o.n(p),a=o("W8MJ"),c=o.n(a),s=o("PJYZ"),u=o.n(s),l=o("7W2i"),v=o.n(l),f=o("a1gu"),h=o.n(f),d=o("Nsbk"),m=o.n(d),g=o("pVnL"),T=o.n(g),P=o("QILm"),y=o.n(P),O=o("cDcd"),b=o.n(O),w=o("TSYQ"),k=o.n(w),E=o("EA6I"),W=o("FLdU");o("9YLm");function C(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}function N(){}var L=Object(W.a)(),S=function(e){v()(n,e);var t,o=(t=n,function(){var e,o=m()(t);if(C()){var n=m()(this).constructor;e=Reflect.construct(o,arguments,n)}else e=o.apply(this,arguments);return h()(this,e)});function n(){var e;return i()(this,n),e=o.call(this),r()(u()(e),"popoverTimeout",void 0),r()(u()(e),"delayTimeout",void 0),r()(u()(e),"clearTimeouts",(function(){e.popoverTimeout&&clearTimeout(e.popoverTimeout),e.delayTimeout&&clearTimeout(e.delayTimeout)})),r()(u()(e),"getEventTypes",(function(){var t=e.props.eventType;return{showEvent:"hover"===t?"onMouseEnter":"onFocus",hideEvent:"hover"===t?"onMouseLeave":"onBlur"}})),r()(u()(e),"onAnyPopupOpen",(function(t){t!==e.state.target&&e.state.target&&(e.clearTimeouts(),e.setState({popoverOpen:!1,target:void 0}))})),r()(u()(e),"setPopoverOpen",(function(t){var o=e.props.onPopupOpen;e.setState(t,(function(){L.emit("onUIHoverPopupOpen",e.state.target),o()}))})),r()(u()(e),"openPopover",(function(t,o){var n=e.props,r=n.disabled,p=n.delay,i=e.state.popoverOpen;if(e.clearTimeouts(),!i&&!r){var a={popoverOpen:!0};o&&(a.target=t.currentTarget),p?e.delayTimeout=setTimeout((function(){return e.setPopoverOpen(a)}),p):e.setPopoverOpen(a)}})),r()(u()(e),"closePopover",(function(){var t=e.props,o=t.aliveTime,n=t.onPopupClose;e.clearTimeouts(),e.popoverTimeout=setTimeout((function(){e.setState({popoverOpen:!1,target:void 0},(function(){return n()}))}),o)})),r()(u()(e),"bindTriggerEvents",(function(t){var o,n=e.getEventTypes(),p=n.showEvent,i=n.hideEvent;return b.a.cloneElement(t,(o={},r()(o,p,(function(o){e.openPopover(o,!0),t.props[p]&&t.props[p](o)})),r()(o,i,(function(o){e.closePopover(),t.props[i]&&t.props[i](o)})),o))})),e.state={popoverOpen:!1},e}return c()(n,[{key:"componentDidMount",value:function(){L.on("onUIHoverPopupOpen",this.onAnyPopupOpen)}},{key:"componentWillUnmount",value:function(){L.off("onUIHoverPopupOpen",this.onAnyPopupOpen),this.clearTimeouts()}},{key:"renderPopover",value:function(){var e,t=this.props,o=this.state,n=t.popupContent,r=t.className,p=t.eventType,i=(t.aliveTime,t.onPopupOpen,t.onPopupClose,t.delay,t.disabled),a=y()(t,["popupContent","className","eventType","aliveTime","onPopupOpen","onPopupClose","delay","disabled"]),c=o.target;if(!i){e="function"==typeof n?n():n;var s={};return"hover"===p&&(s={onMouseEnter:this.openPopover.bind(this,!1),onMouseLeave:this.closePopover}),b.a.createElement(E.a,T()({},a,{className:k()("hover-popup",r),open:!0},s,{target:c}),e)}}},{key:"render",value:function(){var e=this.state.popoverOpen,t=this.props.children,o=b.a.Children.map(t,this.bindTriggerEvents);return b.a.createElement(O.Fragment,null,o,e&&this.renderPopover())}}]),n}(O.Component);r()(S,"defaultProps",{aliveTime:1e3,onPopupOpen:N,onPopupClose:N,disabled:!1,eventType:"hover"}),t.a=S},dcnl:function(e,t,o){}}]);
//# sourceMappingURL=https://hrcdn.net/community-frontend/assets/sourcemaps/vendors~hackerrank_r_community~hackerrank_r_work~hackerrank_r_work_login-52b836c254.js.map