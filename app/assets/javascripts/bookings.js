// function unavailable(date) {
// 	dmy = date.getDate() + "-" + (date.getMonth()+1) + "-" + date.getFullYear();
// 	return [$.inArray(dmy, unavailableDates) == -1];
// }

// $(function() {

// 	unavailableDates = [];

// 	$.ajax({
// 		url: '/preload',
// 		data: {'listing_id': <% @listing.id %>},
// 		dataType: 'json',
// 		success: function(data) {

// 			$.each(data, function(arrId, arrValue) {
// 				for (var d = new Date(arrValue.check_in); d <= new Date(arrValue.check_out); d.setDate(d.getDate() +1)) {
// 					console.log(d);
// 					unavailableDates.push($.datepicker.formatDate('dd-mm-yy', d));

// 				};
// 			});
// 			console.log(unavailableDate);
// 			$('#reservation_check_in').datepicker({
// 				dateFormat: 'dd-mm-yy',
// 				minDate: 0,
// 				maxDate: '3m',
// 				beforeShowDay: unavailable,
// 				onSelect: function(selected){
// 					$('#reservation_check_out').datepicker("option", "minDate", selected);
// 					$('#reservation_check_out').attr('disabled', false);

// 				}
// 			});

// 			$('#reservation_end_date').datepicker({
// 				dateFormat: 'dd-mm-yy',
// 				minDate: 0,
// 				maxDate: '3m',
// 				beforeShowDay: unavailable,
// 				onSelect: function(selected){
// 					$('#reservation_check_in').datepicker("option", "maxDate", selected);
// 				}

// 			});
// 		}
// 	});
// })