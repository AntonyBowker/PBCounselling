onPage = 1

$(document).ready ->
	
	$("nav li:first-of-type").addClass "selected"
	setPanelSize()
	$(window).on("resize",setPanelSize)
	$("#toggleButton").on "click", ->
		$(".picWrap").toggleClass("toggled")

	$("nav li").each (i) ->
		i += 1
		$(@).on "click", ->
			console.log "click handler called, i=#{i}, onPage=#{onPage}"
			setPage i unless onPage == i

getPage = (url) ->
	$.ajax
		url: url
		success: (result) ->
			$("#mainText").html result
		error: (req, status, msg) ->
			$("#mainText").html "There was an error loading this page.  Please try again in a few moments"


delay = (time, fn) ->
	setTimeout fn, time
			
setPage = (p) ->
	onPage = p
	console.log("setPage called, onPage=#{onPage}")
	$("#mainText").fadeOut(200)
	delay 200, ->
		$.when(getPage "main#{p}.html").then ->
			$("#mainText").fadeIn(200)
	$("nav li").removeClass "selected"
	$("nav li:nth-of-type(#{p})").addClass "selected"
			
setPanelSize = () ->
	ww=$(window).width()
	wh=$(window).height()
	dh=$(document).height()
	fw=ww/24+120 
		
	if (ww>660) 
		$("#flowerPanel").css
			width: fw+"px",
			height: fw+"px",
			top: wh*.04+"px",
			left: ww*.02+"px"
		$("#topPanel").css
			width: ww-(ww*0.02)-fw+"px",
			height: fw+"px",
			left: fw+ww*.02+"px",
			top: "4%"
		$("#cornerPanel").css
			width: ww*.02+"px",
			height: fw+"px",
			top: "4%"	
		$("#leftPanel").css
			width: fw+"px",
			height: wh+"px"
		$("#mainBody").css
			width: ww-(ww*.02)-fw+"px",
			top: fw+(wh*.04)+"px",
			left: fw+(ww*0.02)+"px"
		$("#title, #subtitle").css
			top: wh*.04+"px",
			left: (ww*.02)+fw+"px",
			height: fw*.75+"px",
			width: (ww-(ww*0.02)-fw)*2/3+"px"
		$("#subtitle").css
			left: (ww*.02)+fw+(ww-(ww*0.02)-fw)*2/3+"px",
			width: (ww-(ww*0.02)-fw)/3+"px"
		$("nav").css
			width: ww-(ww*.02)-fw+"px",
			left: fw+ww*.02+"px",
			height: fw*.25+"px",
			top: wh*.04+fw*.75+"px"
	
	else 
		$("#flowerPanel").css
			width: fw+"px",
			height: fw+"px",
			top: wh*.02+"px",
			left: (ww-fw)/2+"px"
		$("#topPanel").css
			height: fw*.15+fw*.7*.6+"px",
			width: "100%",
			top: wh*.02+"px",
			left: 0
		$("#mobNavPanel, nav").css
			left: 0,
			width: "100%",
			height: fw*.7*.4+fw*.15+"px",
			top: (wh*.02)+(fw*.15)+(fw*.7*.6)+"px"
		$("#mainBody").css
			top: fw+(wh*.02)+"px",
			left: 0			
		$("#title, #subtitle").css
			top: wh*.02+"px",
			height: fw*.15+fw*.7*.6+"px",
			width: (ww-fw)/2+"px",
			left: 0
		$("#subtitle").css
			left: (ww-fw)/2+fw+"px"


