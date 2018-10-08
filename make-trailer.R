## make a trailer
## tutorial (+ mainly copied) from https://masalmon.eu/2018/10/07/trailer/

url.slides <- "https://sinarueeger.github.io/20181004-geneve-rug/slides#%d"

## Capture the first few slides
fs::dir_create("webshots")

urls <- sprintf(url.slides,
                c(1, 9, 16, 19, 21, 26, 28, 29, 34))
webshot::webshot(urls, 'webshots/webshot.png')

## conclusion
slides <- fs::dir_ls("webshots")
#slides <- #c(slides[1], slides, slides[length(slides)])

av::av_encode_video(slides,
                    # it could be a fraction!
                    framerate = 0.4,
                    # if too short there'll be silence 
                    # at the end
                    # if too long it'll be truncated
                 #   audio = audio,
                    output = "trailer.mp4")