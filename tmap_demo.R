install.packages("sf")

library(sf)

install.package("tmap")

library(tmap)

data(World)

tm_shape(World) +
	tm_polygons(fill = "gender",
				fill.scale = tm_scale_continuous(values = "-hcl.cyan_magenta")) + tm_crs("auto") +
	tm_bubbles(size = "pop_est") +
	tm_compass() +
	tm_scalebar()

tm_shape(World) +
	tm_polygons(fill = c("gender", "press")) +
	tm_layout(scale = 0.4)

library(cols4all)
c4a_gui()

install.packages("tmap.cartogram")
library(tmap.cartogram)

tm_shape(World) +
	tm_cartogram_ncont(size = "pop_est")


