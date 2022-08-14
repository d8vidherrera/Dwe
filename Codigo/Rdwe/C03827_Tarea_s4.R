setwd("C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe")
# Se cambia la ruta
data1 <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ENAHO2014_transpyvivienda.csv",
  dec=',',
  na=c('#N/D','NS/NR'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)
# Se lee el archivo csv
is.data.frame(data1)
# Se confirma que es un data frame
data1[is.na(data1)] <- 0
# Se cambian los valores NA por 0
data1$IngresoBruto <- gsub('"','',data1$IngresoBruto)
data1$IngresoBruto <- gsub(',','.',data1$IngresoBruto)
data1$IngresoNeto <- gsub(',','.',data1$IngresoNeto)
data1$ID <- as.numeric(data1$ID)
data1$Segmento <- as.numeric(data1$Segmento)
data1$Alquiler <- as.numeric(data1$Alquiler)
data1$MontoPagar <- as.numeric(data1$MontoPagar)
data1$TamañoHogar <- as.numeric(data1$TamañoHogar)
data1$IngresoBruto <- gsub(' ','',data1$IngresoBruto)
data1$IngresoNeto <- gsub(' ','',data1$IngresoNeto)
data1$IngresoBruto <- as.numeric(data1$IngresoBruto)
data1$IngresoNeto <- as.numeric(data1$IngresoNeto)
data1$TipoViv <- as.numeric(as.factor(data1$TipoViv))
# Sustituciones a conveniencia y cambio de tipo a numeric
ncol(data1) # Número de variables:  10
nrow(data1) # Número de registros:  297
cuadro <- data.frame(cbind(ValorMedio = c(mean(data1$ID),
                                          mean(data1$Segmento),
                                          mean(data1$MontoPagar),
                                          mean(data1$Alquiler),
                                          mean(data1$TamañoHogar),
                                          mean(data1$TipoViv),
                                          mean(data1$IngresoBruto),
                                          mean(data1$IngresoNeto),
                                          mean(data1$CantVeh),
                                          mean(data1$CantMotos)),
                           DesviacionEstandar = c(sd(data1$ID),
                           sd(data1$Segmento),
                           sd(data1$MontoPagar),
                           sd(data1$Alquiler),
                           sd(data1$TamañoHogar),
                           sd(data1$TipoViv),
                           sd(data1$IngresoBruto),
                           sd(data1$IngresoNeto),
                           sd(data1$CantVeh),
                           sd(data1$CantMotos)),
                           Maximo = c(max(data1$ID),
                                      max(data1$Segmento),
                                      max(data1$MontoPagar),
                                      max(data1$Alquiler),
                                      max(data1$TamañoHogar),
                                      max(data1$TipoViv),
                                      max(data1$IngresoBruto),
                                      max(data1$IngresoNeto),
                                      max(data1$CantVeh),
                                      max(data1$CantMotos)),
                           Minimo = c(min(data1$ID),
                                      min(data1$Segmento),
                                      min(data1$MontoPagar),
                                      min(data1$Alquiler),
                                      min(data1$TamañoHogar),
                                      min(data1$TipoViv),
                                      min(data1$IngresoBruto),
                                      min(data1$IngresoNeto),
                                      min(data1$CantVeh),
                                      min(data1$CantMotos))))
#Resultado del cuadro:
#     ValorMedio DesviacionEstandar   Maximo Minimo
#1  1.490000e+02       8.588073e+01      297      1
#2  7.812795e+02       8.148877e+02     2059      1
#3  2.904404e+06       1.618330e+07 99999999  21000
#4  2.760943e-01       4.478185e-01        1      0
#5  3.498316e+00       1.636007e+00       12      1
#6  3.531987e+00       1.561732e+00        5      1
#7  1.534124e+06       1.514633e+06 12153917      0
#8  1.433132e+06       1.403635e+06 12153917      0
#9  7.003367e-01       8.144181e-01        4      0
#10 1.178451e-01       4.893301e-01        6      0
data2 <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ENAHO2014_transpyvivienda.csv",
  dec=',',
  na=c('#N/D','NS/NR'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)
table(data2[6])
# En TipoViv existen 5 tipos de vivienda diferentes
# Más común:  en fila o contigua, con una frecuencia de 153
# Más extraordinario:  en cuartería, con una frecuencia de 1