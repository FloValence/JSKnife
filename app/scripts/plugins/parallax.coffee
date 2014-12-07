Skwk.Utilis.launchParallax = () ->
    $('.parallax').each ->
    	$this = $(this)

    	parallax = ()->
    		if ($this.data('speed') > 0)
	    		yPos = -( $(window).scrollTop() / (50/$this.data('speed')) )

	    		coords = '50% ' + (yPos - 20) + 'px'
	    		$this.css('background-position', coords)
	    	else if ($this.data('speed') < 0)
	    		yPos = ( $(window).scrollTop() / (50/$this.data('speed')) )

	    		coords = '50% ' + (yPos - 20) + 'px'
	    		#coords = '50% ' + ( yPos + $(window).height() ) + 'px'
	    		$this.css('background-position', coords)

    	parallax()
    	$(window).scroll ->
    		parallax()

