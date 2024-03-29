# Se importa la librer�a que contiene a ggplot2:

library(ggplot2)

# Se especifica el path:

setwd("C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe")

# Se importan los datos:

data1 <- read.csv2(
  "C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/Rdwe/ENAHO2014_transpyvivienda.csv",
  dec=',',
  na=c('#N/D','NS/NR'),
  sep=';',
  stringsAsFactors = FALSE,
  header=TRUE)

# Se modifican los datos:

data1[is.na(data1)] <- 0
data1$IngresoBruto <- gsub('"','',data1$IngresoBruto)
data1$IngresoBruto <- gsub(',','.',data1$IngresoBruto)
data1$IngresoNeto <- gsub(',','.',data1$IngresoNeto)
data1$ID <- as.numeric(data1$ID)
data1$Segmento <- as.numeric(data1$Segmento)
data1$Alquiler <- as.numeric(data1$Alquiler)
data1$MontoPagar <- as.numeric(data1$MontoPagar)
data1$Tama�oHogar <- as.numeric(data1$Tama�oHogar)
data1$IngresoBruto <- gsub(' ','',data1$IngresoBruto)
data1$IngresoNeto <- gsub(' ','',data1$IngresoNeto)
data1$IngresoBruto <- as.numeric(data1$IngresoBruto)
data1$IngresoNeto <- as.numeric(data1$IngresoNeto)
data1$IngresoBruto <- round(data1$IngresoBruto, digits = 0)
data1$IngresoNeto <- round(data1$IngresoNeto, digits = 0)
data1$CantVeh <- as.numeric(data1$CantVeh)
data1$TipoViv <- as.numeric(as.factor(data1$TipoViv))
# Primer gr�fico:

ggplot() + 
  geom_point(data=data1,
             mapping = aes(x = IngresoNeto,
                          y = MontoPagar,
                          color = factor(CantVeh),
                          size = Tama�oHogar,
                          shape = factor(Alquiler)),

            alpha = 0.5) +
  labs(x = 'Ingreso Neto',
       y = 'Monto a Pagar',
       color = 'Cantidad de Veh�culos',
       size = 'Tama�o de Hogar',
       shape = 'Alquiler') + 
  scale_color_manual(values = c('red','blue','green','yellow','pink')) +
  scale_y_continuous(trans = 'log1p') +
  scale_size(range = c(1, 5)) +
  theme(text = element_text(size=8))
  
#Segundo gr�fico:

ggplot() +
  geom_point(data=data1,
             mapping = aes(x = IngresoNeto,
                           y = MontoPagar,
                           color = factor(TipoViv),
                           size = Tama�oHogar,
                           shape = factor(Alquiler)),
             alpha = 0.5) +
  labs(x = 'Ingreso Neto',
       y = 'Monto a Pagar',
       color = 'Tipo de Vivienda',
       size = 'Tama�o de Hogar',
       shape = 'Alquiler') +
  scale_color_manual(values = c('yellow','blue','pink','green','red')) +
  scale_y_continuous(trans = 'log1p') +
  scale_size(range = c(1,5)) +
  theme(text = element_text(size=8))

# Parte 2

# Gr�fico 3
ggplot(data1, aes(ID)) +
  geom_bar(fill = 'red') + 
  labs(x = 'ID',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 4
ggplot(data1, aes(Segmento)) +
  geom_bar(fill = 'blue') + 
  labs(x = 'Segmento',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 5
ggplot(data1, aes(factor(MontoPagar))) +
  geom_bar(fill = 'yellow') + 
  labs(x = 'Monto a Pagar',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 6
ggplot(data1, aes(Alquiler)) +
  geom_bar(fill = 'green') + 
  labs(x = 'Alquiler',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 7
ggplot(data1, aes(Tama�oHogar)) +
  geom_bar(fill = 'red') + 
  labs(x = 'Tama�o de Hogar',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 8
ggplot(data1, aes(TipoViv)) +
  geom_bar(fill = 'blue') + 
  labs(x = 'Tipo de Vivienda',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 9
ggplot(data1, aes(factor(IngresoBruto))) +
  geom_bar(fill = 'green') + 
  labs(x = 'Ingreso Bruto',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 10
ggplot(data1, aes(factor(IngresoNeto))) +
  geom_bar(fill = 'yellow') + 
  labs(x = 'Ingreso Neto',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 11
ggplot(data1, aes(CantVeh)) +
  geom_bar(fill = 'blue') + 
  labs(x = 'Cantidad de Veh�culos',
       y = 'Frecuencia') +
  theme_minimal()

# Gr�fico 12
ggplot(data1, aes(CantMotos)) +
  geom_bar(fill = 'red') + 
  labs(x = 'Cantidad de Motos',
       y = 'Frecuencia') +
  theme_minimal()

# Parte 3:

# Gr�fico 13
ggplot() +
  geom_point(data=data1,
             mapping = aes(x = IngresoNeto,
                           y = MontoPagar,
                           color = factor(TipoViv),
                           size = Tama�oHogar,
                           shape = factor(Alquiler)),
             alpha = 0.5) +
  labs(x = 'Ingreso Neto',
       y = 'Monto a Pagar',
       color = 'Cantidad de Veh�culos',
       size = 'Tama�o de Hogar',
       shape = 'Alquiler') +
  scale_color_manual(values = c('yellow','blue','pink','green','red')) +
  scale_y_continuous(trans = 'log1p') +
  scale_size(range = c(1,5)) +
  theme(text = element_text(size=8)) +
  facet_wrap(vars(TipoViv))