$(function() {

	$(document).on('click', 'a[data-remote]', function(event,b,c){
		var icon = $(this).find('i');
		icon.data('old-class', icon-attr('class'));
		icon.attr('class', 'icon-refresh');
	});

	$(document).on('ajax:complete', function(e){
		var icon = $(e.target).find('i');
		if (icon.data('old-class')) {
			icon.attr('class', icon.data('old-class'));
			icon.data('old-class', null);
		}
	})

	$(document).ajaxError(function(event, jqxhr, settings, exception){
		if (jqxhr.status){
			alert("We're sorry but something went wrong (" + jqxhr.status + ')');
		}
	});
})