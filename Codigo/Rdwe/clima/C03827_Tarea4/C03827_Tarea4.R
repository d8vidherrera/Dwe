setwd("C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe")
# Se cambia la ruta
data1 <- read.table(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/clima/Clima_est1.dat",
  header=TRUE, sep=',',skip=1,na='',stringsAsFactors=FALSE)
data2 <- read.table(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/clima/Clima_est2.dat",
  header=TRUE, sep=',',skip=1,na='',stringsAsFactors=FALSE)
data <- rbind(data1,data2)
rm(data1,data2)