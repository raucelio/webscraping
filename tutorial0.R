library(rvest)
web <- "http://users.isr.ist.utl.pt/~cfb/VdS/camoes.html"

url.show(web,file="tutorial0.html")

dados <- read_html("tutorial0.html",encoding = "UTF-8")

poemas  <-html_nodes(dados,"a")
nomes   <- html_text(poemas,T)
caminho <- html_attr(poemas,"href")

resultado <- data.frame(url=caminho, poemas = nomes)