library(dplyr)
# Se cambia la ruta
setwd("C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe")

# Se importan los data frames
GAM_porcanton_consumodegasolina <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ProyectoFinal/GAM_porcanton_consumodegasolina.csv",
  dec=',',
  na=c('nd'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)

GAM_Porcanton_PEA <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ProyectoFinal/GAM_Porcanton_PEA.csv",
  dec=',',
  na=c('nd'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)

GAM_Porcanton_trabajadores <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ProyectoFinal/GAM_Porcanton_trabajadores.csv",
  dec=',',
  na=c('nd'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)

GAM_Porcanton_areaconstruidatotal <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ProyectoFinal/GAM_Porcanton_areaconstruidatotal.csv",
  dec=',',
  na=c('nd'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)

#Se modifican los data frames para posteriormente agruparlos por variables

GAM_porcanton_consumodegasolina$CCANT <- NULL

colnames(GAM_Porcanton_areaconstruidatotal)[colnames(GAM_Porcanton_areaconstruidatotal) == 'CCANT'] <- 'CANTON'

GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('101','San José',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('102','Escazú',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('103','Desamparados',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('106','Aserrí',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('107','Mora',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('108','Goicoechea',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('109','Santa Ana',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('110','Alajuelita',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('111','Vásquez de Coronado',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('113','Tibás',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('114','Moravia',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('115','Montes de Oca',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('118','Curridabat',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('201','Alajuela',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('205','Atenas',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('208','Poás',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('301','Cartago',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('302','Paraíso',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('303','La Unión',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('306','Alvarado',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('307','Oreamuno',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('308','El Guarco',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('401','Heredia',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('402','Barva',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('403','Santo Domingo',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('404','Santa Bárbara',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('405','San Rafael',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('406','San Isidro',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('407','Belén',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('408','Flores',GAM_Porcanton_areaconstruidatotal$CANTON)
GAM_Porcanton_areaconstruidatotal$CANTON <- gsub('409','San Pablo',GAM_Porcanton_areaconstruidatotal$CANTON)

GAM_Porcanton_PEA$Cantón <- gsub('San José Cantón Central','San José',GAM_Porcanton_PEA$Cantón)
GAM_Porcanton_PEA$Cantón <- gsub('Alajuela Cantón Central','Alajuela',GAM_Porcanton_PEA$Cantón)
GAM_Porcanton_PEA$Cantón <- gsub('Cartago Cantón Central','Cartago',GAM_Porcanton_PEA$Cantón)
GAM_Porcanton_PEA$Cantón <- gsub('Heredia Cantón Central','Heredia',GAM_Porcanton_PEA$Cantón)

GAM_Porcanton_trabajadores$Cantón <- gsub('San José Cantón Central','San José',GAM_Porcanton_trabajadores$Cantón)
GAM_Porcanton_trabajadores$Cantón <- gsub('Alajuela Cantón Central','Alajuela',GAM_Porcanton_trabajadores$Cantón)
GAM_Porcanton_trabajadores$Cantón <- gsub('Cartago Cantón Central','Cartago',GAM_Porcanton_trabajadores$Cantón)
GAM_Porcanton_trabajadores$Cantón <- gsub('Heredia Cantón Central','Heredia',GAM_Porcanton_trabajadores$Cantón)

names(GAM_Porcanton_PEA)[1] <- 'CANTON'
names(GAM_Porcanton_trabajadores)[1] <- 'CANTON'

cantones2 <- GAM_Porcanton_areaconstruidatotal[ , 1]

GAM_PobTotal2 <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ProyectoFinal/GAM_PobTotal.csv",
  dec=',',
  na=c('nd'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)

GAM_PobTotal2$CCANT <- NULL
GAM_PobTotal2$CANTON <- NULL
GAM_PobTotal2$CANTON <- NULL

Pob1993 <- GAM_PobTotal2[1:31, ]
Pob1994 <- GAM_PobTotal2[32:62, ]
Pob1995 <- GAM_PobTotal2[63:93, ]
Pob1996 <- GAM_PobTotal2[94:124, ]
Pob1997 <- GAM_PobTotal2[125:155, ]
Pob1998 <- GAM_PobTotal2[156:186, ]
Pob1999 <- GAM_PobTotal2[187:217, ]
Pob2000 <- GAM_PobTotal2[218:248, ]
Pob2001 <- GAM_PobTotal2[249:279, ]
Pob2002 <- GAM_PobTotal2[280:310, ]
Pob2003 <- GAM_PobTotal2[311:341, ]
Pob2004 <- GAM_PobTotal2[342:372, ]
Pob2005 <- GAM_PobTotal2[373:403, ]
Pob2006 <- GAM_PobTotal2[404:434, ]
Pob2007 <- GAM_PobTotal2[435:465, ]
Pob2008 <- GAM_PobTotal2[466:496, ]
Pob2009 <- GAM_PobTotal2[497:527, ]
Pob2010 <- GAM_PobTotal2[528:558, ]
Pob2011 <- GAM_PobTotal2[559:589, ]
Pob2012 <- GAM_PobTotal2[590:620, ]
Pob2013 <- GAM_PobTotal2[621:651, ]
Pob2014 <- GAM_PobTotal2[652:682, ]
Pob2015 <- GAM_PobTotal2[683:713, ]
Pob2016 <- GAM_PobTotal2[714:744, ]
Pob2017 <- GAM_PobTotal2[745:775, ]
Pob2018 <- GAM_PobTotal2[776:806, ]
Pob2019 <- GAM_PobTotal2[807:837, ]
Pob2020 <- GAM_PobTotal2[838:868, ]

Pob1993$YR <- NULL
Pob1994$YR <- NULL
Pob1995$YR <- NULL
Pob1996$YR <- NULL
Pob1997$YR <- NULL
Pob1998$YR <- NULL
Pob1999$YR <- NULL
Pob2000$YR <- NULL
Pob2001$YR <- NULL
Pob2002$YR <- NULL
Pob2003$YR <- NULL
Pob2004$YR <- NULL
Pob2005$YR <- NULL
Pob2006$YR <- NULL
Pob2007$YR <- NULL
Pob2008$YR <- NULL
Pob2009$YR <- NULL
Pob2010$YR <- NULL
Pob2011$YR <- NULL
Pob2012$YR <- NULL
Pob2013$YR <- NULL
Pob2014$YR <- NULL
Pob2015$YR <- NULL
Pob2016$YR <- NULL
Pob2017$YR <- NULL
Pob2018$YR <- NULL
Pob2019$YR <- NULL
Pob2020$YR <- NULL

# header <- c('CANTON','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020')

GAM_PobTotal2 <- Pob1993
GAM_PobTotal2 <- rbind(GAM_PobTotal2,Pob1993)

GAM_PobTotal2 <- data.frame(CANTON = cantones2,
                            X1993 = Pob1993[1:31,1],
                            X1994 = Pob1994[1:31,1],
                            X1995 = Pob1995[1:31,1],
                            X1996 = Pob1996[1:31,1],
                            X1997 = Pob1997[1:31,1],
                            X1998 = Pob1998[1:31,1],
                            X1999 = Pob1999[1:31,1],
                            X2000 = Pob2000[1:31,1],
                            X2001 = Pob2001[1:31,1],
                            X2002 = Pob2002[1:31,1],
                            X2003 = Pob2003[1:31,1],
                            X2004 = Pob2004[1:31,1],
                            X2005 = Pob2005[1:31,1],
                            X2006 = Pob2006[1:31,1],
                            X2007 = Pob2007[1:31,1],
                            X2008 = Pob2008[1:31,1],
                            X2009 = Pob2009[1:31,1],
                            X2010 = Pob2010[1:31,1],
                            X2011 = Pob2011[1:31,1],
                            X2012 = Pob2012[1:31,1],
                            X2013 = Pob2013[1:31,1],
                            X2014 = Pob2014[1:31,1],
                            X2015 = Pob2015[1:31,1],
                            X2016 = Pob2016[1:31,1],
                            X2017 = Pob2017[1:31,1],
                            X2018 = Pob2018[1:31,1],
                            X2019 = Pob2019[1:31,1],
                            X2020 = Pob2020[1:31,1])

GAM_PobTotal <- GAM_PobTotal2

ggplot() + geom_line(data=GAM_PobTotal, 
                     mapping=aes(x=c(1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020),
                                 y=c(X1993,X1994,X1995,X1996,X1997,X1998,X1999,X2000,X2001,X2002,X2003,X2004,X2005,X2006,X2007,X2008,X2009,X2010,X2011,X2012,X2013,X2014,X2015,X2016,X2017,X2018,X2019,X2020),
                                 color=CANTON), 
                     alpha=0.5)+
  scale_size(range=c(1,31))+
  labs(x="Año",
       y="Población total",
       title = "Evolución de la población total en el tiempo")+
  theme(text=element_text(size=8),plot.title=element_text(hjust=0.5))+
  theme_bw()

summary(GAM_PobTotal)
sd(GAM_PobTotal$X1993)
sd(GAM_PobTotal$X1994)
sd(GAM_PobTotal$X1995)
sd(GAM_PobTotal$X1996)
sd(GAM_PobTotal$X1997)
sd(GAM_PobTotal$X1998)
sd(GAM_PobTotal$X1999)
sd(GAM_PobTotal$X2000)
sd(GAM_PobTotal$X2001)
sd(GAM_PobTotal$X2002)
sd(GAM_PobTotal$X2003)
sd(GAM_PobTotal$X2004)
sd(GAM_PobTotal$X2005)
sd(GAM_PobTotal$X2006)
sd(GAM_PobTotal$X2007)
sd(GAM_PobTotal$X2008)
sd(GAM_PobTotal$X2009)
sd(GAM_PobTotal$X2010)
sd(GAM_PobTotal$X2011)
sd(GAM_PobTotal$X2012)
sd(GAM_PobTotal$X2013)
sd(GAM_PobTotal$X2014)
sd(GAM_PobTotal$X2015)
sd(GAM_PobTotal$X2016)
sd(GAM_PobTotal$X2017)
sd(GAM_PobTotal$X2018)
sd(GAM_PobTotal$X2019)
sd(GAM_PobTotal$X2020)

datos <- 
