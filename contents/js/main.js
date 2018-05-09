var fullPage = $("#fullpage");
var modalOverlay = $(".modal-overlay");
var triggerModalCustomSpace = $("#trigger-browser-modal-custom-space");
var modalCustomSpace = $("#browser-modal-custom-space");

triggerModalCustomSpace.on("click", function(e) {
	fullPage.css({"pointer-events": "none"});
	modalOverlay.show();
	modalCustomSpace.show();
});

modalOverlay.on("click", function(e) {
	modalOverlay.hide();
	modalCustomSpace.hide();
});