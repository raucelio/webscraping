# Load packages
library(rvest)
library(stringr)


# leitura da pagina
#webpage <- read_html("https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html")

url.show("https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html",
    file="tutorial1.html")
webpage <- read_html("tutorial1.html")


# Obtendo os registros de informação
resultado <- html_nodes(webpage,".short-desc")

# construindo o data frame
registro <- data.frame()

for (i in seq_along(resultado)) {
    data <- html_nodes(resultado[i],"strong")
    data <- html_text(data,trim = TRUE)
    data <- str_c(data,",2017")
  
    mentira <- xml_contents(resultado[i])[2]
    mentira <- html_text(mentira,trim = TRUE)
    mentira <- str_sub(mentira, 2, -2)
  
    explicacao <- html_nodes(resultado[i],".short-truth")
    explicacao <- html_text(explicacao, trim = TRUE)
    explicacao <- str_sub(explicacao, 2, -2)
  
    caminho <- html_nodes(resultado[i],"a")
    caminho <- html_attr(caminho,"href")
  
   registro <- rbind(registro,
                     data.frame(data, mentira, explicacao, caminho))
  
}


# Export to csv
write.csv(registro, "tutorial1_trump_mente.csv")