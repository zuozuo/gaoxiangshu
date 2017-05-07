$ ->
	$('[data-toggle="tooltip"]').tooltip()
	$('#news_image').carousel()
	$('#news_image').on 'slide.bs.carousel', (e) ->
		$($(e.relatedTarget).data('content')).click()
  $('#flash').fadeOut('fast')
  # setTimeout ->
  #   $('#flash').fadeOut('fast')
  # , 200
	$('.video_list .circle_div .circle').hover ->
		$('.video_list .circle_div .circle').removeClass('active')
		$(this).addClass('active')
		data = $(this).data('id')
		$('.xiangshu_taste .circle_content p').addClass('hidden')
		console.log $(".xiangshu_taste #circle_content#{data}")
		$(".xiangshu_taste #circle_content#{data}").removeClass('hidden')
	, ->
		$(this).removeClass('active')
