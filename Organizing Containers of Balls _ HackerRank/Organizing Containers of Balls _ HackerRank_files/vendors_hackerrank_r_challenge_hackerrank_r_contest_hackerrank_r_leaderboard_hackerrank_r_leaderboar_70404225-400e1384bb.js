(window.webpackJsonp=window.webpackJsonp||[]).push([[13],{S1Ak:function(e,t,n){},"xxD/":function(e,t,n){"use strict";n("a1Th"),n("h7Nl"),n("I5cv"),n("xfY5"),n("KKXr"),n("2Spj");var a=n("lwsE"),r=n.n(a),i=n("W8MJ"),c=n.n(i),s=n("PJYZ"),l=n.n(s),o=n("7W2i"),u=n.n(o),p=n("a1gu"),g=n.n(p),m=n("Nsbk"),h=n.n(m),f=(n("HAE/"),n("WLL4"),n("jm62"),n("8+KV"),n("0l/t"),n("rGqo"),n("yt8O"),n("RW0V"),n("pVnL")),d=n.n(f),P=n("lSNA"),k=n.n(P),v=n("cDcd"),y=(n("17x9"),n("MGin")),b=n("TSYQ"),E=n.n(b),N=n("eOGF");n("S1Ak");function O(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}function C(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function x(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?C(Object(n),!0).forEach((function(t){k()(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):C(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}var j=function(e){u()(a,e);var t,n=(t=a,function(){var e,n=h()(t);if(O()){var a=h()(this).constructor;e=Reflect.construct(n,arguments,a)}else e=n.apply(this,arguments);return g()(this,e)});function a(){var e;r()(this,a);for(var t=arguments.length,i=new Array(t),c=0;c<t;c++)i[c]=arguments[c];return e=n.call.apply(n,[this].concat(i)),k()(l()(e),"handleClick",(function(t,n){e.props.currentPage===t&&n.preventDefault()})),k()(l()(e),"getQuery",(function(t,n){var a=e.props,r=a.removeQueries,i=a.addQueries,c=x({},t.query);return r.forEach((function(e){delete c[e]})),x({},c,{page:n},i)})),k()(l()(e),"getLinkAttributes",(function(t,n){var a,r=e.props,i=r.currentPage,c=r.pageOnQuery,s=r.nonUrlPages,o=(r.removeQueries,r.addQueries,e.getPath());return a=s?void 0:c?function(n){return x({},n,{query:e.getQuery(n,t)})}:function(e){return x({},e,{pathname:o+"/"+t})},{"data-analytics":"Pagination","data-attr1":n,"data-attr8":t,"data-attr7":i,onClick:e.handleClick.bind(l()(e),t),to:a}})),k()(l()(e),"onPageChange",(function(t){t!==e.props.currentPage&&e.props.onPageChange(t)})),e}return c()(a,[{key:"getPath",value:function(){var e=this.props.pageOnQuery,t=this.context.location.pathname;if(e)return t;var n=t.split("/");return Number(n[n.length-1])&&n.pop(),n.join("/")}},{key:"renderMetaInfo",value:function(e,t,n,a){var r=this.context.location,i=this.getLinkAttributes,c=i(n,"Left").to(r),s=Object(N.a)(c.pathname,c.query),l=i(a,"Right").to(r),o=Object(N.a)(l.pathname,l.query);return v.createElement("div",null,!e&&v.createElement("link",{rel:"prev",href:s}),!t&&v.createElement("link",{rel:"next",href:o}))}},{key:"renderEllipsis",value:function(){return v.createElement("li",{className:E()("page-item page-ellipsis")},v.createElement(y.Link,{className:"page-link"},"..."))}},{key:"render",value:function(){var e=this.props,t=this.getLinkAttributes,n=(this.onPageChange,e.totalItems),a=e.itemPerPage,r=e.maxPageCount,i=e.textControls,c=e.theme,s=e.nonUrlPages,l=Number(e.currentPage),o=Math.ceil(n/a),u=1===l,p=l===o,g=Math.max(1,l-1),m=Math.min(o,l+1),h=Math.max(2,Math.ceil(l-r/2));l>o-r&&(h=Math.max(2,o-r)),o<r&&(h=2);var f=[],P=Math.min(r+h,o);1===r&&2===l&&P!==o&&(P+=1),1===r&&l===o-1&&2!==h&&(h-=1);for(var k=h-1>1,b=o-(P-1)>1,N=h;N<P;N++)f.push(v.createElement("li",{key:N,className:E()("page-item number",{active:N===l,"first-item":N===h,"last-item":N===P})},v.createElement(y.Link,d()({className:"page-link"},t(N,"Page"),{onClick:this.onPageChange.bind(this,N)}),N)));return v.createElement("div",{className:E()("ui-pagination",c,this.props.className)},v.createElement("ul",null,v.createElement("li",{className:E()("page-item prev-page",{disabled:u})},v.createElement(y.Link,d()({className:"prev-page-link page-link"},t(g,"Left"),{onClick:this.onPageChange.bind(this,g)}),i?v.createElement("span",{className:"text-control"},"Prev"):v.createElement("span",{className:"icon ui-icon-arrow-left"}))),v.createElement("li",{className:E()("page-item first-page",{active:1===l,"first-item":1===h})},v.createElement(y.Link,d()({className:"page-link"},t(1,"Page"),{onClick:this.onPageChange.bind(this,1)}),1)),k&&this.renderEllipsis(),f,b&&this.renderEllipsis(),o>1&&v.createElement("li",{key:o,className:E()("page-item last-page",{active:o===l})},v.createElement(y.Link,d()({className:"page-link"},t(o,"Page"),{onClick:this.onPageChange.bind(this,o)}),o)),v.createElement("li",{className:E()("page-item next-page",{disabled:p})},v.createElement(y.Link,d()({className:"last-page-link page-link"},t(m,"Right"),{onClick:this.onPageChange.bind(this,m)}),i?v.createElement("span",{className:"text-control"},"Next"):v.createElement("span",{className:"icon ui-icon-arrow-right"})))),!s&&this.renderMetaInfo(u,p,g,m))}}]),a}(v.Component);k()(j,"contextTypes",{location:Object}),k()(j,"defaultProps",{itemPerPage:20,currentPage:1,maxPageCount:5,theme:"new",addQueries:{},removeQueries:[],onPageChange:function(){}}),t.a=j}}]);
//# sourceMappingURL=https://hrcdn.net/community-frontend/assets/sourcemaps/vendors~hackerrank_r_challenge~hackerrank_r_contest~hackerrank_r_leaderboard~hackerrank_r_leaderboar~70404225-400e1384bb.js.map