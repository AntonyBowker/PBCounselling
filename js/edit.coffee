
$(document).ready () ->
	$("form").on "submit", () -> false
	$(".submit").on "click", (e) ->
		e.preventDefault()
		$.ajax
			type: 'POST'
			url: 'php/form_handler.php'
			success: (result) ->
				$("#text").html(result)
			error: (XHR) ->
				$("body").append "Sorry, there was an error getting the page.  Please try again later"
			data: $('form').serialize() + "&submit=" + $(@).attr "value" 
