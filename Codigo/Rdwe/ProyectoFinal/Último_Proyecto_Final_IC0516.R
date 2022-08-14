# David Herrera Murillo C03827
# Andrés Urcuyo Ovares C07970
# Briza Mariana Salas Ortiz C07088

# Reporte final 

library(tidyr)
library(dplyr)
library(ggplot2)
library(tidyverse)

setwd("C:/users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ProyectoFinal")

#### Importar y explorar datos ####

canton_areaConstruidaTotal <- read.table("./GAM_porcanton_areaconstruidatotal.csv", header = T, sep = ";", fill = T, stringsAsFactors = T)

PobTotal<- read.table("./GAM_PobTotal.csv", header = T, sep = ";", fill = T, stringsAsFactors = T)

canton_consumoGasolina <- read.table("./GAM_porcanton_consumodegasolina.csv", header = T, sep = ";", fill = T, dec = ",")

#Cambiar "," por "." para 1989, 1990, 1991, 1992
canton_consumoGasolina$X1989 <- gsub(',','.',canton_consumoGasolina$X1989)
canton_consumoGasolina$X1990 <- gsub(',','.',canton_consumoGasolina$X1990)
canton_consumoGasolina$X1991 <- gsub(',','.',canton_consumoGasolina$X1991)
canton_consumoGasolina$X1992 <- gsub(',','.',canton_consumoGasolina$X1992)

#Cambiar a variable de tipo numérica
canton_consumoGasolina$X1989 <- as.numeric(canton_consumoGasolina$X1989)
canton_consumoGasolina$X1990 <- as.numeric(canton_consumoGasolina$X1990)
canton_consumoGasolina$X1991 <- as.numeric(canton_consumoGasolina$X1991)
canton_consumoGasolina$X1992 <- as.numeric(canton_consumoGasolina$X1992)

#Cantón como factor
canton_consumoGasolina$CANTON <- factor(canton_consumoGasolina$CANTON)

#R recodificó automáticamente "nd" como NA

canton_PEA <- read.table("./GAM_porcanton_PEA.csv", header = T, sep = ";", fill = T, dec = ",", stringsAsFactors = T)

canton_trabajadores <- read.table("./GAM_porcanton_trabajadores.csv", header = T, sep = ";", fill = T, dec = ",", stringsAsFactors = T)

total_ingresosPrecios <- read.table("./GAM_total_ingresosyprecios.csv", header = T, sep = ";", fill = T,dec = ",")

# Yr=Year, Pr=Price,Y=Income

#### Explorar datos ####
summary(canton_areaConstruidaTotal)
summary(canton_consumoGasolina)
summary(canton_PEA)
summary(canton_trabajadores)
summary(PobTotal)
summary(total_ingresosPrecios)

# Cambiar todos los data frames para que Cantón y Año sean columnas, como ocurre para PobTotal y total_ingresosPrecios

canton_areaConstruidaTotal <- gather(canton_areaConstruidaTotal, YR, areaConstruidaTotal, 'X1993':'X2021')
canton_areaConstruidaTotal$YR <- gsub('X','',canton_areaConstruidaTotal$YR)
canton_areaConstruidaTotal$YR <- as.integer(canton_areaConstruidaTotal$YR)

canton_consumoGasolina <- gather(canton_consumoGasolina, YR, consumoGasolina, 'X1989':'X2020')
canton_consumoGasolina$YR <- gsub('X','',canton_consumoGasolina$YR)
canton_consumoGasolina$YR <- as.integer(canton_consumoGasolina$YR)

canton_PEA <- gather(canton_PEA, YR, PEA, 'X1990':'X2020')
canton_PEA$YR <- gsub('X','',canton_PEA$YR)
canton_PEA$YR <- as.integer(canton_PEA$YR)

canton_trabajadores <- gather(canton_trabajadores, YR, PEA, 'X1989':'X2021')
canton_trabajadores$YR <- gsub('X','',canton_trabajadores$YR)
canton_trabajadores$YR<- as.integer(canton_trabajadores$YR)

# Creación del data frame de gasolina per cápita: 
# la población total tiene datos de 1993 a 2020, y consumo gasolina de 1989 a 2020.

# Se eliminan datos de 1989, 1990, 1991 y 1992 en un data frame auxiliar

canton_consumoGasolina_pc <- canton_consumoGasolina
canton_consumoGasolina_pc <- canton_consumoGasolina_pc[-1:-124,]

# Dividir entre la consumo de gasolina entre la población total para que sean cantidades per cápita

pob_total <- PobTotal$POPtot
canton_consumoGasolina_pc <- cbind(canton_consumoGasolina_pc,pob_total)
consumoGasolina_pc <- (canton_consumoGasolina_pc$consumoGasolina/canton_consumoGasolina_pc$pob_total)
canton_consumoGasolina_pc <- cbind(canton_consumoGasolina_pc,consumoGasolina_pc)


#### Explorar nuevos data frames####
summary(canton_areaConstruidaTotal)
summary(canton_consumoGasolina)
summary(canton_consumoGasolina_pc)
summary(canton_PEA)
summary(canton_trabajadores)


#### Gráficos ####

# Para el total de la GAM y los cantones de San Jose (101), Alajuela (201), Cartago (301) y Heredia (401)

# la evolución en el tiempo del consumo de gasolina per cápita,(1993,2020)

# Data frame auxiliar que contenga los datos totales por año

total_consumoGasolina_pc <- cbind(aggregate(consumoGasolina ~ YR,canton_consumoGasolina_pc, sum),
                                  aggregate(pob_total ~ YR,canton_consumoGasolina_pc, sum))
total_consumoGasolina_pc <- total_consumoGasolina_pc[,-3]
consumoGasolina_pc_total <- c(total_consumoGasolina_pc$consumoGasolina/total_consumoGasolina_pc$pob_total)
total_consumoGasolina_pc <- cbind(total_consumoGasolina_pc,consumoGasolina_pc_total)

# Data frame auxiliar que contenga los datos únicamente para San José, Alajuela, Cartago y Heredia

consumoGasolina_pc_SJ_A_C_H <-rbind(canton_consumoGasolina_pc[canton_consumoGasolina_pc$CCANT==101,],
                                    canton_consumoGasolina_pc[canton_consumoGasolina_pc$CCANT==201,],
                                    canton_consumoGasolina_pc[canton_consumoGasolina_pc$CCANT==301,],
                                    canton_consumoGasolina_pc[canton_consumoGasolina_pc$CCANT==401,])

# Graficar
ggplot() + 
  geom_line(data=consumoGasolina_pc_SJ_A_C_H, 
             mapping=aes(x=YR, y=consumoGasolina_pc, group=CANTON, color=CANTON))+
  scale_color_manual(values=c("springgreen4","dodgerblue3","goldenrod3","orangered3", "purple3"))+
  xlim(1990,2020)+
  labs(x="Año",
       y="Consumo de Gasolina per cápita (m^3)",
       color="Cantón",
       title = "Evolución en el tiempo del consumo de gasolina per cápita para los cantones de San Jose, Alajuela, Cartago y Heredia,
       y para el total de la GAM")+
  theme(text = element_text(size=12),plot.title=element_text(hjust=0.5))+ 
  theme_bw()+
  geom_line(data=total_consumoGasolina_pc, 
            mapping=aes(x=YR, y=consumoGasolina_pc_total, color='Total de la GAM'))

#el área total construida, (1993-2021)

# Data frame auxiliar que contenga los datos totales por año

total_areaConstruidaTotal <- cbind(aggregate(areaConstruidaTotal ~ YR,canton_areaConstruidaTotal, sum))

# Data frame auxiliar que contenga los datos únicamente para San José, Alajuela, Cartago y Heredia

areaConstruidaTotal_SJ_A_C_H <-rbind(canton_areaConstruidaTotal[canton_areaConstruidaTotal$CCANT==101,],
                                     canton_areaConstruidaTotal[canton_areaConstruidaTotal$CCANT==201,],
                                     canton_areaConstruidaTotal[canton_areaConstruidaTotal$CCANT==301,],
                                     canton_areaConstruidaTotal[canton_areaConstruidaTotal$CCANT==401,])

areaConstruidaTotal_SJ_A_C_H$CCANT <- gsub('101','San José',areaConstruidaTotal_SJ_A_C_H$CCANT)
areaConstruidaTotal_SJ_A_C_H$CCANT <- gsub('201','Alajuela',areaConstruidaTotal_SJ_A_C_H$CCANT)
areaConstruidaTotal_SJ_A_C_H$CCANT <- gsub('301','Cartago',areaConstruidaTotal_SJ_A_C_H$CCANT)
areaConstruidaTotal_SJ_A_C_H$CCANT <- gsub('401','Heredia',areaConstruidaTotal_SJ_A_C_H$CCANT)

# Graficar
ggplot() + 
  geom_line(data=areaConstruidaTotal_SJ_A_C_H, 
            mapping=aes(x=YR, y=areaConstruidaTotal, group=CCANT, color=CCANT))+
  scale_color_manual(values=c("springgreen4","dodgerblue3","goldenrod3","orangered3", "purple3"))+
  xlim(1990,2022)+
  labs(x="Año",
       y="Área total construida (m^2)",
       color="Cantón",
       title = "Evolución en el tiempo del área total construida para los cantones de San Jose, Alajuela, Cartago y Heredia,
       y para el total de la GAM")+
  theme(text=element_text(size=12),plot.title=element_text(hjust=0.5))+
  theme_bw()+
  geom_line(data=total_areaConstruidaTotal, 
            mapping=aes(x=YR, y=areaConstruidaTotal, color='Total de la GAM'))


#la cantidad de trabajadores (1989-2021)

# Data frame auxiliar que contenga los datos totales por año

total_trabajadores <- cbind(aggregate(PEA ~ YR,canton_trabajadores, sum))

# Data frame auxiliar que contenga los datos únicamente para San José, Alajuela, Cartago y Heredia

trabajadores_SJ_A_C_H <-rbind(canton_trabajadores[canton_trabajadores$Cantón=="San José Cantón Central",],
                              canton_trabajadores[canton_trabajadores$Cantón=="Alajuela Cantón Central",],
                              canton_trabajadores[canton_trabajadores$Cantón=="Cartago Cantón Central",],
                              canton_trabajadores[canton_trabajadores$Cantón=="Heredia Cantón Central",])

# Graficar
ggplot() + 
  geom_line(data=trabajadores_SJ_A_C_H, 
            mapping=aes(x=YR, y=PEA, group=Cantón, color=Cantón))+
  scale_color_manual(values=c("springgreen4","dodgerblue3","goldenrod3","orangered3", "purple3"))+
  xlim(1988,2022)+
  labs(x="Año",
       y="Cantidad de trabajadores asegurados directos del seguro de salud",
       color="Cantón",
       title = "Evolución en el tiempo de la cantidad de trabajadores asegurados directos del seguro de salud para los 
       cantones de San Jose, Alajuela, Cartago y Heredia, y para el total de la GAM")+
  theme(text=element_text(size=12),plot.title=element_text(hjust=0.5))+
  theme_bw()+
  geom_line(data=total_trabajadores, 
            mapping=aes(x=YR, y=PEA, color='Total de la GAM'))


# la población económicamente activa (1990-2020)

# Data frame auxiliar que contenga los datos totales por año

total_PEA <- cbind(aggregate(PEA ~ YR,canton_PEA, sum))

# Data frame auxiliar que contenga los datos únicamente para San José, Alajuela, Cartago y Heredia

PEA_SJ_A_C_H <-rbind(canton_PEA[canton_PEA$Cantón=="San José Cantón Central",],
                     canton_PEA[canton_PEA$Cantón=="Alajuela Cantón Central",],
                     canton_PEA[canton_PEA$Cantón=="Cartago Cantón Central",],
                     canton_PEA[canton_PEA$Cantón=="Heredia Cantón Central",])

# Graficar
ggplot() + 
  geom_line(data=PEA_SJ_A_C_H, 
            mapping=aes(x=YR, y=PEA, group=Cantón, color=Cantón))+
  scale_color_manual(values=c("springgreen4","dodgerblue3","goldenrod3","orangered3", "purple3"))+
  xlim(1990,2020)+
  labs(x="Año",
       y="Población económicamente activa, según estimaciones de la CCSS",
       color="Cantón",
       title = "Evolución en el tiempo de la población económicamente activa, según estimaciones de la CCSS para los 
       cantones de San Jose, Alajuela, Cartago y Heredia, y para el total de la GAM")+
  theme(text=element_text(size=12),plot.title=element_text(hjust=0.5))+
  theme_bw()+
  geom_line(data=total_PEA, 
            mapping=aes(x=YR, y=PEA, color='Total de la GAM'))



# Cruce de variables para el total regional : 

# Consumo de gasolina per capita vs. área total construida

# Data frame auxiliar 

areaConstruida <- total_areaConstruidaTotal[1:28,2]

gasolinaPC_areaConstruida <- cbind(total_consumoGasolina_pc,areaConstruida)

ggplot() + 
  geom_point(data=gasolinaPC_areaConstruida, 
            mapping=aes(x=areaConstruida, y=consumoGasolina_pc_total, color="Total de la GAM", size=2))+
  scale_color_manual(values=c("dodgerblue3"))+
  scale_size(guide='none')+
  labs(x="Área total construida (m^2)",
       y="Consumo de gasolina per cápita (m^3)",
       color="Cantón",
       title = "Consumo de gasolina per cápita en función del área total construida, para el total de la GAM")+
  theme(text=element_text(size=12),plot.title=element_text(hjust=0.5))+
  theme_bw()


#Consumo de gasolina per capita vs. ingreso medio regional
ingreso <- total_ingresosPrecios$Y
gasolinaPC_ingreso<- cbind(total_consumoGasolina_pc,ingreso)

ggplot() + 
  geom_point(data=gasolinaPC_ingreso, 
            mapping=aes(x=ingreso,y=consumoGasolina_pc_total, color="Total de la GAM", size=2))+
  scale_color_manual(values=c("dodgerblue3"))+
  scale_size(guide='none')+
  labs(x="Ingreso promedio de cada hogar (???)",
       y="Consumo de gasolina per cápita (m^3)",
       color="Cantón",
       title = "Consumo de gasolina per cápita en función del ingreso medio regional, para el total de la GAM")+
  theme(text=element_text(size=12),plot.title=element_text(hjust=0.5))+
  theme_bw()


#Consumo de gasolina per capita vs. precio del combustible
precio <- total_ingresosPrecios$Pr
gasolinaPC_precio <- cbind(total_consumoGasolina_pc,precio)

ggplot() + 
  geom_point(data=gasolinaPC_precio, 
            mapping=aes(x=precio,y=consumoGasolina_pc_total, color="Total de la GAM", size=2))+
  scale_color_manual(values=c("dodgerblue3"))+
  scale_size(guide='none')+
  labs(x="Precio de combustibles (???)",
       y="Consumo de gasolina per cápita (m^3)",
       color="Cantón",
       title = "Consumo de gasolina per cápita en función del precio de los combustibles, para el total de la GAM")+
  theme(text=element_text(size=12),plot.title=element_text(hjust=0.5))+
  theme_bw()



# Modelo de regresión

# Verificar la normalidad de los datos:




# Análisis para consumo de gasolina per cápita:
summary(gasolinaPC_ingreso$consumoGasolina_pc_total)
sd(gasolinaPC_ingreso$consumoGasolina_pc_total)

# Histograma de densidad con curva normal teórica:
ggplot(data=gasolinaPC_ingreso, aes(x=consumoGasolina_pc_total))+
  geom_histogram(aes(y=..density..),bins=14,fill='darkslategray4',color='brown1',size=1)+
  labs(title="",x="Consumo de gasolina per cápita",y="Densidad")+
  stat_function(fun = function(x)
    dnorm(x,mean=mean(gasolinaPC_ingreso$consumoGasolina_pc_total),
          sd=sd(gasolinaPC_ingreso$consumoGasolina_pc_total)),color='green',size=1.2)+
  theme(legend.position="none",plot.margin=margin(0,1,1,1,"pt"))

# Q-Q Plot:
qqnorm(gasolinaPC_ingreso$consumoGasolina_pc_total, main = 'Consumo de gasolina per cápita',
       xlab = 'Cuantiles teóricos',ylab = 'Cuantiles muestrales')
qqline(gasolinaPC_ingreso$consumoGasolina_pc_total)
grid() # Los datos se alejan de la línea en los extremos superior e inferior

# Test de normalidad de Shapiro:
shapiro.test(gasolinaPC_ingreso$consumoGasolina_pc_total)# Valor P>0.05 pero no parece normal


# Se transforma como distribución bimodal:
consumo_transformado <- abs(gasolinaPC_ingreso$consumoGasolina_pc_total - mean(gasolinaPC_ingreso$consumoGasolina_pc_total))
shapiro.test(consumo_transformado)
# De nuevo se transforma como distribución bimodal:
consumo_transformado2 <- abs(consumo_transformado - mean(consumo_transformado))
shapiro.test(consumo_transformado2) # Valor P = 0.4593, alto

# Q-Q Plot de la transformación:
qqnorm(consumo_transformado2, main = 'Consumo de gasolina per cápita',
       xlab = 'Cuantiles teóricos',ylab = 'Cuantiles muestrales')
qqline(consumo_transformado2) # No parece normal

plot(density(consumo_transformado2), main= 'Densidad del consumo de gasolina per cápita',
     ylab = 'Densidad',xlab='')



# Análisis para ingreso medio regional:
summary(gasolinaPC_ingreso$ingreso)
sd(gasolinaPC_ingreso$ingreso)

# Histograma de densidad con curva normal teórica:
ggplot(data=gasolinaPC_ingreso, aes(x=ingreso))+
  geom_histogram(aes(y=..density..),bins=10,fill='darkslategray4',color='brown1',size=1)+
  labs(title="",x="Ingresos per cápita",y="Densidad")+
  stat_function(fun = function(x)
    dnorm(x,mean=mean(gasolinaPC_ingreso$ingreso),
          sd=sd(gasolinaPC_ingreso$ingreso)),color='green',size=1.2)+
  facet_grid(scales='free')+
  theme(legend.position="none")


# Q-Q Plot:
qqnorm(gasolinaPC_ingreso$ingreso, main = 'Ingreso medio regional',
       xlab = 'Cuantiles teóricos',ylab = 'Cuantiles muestrales')
qqline(gasolinaPC_ingreso$ingreso)
grid()

# Test de normalidad de Shapiro:
shapiro.test(gasolinaPC_ingreso$ingreso) # No se distribuyen de manera normal.



# Se transforman los datos suponiendo que siguen una distribución bimodal:
ingreso_transformado <- abs(gasolinaPC_ingreso$ingreso - mean(gasolinaPC_ingreso$ingreso))
shapiro.test(ingreso_transformado) # Ahora se obtiene un valor P muy alto
plot(density(ingreso_transformado),main='Ingreso medio regional',
     ylab='Densidad',xlab='') # Se obtiene distribución normal

# Q-Q Plot de la transformación:
qqnorm(ingreso_transformado, main = 'Ingreso medio regional',
       xlab = 'Cuantiles teóricos',ylab = 'Cuantiles muestrales')
qqline(ingreso_transformado)
grid() # Se ve bastante normal




# Análisis para precio del combustible:
summary(gasolinaPC_precio$precio)
sd(gasolinaPC_precio$precio)

# Histograma de densidad con curva normal teórica:
ggplot(data=gasolinaPC_precio, aes(x=precio))+
  geom_histogram(aes(y=..density..),bins=7,fill='darkslategray4',color='brown1',size=1)+
  labs(title="",x="Precio del combustible",y="Densidad")+
  stat_function(fun = function(x)
    dnorm(x,mean=mean(gasolinaPC_precio$precio),
          sd=sd(gasolinaPC_precio$precio)),color='green',size=1.2)+
  theme(legend.position="none")

# Q-Q Plot:
qqnorm(gasolinaPC_precio$precio, main = 'Precio del combustible',
       xlab = 'Cuantiles teóricos',ylab = 'Cuantiles muestrales')
qqline(gasolinaPC_precio$precio)
grid()

# Test de normalidad de Shapiro:
shapiro.test(gasolinaPC_precio$precio) # Valor de P alto



# Se plantean los modelos de regresión:

# Modelo para consumo de gasolina per cápita e ingreso medio:
datos_modelo <- data.frame(gasolinaPC_precio$consumoGasolina,
                           gasolinaPC_precio$precio,
                           gasolinaPC_ingreso$ingreso) # Nuevo data frame

modelo <- lm(consumo_transformado2~ingreso_transformado + precio,data=datos_modelo)
summary(modelo)# El modelo es relativamente bueno en explicar la relación que tiene el precio
# con el consumo de combustible. Los cuartiles parecen ser relativamente equidistantes y
# la mediana es cercana a 0. El modelo presenta un valor de R cuadrado ajustado de 0.05 y 
# un valor P de 0.1989.
# Sin embargo, la variable de ingreso per cápita no presenta
# un gran peso para el modelo, aún después de ser transformada.

#Valor P = 0.1989, Las variables escogidas tienen peso en el consumo del combustible
plot(modelo)


# Pruebas de heteroscedasticidad, multicolinealidad y normalidad de errores: 


# install.packages('lmtest')       -      bptest
# install.packages('sandwich')     -      coeftest
# install.packages('car')          -      vif

library(lmtest)
library(sandwich)
library(car)

bptest(modelo) # Verificar si hay heteroscedasticidad.  P = 0.1591


coeftest(modelo, vcov = vcovHC(modelo, type = "HC3")) # Corrección de heteroscedasticidad


vif(modelo)# Análisis de factor de inflación de varianza.
# 1.0185, relativamente bajo.


# Prueba de Durbin-Watson para la autocorrelación:

durbinWatsonTest(modelo) # P = 0.066, autocorrelación = 0.2374
