

# generate a random color using the golden ratio
# algorithm: http://martin.ankerl.com/2009/12/09/how-to-create-random-colors-programmatically/
random.color = (function() {


	# use a javascript-style self-invoking function to keep these 
	# state variables out of the global environment
	h = runif(1)
	oop = 0.618033988749895

	#return a list of functions
	list(
	     	# actual color generation function
		generate = function(s=1,v=1,alpha=1) {
			pe = parent.env(environment())
			pe$h = (pe$h + pe$oop) %% 1
			hsv(pe$h,s,v,alpha)
		}

		# reseed color state
		, reseed = function(h=runif(1)) {
			pe =parent.env(environment())
			pe$h = h %% 1
		}
	)
})()

# render a palette as a color wheel
show.palette = function(p, ...) pie(rep(1,length(p)), col=p)

color.brightness = function(c, b) {
	adjustcolor(c, b,b,b)
}


# demonstration
random.color.demo = function() {

	# generate a palette without setting a seed
	pal.unseeded = replicate(8, random.color$generate())
	
	# reseed the palette with a fixed hue and generate a fixed-seed palette
	random.color$reseed(123.4) # will reseed to .4
	pal.seeded = replicate(8, random.color$generate())
	
	# show palettes
	par(mfrow=c(1,2))
	show.palette(pal.unseeded)
	title("Unseeded palette")
	
	show.palette(pal.seeded)
	title("Seeded palette")

}
