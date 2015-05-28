dl := dl() { wget $$1 -O $$2; mogrify -resize 1100x -quality 70 -strip $$2; ls -la $$2; }; dl
all: $(wildcard *.jpg)

stairs.jpg:
	@# http://jaymantri.com/post/119561577503/download
	${dl} "http://40.media.tumblr.com/5f3f3d2d2f4a81c3c60500b62c198eed/tumblr_noq5zbZF011qfirfao1_1280.jpg" $@

roughwall.jpg:
	@# http://jaymantri.com/post/119559858023/download
	${dl} http://s169923.gridserver.com/images/roughwall.jpg $@

pebbles.jpg:
	@# http://jaymantri.com/post/118956931828/download
	${dl} http://41.media.tumblr.com/fe8834029a3ddb2b6db08bad2288dbb4/tumblr_noco7zrrF31qfirfao1_1280.jpg $@

woodfloor.jpg:
	@# http://jaymantri.com/post/117783615373/download#notes
	${dl} http://40.media.tumblr.com/e347691fe1217667582940869044d344/tumblr_nnmqtgZFzv1qfirfao1_1280.jpg $@

rosebench.jpg:
	@# http://jaymantri.com/post/117170705152/download#notes
	${dl} http://40.media.tumblr.com/48ac38622fd674a6d0ce70b68a7dd336/tumblr_nn8x5dIUIx1qfirfao1_1280.jpg $@
