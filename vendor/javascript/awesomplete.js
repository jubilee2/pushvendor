var t="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var e={};(function(){var _=function(e,i){var n=this||t;_.count=(_.count||0)+1;(this||t).count=_.count;(this||t).isOpened=false;(this||t).input=$(e);(this||t).input.setAttribute("autocomplete","off");(this||t).input.setAttribute("aria-expanded","false");(this||t).input.setAttribute("aria-owns","awesomplete_list_"+(this||t).count);(this||t).input.setAttribute("role","combobox");(this||t).options=i=i||{};configure(this||t,{minChars:2,maxItems:10,autoFirst:false,data:_.DATA,filter:_.FILTER_CONTAINS,sort:false!==i.sort&&_.SORT_BYLENGTH,container:_.CONTAINER,item:_.ITEM,replace:_.REPLACE,tabSelect:false},i);(this||t).index=-1;(this||t).container=this.container(e);(this||t).ul=$.create("ul",{hidden:"hidden",role:"listbox",id:"awesomplete_list_"+(this||t).count,inside:(this||t).container});(this||t).status=$.create("span",{className:"visually-hidden",role:"status","aria-live":"assertive","aria-atomic":true,inside:(this||t).container,textContent:0!=(this||t).minChars?"Type "+(this||t).minChars+" or more characters for results.":"Begin typing for results."});(this||t)._events={input:{input:(this||t).evaluate.bind(this||t),blur:(this||t).close.bind(this||t,{reason:"blur"}),keydown:function(t){var e=t.keyCode;if(n.opened)if(13===e&&n.selected){t.preventDefault();n.select(void 0,void 0,t)}else if(9===e&&n.selected&&n.tabSelect)n.select(void 0,void 0,t);else if(27===e)n.close({reason:"esc"});else if(38===e||40===e){t.preventDefault();n[38===e?"previous":"next"]()}}},form:{submit:(this||t).close.bind(this||t,{reason:"submit"})},ul:{mousedown:function(t){t.preventDefault()},click:function(e){var i=e.target;if(i!==(this||t)){while(i&&!/li/i.test(i.nodeName))i=i.parentNode;if(i&&0===e.button){e.preventDefault();n.select(i,e.target,e)}}}}};$.bind((this||t).input,(this||t)._events.input);$.bind((this||t).input.form,(this||t)._events.form);$.bind((this||t).ul,(this||t)._events.ul);if((this||t).input.hasAttribute("list")){(this||t).list="#"+(this||t).input.getAttribute("list");(this||t).input.removeAttribute("list")}else(this||t).list=(this||t).input.getAttribute("data-list")||i.list||[];_.all.push(this||t)};_.prototype={set list(e){if(Array.isArray(e))(this||t)._list=e;else if("string"===typeof e&&e.indexOf(",")>-1)(this||t)._list=e.split(/\s*,\s*/);else{e=$(e);if(e&&e.children){var n=[];i.apply(e.children).forEach((function(t){if(!t.disabled){var e=t.textContent.trim();var i=t.value||e;var s=t.label||e;""!==i&&n.push({label:s,value:i})}}));(this||t)._list=n}}document.activeElement===(this||t).input&&this.evaluate()},get selected(){return(this||t).index>-1},get opened(){return(this||t).isOpened},close:function(e){if((this||t).opened){(this||t).input.setAttribute("aria-expanded","false");(this||t).ul.setAttribute("hidden","");(this||t).isOpened=false;(this||t).index=-1;(this||t).status.setAttribute("hidden","");$.fire((this||t).input,"awesomplete-close",e||{})}},open:function(){(this||t).input.setAttribute("aria-expanded","true");(this||t).ul.removeAttribute("hidden");(this||t).isOpened=true;(this||t).status.removeAttribute("hidden");(this||t).autoFirst&&-1===(this||t).index&&this.goto(0);$.fire((this||t).input,"awesomplete-open")},destroy:function(){$.unbind((this||t).input,(this||t)._events.input);$.unbind((this||t).input.form,(this||t)._events.form);if(!(this||t).options.container){var e=(this||t).container.parentNode;e.insertBefore((this||t).input,(this||t).container);e.removeChild((this||t).container)}(this||t).input.removeAttribute("autocomplete");(this||t).input.removeAttribute("aria-autocomplete");var i=_.all.indexOf(this||t);-1!==i&&_.all.splice(i,1)},next:function(){var e=(this||t).ul.children.length;this.goto((this||t).index<e-1?(this||t).index+1:e?0:-1)},previous:function(){var e=(this||t).ul.children.length;var i=(this||t).index-1;this.goto((this||t).selected&&-1!==i?i:e-1)},goto:function(e){var i=(this||t).ul.children;(this||t).selected&&i[(this||t).index].setAttribute("aria-selected","false");(this||t).index=e;if(e>-1&&i.length>0){i[e].setAttribute("aria-selected","true");(this||t).status.textContent=i[e].textContent+", list item "+(e+1)+" of "+i.length;(this||t).input.setAttribute("aria-activedescendant",(this||t).ul.id+"_item_"+(this||t).index);(this||t).ul.scrollTop=i[e].offsetTop-(this||t).ul.clientHeight+i[e].clientHeight;$.fire((this||t).input,"awesomplete-highlight",{text:(this||t).suggestions[(this||t).index]})}},select:function(e,i,n){e?(this||t).index=$.siblingIndex(e):e=(this||t).ul.children[(this||t).index];if(e){var s=(this||t).suggestions[(this||t).index];var r=$.fire((this||t).input,"awesomplete-select",{text:s,origin:i||e,originalEvent:n});if(r){this.replace(s);this.close({reason:"select"});$.fire((this||t).input,"awesomplete-selectcomplete",{text:s,originalEvent:n})}}},evaluate:function(){var e=this||t;var i=(this||t).input.value;if(i.length>=(this||t).minChars&&(this||t)._list&&(this||t)._list.length>0){(this||t).index=-1;(this||t).ul.innerHTML="";(this||t).suggestions=(this||t)._list.map((function(t){return new Suggestion(e.data(t,i))})).filter((function(t){return e.filter(t,i)}));false!==(this||t).sort&&((this||t).suggestions=(this||t).suggestions.sort((this||t).sort));(this||t).suggestions=(this||t).suggestions.slice(0,(this||t).maxItems);(this||t).suggestions.forEach((function(t,n){e.ul.appendChild(e.item(t,i,n))}));if(0===(this||t).ul.children.length){(this||t).status.textContent="No results found";this.close({reason:"nomatches"})}else{this.open();(this||t).status.textContent=(this||t).ul.children.length+" results found"}}else{this.close({reason:"nomatches"});(this||t).status.textContent="No results found"}}};_.all=[];_.FILTER_CONTAINS=function(t,e){return RegExp($.regExpEscape(e.trim()),"i").test(t)};_.FILTER_STARTSWITH=function(t,e){return RegExp("^"+$.regExpEscape(e.trim()),"i").test(t)};_.SORT_BYLENGTH=function(t,e){return t.length!==e.length?t.length-e.length:t<e?-1:1};_.CONTAINER=function(t){return $.create("div",{className:"awesomplete",around:t})};_.ITEM=function(e,i,n){var s=""===i.trim()?e:e.replace(RegExp($.regExpEscape(i.trim()),"gi"),"<mark>$&</mark>");return $.create("li",{innerHTML:s,role:"option","aria-selected":"false",id:"awesomplete_list_"+(this||t).count+"_item_"+n})};_.REPLACE=function(e){(this||t).input.value=e.value};_.DATA=function(t){return t};function Suggestion(e){var i=Array.isArray(e)?{label:e[0],value:e[1]}:"object"===typeof e&&"label"in e&&"value"in e?e:{label:e,value:e};(this||t).label=i.label||i.value;(this||t).value=i.value}Object.defineProperty(Suggestion.prototype=Object.create(String.prototype),"length",{get:function(){return(this||t).label.length}});Suggestion.prototype.toString=Suggestion.prototype.valueOf=function(){return""+(this||t).label};function configure(t,e,i){for(var n in e){var s=e[n],r=t.input.getAttribute("data-"+n.toLowerCase());t[n]="number"===typeof s?parseInt(r):false===s?null!==r:s instanceof Function?null:r;t[n]||0===t[n]||(t[n]=n in i?i[n]:s)}}var i=Array.prototype.slice;function $(t,e){return"string"===typeof t?(e||document).querySelector(t):t||null}function $$(t,e){return i.call((e||document).querySelectorAll(t))}$.create=function(t,e){var i=document.createElement(t);for(var n in e){var s=e[n];if("inside"===n)$(s).appendChild(i);else if("around"===n){var r=$(s);r.parentNode.insertBefore(i,r);i.appendChild(r);null!=r.getAttribute("autofocus")&&r.focus()}else n in i?i[n]=s:i.setAttribute(n,s)}return i};$.bind=function(t,e){if(t)for(var i in e){var n=e[i];i.split(/\s+/).forEach((function(e){t.addEventListener(e,n)}))}};$.unbind=function(t,e){if(t)for(var i in e){var n=e[i];i.split(/\s+/).forEach((function(e){t.removeEventListener(e,n)}))}};$.fire=function(t,e,i){var n=document.createEvent("HTMLEvents");n.initEvent(e,true,true);for(var s in i)n[s]=i[s];return t.dispatchEvent(n)};$.regExpEscape=function(t){return t.replace(/[-\\^$*+?.()|[\]{}]/g,"\\$&")};$.siblingIndex=function(t){for(var e=0;t=t.previousElementSibling;e++);return e};function init(){$$("input.awesomplete").forEach((function(t){new _(t)}))}"undefined"!==typeof self&&(self.Awesomplete=_);"undefined"!==typeof Document&&("loading"!==document.readyState?init():document.addEventListener("DOMContentLoaded",init));_.$=$;_.$$=$$;e&&(e=_);return _})();var i=e;export default i;

