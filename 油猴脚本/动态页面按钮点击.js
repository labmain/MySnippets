// ==UserScript==
// @name     _YOUR_SCRIPT_NAME
// @include  http://YOUR_SERVER.COM/YOUR_PATH/*
// @require  http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js
// @require  https://gist.github.com/raw/2625891/waitForKeyElements.js
// @grant    GM_addStyle
// ==/UserScript==
/*- The @grant directive is needed to work around a design change
    introduced in GM 1.0.   It restores the sandbox.
*/

waitForKeyElements ("#dispatchOnJobButton", triggerMostButtons);

function triggerMostButtons (jNode) {
    triggerMouseEvent (jNode[0], "mouseover");
    triggerMouseEvent (jNode[0], "mousedown");
    triggerMouseEvent (jNode[0], "mouseup");
    triggerMouseEvent (jNode[0], "click");
}

function triggerMouseEvent (node, eventType) {
    var clickEvent = document.createEvent('MouseEvents');
    clickEvent.initEvent (eventType, true, true);
    node.dispatchEvent (clickEvent);
}

// https://stackoverflow.com/questions/15511381/normal-button-clicking-approaches-are-not-working-in-greasemonkey-script