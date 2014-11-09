
$(document).ready () ->
	$("form").on "submit", () -> false
	$(".submit").on "click", (e) ->
		e.preventDefault()
		$.ajax
			type: 'POST'
			url: 'php/save.php'
			success: (result) ->
				msg "Page Saved"
			error: (XHR) ->
				msg "Error Saving Page"
			data: $('form').serialize()
	$("#pageSelect").on "change", () ->
		$.ajax
			type: 'POST'
			url: 'php/load.php'
			success: (result) ->
				msg "Loaded Page"
				$("#text").html result 
			error: (XHR) ->
				msg "Error Loading Page"
			data: $('form').serialize()
 
msg = (msg) -> 
	$("#messageArea").html msg