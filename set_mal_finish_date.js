$.ajax({ url: $('.thickbox').attr('href'), success: function(data) { mal_parse_date(data) } });

function mal_parse_date(content) {
	var $content = $('<div>').append(content.match(/<body[^>]*>(.|[\n\r])*<\/body>/gm)[0]);
	var ids = []; 
	$content.find('.spaceit_pad').each(function(i,e) {
		var id = Number($(e).attr('id').replace('eprow', ''));
		if (!isNaN(id)) {
			ids.push(id);
		}
	});

	var getdate = function(id, $content) {
		$content.find('#eprow' + id).find('a').remove();
		var str = $content.find('#eprow' + id).html();
		var date = str.match(/\d+\/\d+\/\d+/)[0].split('/');
		return date;
	}

	var max_id = Math.max.apply(null, ids);
	if (max_id != null) {
		var date = getdate(max_id, $content);
		$('#add_anime_finish_date_month').val(parseInt(date[0]));
		$('#add_anime_finish_date_day').val(parseInt(date[1]));
		$('#add_anime_finish_date_year').val(parseInt(date[2]));
	}

	var min_id = Math.min.apply(null, ids);
	if (min_id != null) {
		var date = getdate(min_id, $content);
		$('#add_anime_start_date_month').val(parseInt(date[0]));
		$('#add_anime_start_date_day').val(parseInt(date[1]));
		$('#add_anime_start_date_year').val(parseInt(date[2]));
	}
}
