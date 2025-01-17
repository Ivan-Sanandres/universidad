#Comprobar la direcci�n y ajustarla a la ruta deseada
getwd()
setwd("C:/Users/PEDRO/Desktop/Universidad/Curso 2/Primer Cuatrimestre/Estad�stica/Primera Pr�ctica/practica grupal")

#Acceso y ordenaci�n de la base de datos en base al txt grupo12
datos=read.table("grupo12.txt",header=TRUE,sep="\t",dec=",")

#Variables para ambos sexos

sexoAux=datos[,1]	#Creaci�n de la variable sexo(cualitativa)
sexo=factor(sexoAux,levels=c(1,2),labels=c("hombre","mujer"))	#Hacemos que salga hombre y mujer en lugar de 1 y 2 respectivamente

edadAux=datos[,2]	#Creaci�n de la variable de edad(cuantitativa por intervalos)
haz.na.99=function(x){ifelse(x==99,NA,x)}	#Creamos una funci�n que cambia los 99 a NA ya que consideramos que son datos ausentes
edadAux=sapply(edadAux,haz.na.99)	#Aplicamos la funci�n haz.na.99 sobre edadAux
k=round(1+3.22*log10(300),0)	#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(edadAux)-min(edadAux))/k,0)											#Calculamos la amplitud de los intervalos
me = min(edadAux)															#guardamos min(edadAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(me-0.01,me+d,me+2*d,me+3*d,me+4*d,me+5*d,me+6*d,me+7*d,me+8*d,max(edadAux)+0.01)			#establecemos donde empieza y acaba cada intervalo de la edad
edad=cut(edadAux,breaks=limite,right=FALSE)										#Creamos la variable edad usando la variable limite para dividirla en intervalos

fumaAux=datos[,3]															#Creaci�n de la variable fuma(cualitativa)
fuma=factor(fumaAux,levels=c(1,0),labels=c("SI","NO"))								#cambiamos fuma de 1 y 0 a SI y NO respectivamente

HTAaux=datos[,4] 															#Creaci�n de la varible HTAaux(cualitativa)
HTA=factor(HTAaux,levels=c(1,0),labels=c("SI","NO"))									#Hacemos que en lugar de 1 y 0 salga SI y NO respectivamente

PASAux=datos[,5]															#Creaci�n de la variable de PAS(cuantitativa por intervalos)
#haz.na.0=function(x){ifelse(x<72,NA,x)}											#Creamos una funci�n que cambia los 0 a NA ya que consideramos que son datos ausentes
#PASAux=sapply(PASAux,haz.na.0)												#Aplicamos la funci�n haz.na.0 sobre PASAux
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(PASAux,na.rm=TRUE)-min(PASAux,na.rm=TRUE))/k,0)							#Calculamos la amplitud de los intervalos
mP = min(PASAux,na.rm=TRUE)													#guardamos min(PASAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mP-0.01,mP+d,mP+2*d,mP+3*d,mP+4*d,mP+5*d,mP+6*d,mP+7*d,mP+8*d,max(PASAux,na.rm=TRUE)+0.01)	#establecemos donde empieza y acaba cada intervalo de la PAS 
PAS=cut(PASAux,breaks=limite,right=FALSE)											#Creamos la variable PAS usando la variable limite para dividirla en intervalos

pesoAux=datos[,10]														#Creaci�n de la variable de peso(cuantitativa por intervalos)
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(pesoAux)-min(pesoAux))/k,1)											#Calculamos la amplitud de los intervalos
mp = min(pesoAux)															#guardamos min(pesoAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mp-0.01,mp+d,mp+2*d,mp+3*d,mp+4*d,mp+5*d,mp+6*d,mp+7*d,mp+8*d,max(pesoAux)+0.01)			#establecemos donde empieza y acaba cada intervalo de la edad
peso=cut(pesoAux,breaks=limite,right=FALSE)										#Creamos la variable peso usando la variable limite para dividirla en intervalos

tallaAux=datos[,11]														#Creaci�n de la variable de talla(cuantitativa por intervalos)
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(tallaAux)-min(tallaAux))/k,0)										#Calculamos la amplitud de los intervalos
mt = min(tallaAux)														#guardamos min(tallaAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mt-0.01,mt+d,mt+2*d,mt+3*d,mt+4*d,mt+5*d,mt+6*d,mt+7*d,mt+8*d,max(tallaAux)+0.01)		#establecemos donde empieza y acaba cada intervalo de la edad
talla=cut(tallaAux,breaks=limite,right=FALSE)										#Creamos la variable talla usando la variable limite para dividirla en intervalos

IMCAux=pesoAux/((tallaAux*0.01)*(0.01*tallaAux))								#Creaci�n de la variable de IMC(cuantitativa por intervalos)																
k=round(1+3.22*log10(300),0)												#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(IMCAux)-min(IMCAux))/k,0)										#Calculamos la amplitud de los intervalos
mt = min(IMCAux)														#guardamos min(IMCAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mt-0.01,mt+d,mt+2*d,mt+3*d,mt+4*d,mt+5*d,mt+6*d,mt+7*d,mt+8*d,max(IMCAux)+0.01)		#establecemos donde empieza y acaba cada intervalo de IMC
IMC=cut(IMCAux,breaks=limite,right=FALSE)		

#Variables para hombres

datosH = datos[datos[,1]==1,]

sexoAuxH=datosH[,1]	#Creaci�n de la variable sexo(cualitativa)
sexoH=factor(sexoAuxH,levels=c(1,2),labels=c("hombre","mujer"))	#Hacemos que salga hombre y mujer en lugar de 1 y 2 respectivamente

edadAuxH=datosH[,2]	#Creaci�n de la variable de edad(cuantitativa por intervalos)
haz.na.99=function(x){ifelse(x==99,NA,x)}	#Creamos una funci�n que cambia los 99 a NA ya que consideramos que son datos ausentes
edadAuxH=sapply(edadAuxH,haz.na.99)	#Aplicamos la funci�n haz.na.99 sobre edadAux
k=round(1+3.22*log10(300),0)	#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(edadAuxH)-min(edadAuxH))/k,0)											#Calculamos la amplitud de los intervalos
me = min(edadAuxH)															#guardamos min(edadAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(me-0.01,me+d,me+2*d,me+3*d,me+4*d,me+5*d,me+6*d,me+7*d,me+8*d,max(edadAuxH)+0.01)			#establecemos donde empieza y acaba cada intervalo de la edad
edadH=cut(edadAuxH,breaks=limite,right=FALSE)										#Creamos la variable edad usando la variable limite para dividirla en intervalos

fumaAuxH=datosH[,3]															#Creaci�n de la variable fuma(cualitativa)
fumaH=factor(fumaAuxH,levels=c(1,0),labels=c("SI","NO"))								#cambiamos fuma de 1 y 0 a SI y NO respectivamente

HTAauxH=datosH[,4] 															#Creaci�n de la varible HTAaux(cualitativa)
HTAH=factor(HTAauxH,levels=c(1,0),labels=c("SI","NO"))									#Hacemos que en lugar de 1 y 0 salga SI y NO respectivamente

PASAuxH=datosH[,5]															#Creaci�n de la variable de PAS(cuantitativa por intervalos)
#haz.na.0=function(x){ifelse(x<72,NA,x)}											#Creamos una funci�n que cambia los 0 a NA ya que consideramos que son datos ausentes
#PASAuxH=sapply(PASAuxH,haz.na.0)												#Aplicamos la funci�n haz.na.0 sobre PASAux
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(PASAuxH,na.rm=TRUE)-min(PASAuxH,na.rm=TRUE))/k,0)							#Calculamos la amplitud de los intervalos
mP = min(PASAuxH,na.rm=TRUE)													#guardamos min(PASAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mP-0.01,mP+d,mP+2*d,mP+3*d,mP+4*d,mP+5*d,mP+6*d,mP+7*d,mP+8*d,max(PASAuxH,na.rm=TRUE)+0.01)	#establecemos donde empieza y acaba cada intervalo de la PAS 
PASH=cut(PASAuxH,breaks=limite,right=FALSE)											#Creamos la variable PAS usando la variable limite para dividirla en intervalos

pesoAuxH=datosH[,10]														#Creaci�n de la variable de peso(cuantitativa por intervalos)
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(pesoAuxH)-min(pesoAuxH))/k,1)											#Calculamos la amplitud de los intervalos
mp = min(pesoAuxH)															#guardamos min(pesoAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mp-0.01,mp+d,mp+2*d,mp+3*d,mp+4*d,mp+5*d,mp+6*d,mp+7*d,mp+8*d,max(pesoAuxH)+0.01)			#establecemos donde empieza y acaba cada intervalo de la edad
pesoH=cut(pesoAuxH,breaks=limite,right=FALSE)										#Creamos la variable peso usando la variable limite para dividirla en intervalos

tallaAuxH=datosH[,11]														#Creaci�n de la variable de talla(cuantitativa por intervalos)
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(tallaAuxH)-min(tallaAuxH))/k,0)										#Calculamos la amplitud de los intervalos
mt = min(tallaAuxH)														#guardamos min(tallaAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mt-0.01,mt+d,mt+2*d,mt+3*d,mt+4*d,mt+5*d,mt+6*d,mt+7*d,mt+8*d,max(tallaAuxH)+0.01)		#establecemos donde empieza y acaba cada intervalo de la edad
tallaH=cut(tallaAuxH,breaks=limite,right=FALSE)										#Creamos la variable talla usando la variable limite para dividirla en intervalos

IMCAuxH=pesoAuxH/((tallaAuxH*0.01)*(0.01*tallaAuxH))								#Creaci�n de la variable de IMC(cuantitativa por intervalos)																
k=round(1+3.22*log10(300),0)												#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(IMCAuxH)-min(IMCAuxH))/k,0)										#Calculamos la amplitud de los intervalos
mt = min(IMCAuxH)														#guardamos min(IMCAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mt-0.01,mt+d,mt+2*d,mt+3*d,mt+4*d,mt+5*d,mt+6*d,mt+7*d,mt+8*d,max(IMCAuxH)+0.01)		#establecemos donde empieza y acaba cada intervalo de IMC
IMCH=cut(IMCAuxH,breaks=limite,right=FALSE)	

#Variables para mujeres

datosM = datos[datos[,1]==2,]

sexoAuxM=datosM[,1]	#Creaci�n de la variable sexo(cualitativa)
sexoM=factor(sexoAuxM,levels=c(1,2),labels=c("hombre", "mujer"))	#Hacemos que salga hombre y mujer en lugar de 1 y 2 respectivamente

edadAuxM=datosM[,2]	#Creaci�n de la variable de edad(cuantitativa por intervalos)
haz.na.99=function(x){ifelse(x==99,NA,x)}	#Creamos una funci�n que cambia los 99 a NA ya que consideramos que son datos ausentes
edadAuxM=sapply(edadAuxM,haz.na.99)	#Aplicamos la funci�n haz.na.99 sobre edadAux
k=round(1+3.22*log10(300),0)	#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(edadAuxM)-min(edadAuxM))/k,0)											#Calculamos la amplitud de los intervalos
me = min(edadAuxM)															#guardamos min(edadAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(me-0.01,me+d,me+2*d,me+3*d,me+4*d,me+5*d,me+6*d,me+7*d,me+8*d,max(edadAuxM)+0.01)			#establecemos donde empieza y acaba cada intervalo de la edad
edadM=cut(edadAuxM,breaks=limite,right=FALSE)										#Creamos la variable edad usando la variable limite para dividirla en intervalos

fumaAuxM=datosM[,3]															#Creaci�n de la variable fuma(cualitativa)
fumaM=factor(fumaAuxM,levels=c(1,0),labels=c("SI","NO"))								#cambiamos fuma de 1 y 0 a SI y NO respectivamente

HTAauxM=datosM[,4] 															#Creaci�n de la varible HTAaux(cualitativa)
HTAM=factor(HTAauxM,levels=c(1,0),labels=c("SI","NO"))									#Hacemos que en lugar de 1 y 0 salga SI y NO respectivamente

PASAuxM=datosM[,5]															#Creaci�n de la variable de PAS(cuantitativa por intervalos)
#haz.na.0=function(x){ifelse(x<72,NA,x)}											#Creamos una funci�n que cambia los 0 a NA ya que consideramos que son datos ausentes
#PASAuxM=sapply(PASAuxM,haz.na.0)												#Aplicamos la funci�n haz.na.0 sobre PASAux
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(PASAuxM,na.rm=TRUE)-min(PASAuxM,na.rm=TRUE))/k,0)							#Calculamos la amplitud de los intervalos
mP = min(PASAuxM,na.rm=TRUE)													#guardamos min(PASAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mP-0.01,mP+d,mP+2*d,mP+3*d,mP+4*d,mP+5*d,mP+6*d,mP+7*d,mP+8*d,max(PASAuxM,na.rm=TRUE)+0.01)	#establecemos donde empieza y acaba cada intervalo de la PAS 
PASM=cut(PASAuxM,breaks=limite,right=FALSE)											#Creamos la variable PAS usando la variable limite para dividirla en intervalos

pesoAuxM=datosM[,10]														#Creaci�n de la variable de peso(cuantitativa por intervalos)
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(pesoAuxM)-min(pesoAuxM))/k,1)											#Calculamos la amplitud de los intervalos
mp = min(pesoAuxM)															#guardamos min(pesoAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mp-0.01,mp+d,mp+2*d,mp+3*d,mp+4*d,mp+5*d,mp+6*d,mp+7*d,mp+8*d,max(pesoAuxM)+0.01)			#establecemos donde empieza y acaba cada intervalo de la edad
pesoM=cut(pesoAuxM,breaks=limite,right=FALSE)										#Creamos la variable peso usando la variable limite para dividirla en intervalos

tallaAuxM=datosM[,11]														#Creaci�n de la variable de talla(cuantitativa por intervalos)
k=round(1+3.22*log10(300),0)													#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(tallaAuxM)-min(tallaAuxM))/k,0)										#Calculamos la amplitud de los intervalos
mt = min(tallaAuxM)														#guardamos min(tallaAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mt-0.01,mt+d,mt+2*d,mt+3*d,mt+4*d,mt+5*d,mt+6*d,mt+7*d,mt+8*d,max(tallaAuxM)+0.01)		#establecemos donde empieza y acaba cada intervalo de la edad
tallaM=cut(tallaAuxM,breaks=limite,right=FALSE)										#Creamos la variable talla usando la variable limite para dividirla en intervalos

IMCAuxM=pesoAuxM/((tallaAuxM*0.01)*(0.01*tallaAuxM))								#Creaci�n de la variable de IMC(cuantitativa por intervalos)																
k=round(1+3.22*log10(300),0)												#Calculamos el n�mero de intervalos �ptimo seg�n la regla de Sturges
d=round((max(IMCAuxM)-min(IMCAuxM))/k,0)										#Calculamos la amplitud de los intervalos
mt = min(IMCAuxM)														#guardamos min(IMCAux) en una variable m�s corta porque lo vamos a usar muchas veces
limite=c(mt-0.01,mt+d,mt+2*d,mt+3*d,mt+4*d,mt+5*d,mt+6*d,mt+7*d,mt+8*d,max(IMCAuxM)+0.01)		#establecemos donde empieza y acaba cada intervalo de IMC
IMCM=cut(IMCAuxM,breaks=limite,right=FALSE)	

#Analisis univariado de cada variable
	#Cualitativas
	niSexo = table(sexo)									#frecuencia absoluta de sexo
	NiSexo = cumsum(niSexo)									#frecuencia absoluta acumulada de sexo
	fiSexo = prop.table(niSexo)								#frecuencia relativa de sexo
	FiSexo = cumsum(fiSexo)									#frecuencia relativa acumulada de sexo
	pie(niSexo,main="Distribuci�n por sexo de 300 sujetos")edad			#Representaci�n por gr�fico de tartas de la variable sexo

	niFuma = table(fuma)									#frecuencia absoluta de fuma
	NiFuma = cumsum(niFuma)									#frecuencia absoluta acumulada de fuma
	fiFuma = prop.table(niFuma)								#frecuencia relativa de fuma
	FiFuma = cumsum(fiFuma)									#frecuencia relativa acumulada de fuma
	pie(niFuma,main="Cantidad de fumadores entre 300 sujetos")			#Representaci�n por gr�fico de tartas de la variable fuma

	niHTA = table(HTA)									#frecuencia absoluta de HTA
	NiHTA = cumsum(niHTA)									#frecuencia absoluta acumulada de HTA
	fiHTA = prop.table(niHTA)								#frecuencia relativa de HTA
	FiHTA = cumsum(fiHTA)									#frecuencia relativa acumulada de HTA
	pie(niHTA,main="Distribuci�n por HTA de 300 sujetos")				#Representaci�n por gr�fico de tartas de la variable HTA
	
	#Cuantitativas
	niEdad = table(edad)									#frecuencia absoluta de edad
	NiEdad = cumsum(niEdad)									#frecuencia absoluta acumulada de edad
	fiEdad = prop.table(niEdad)								#frecuencia relativa de edad
	FiEdad = cumsum(fiEdad)									#frecuencia relativa acumulada de edad
	summary(edadAux)										#Calculamos cuartiles, el m�nimo y el m�ximo
	mean(edadAux)										#Calculamos la media
	sd(edadAux)											#Calculamos la desviaci�n t�pica
	hist(edadAux,main="Edad",xlab="edad",ylab="frecuencia absoluta")		#Histograma de la frecuencia relativa de edad
	boxplot(edadAux,main="Edad",ylab="a�os")						#diagrama de caja de la frecuencia relativa de edad

	niPAS = table(PAS)									#frecuencia absoluta de PAS
	NiPAS = cumsum(niPAS)									#frecuencia absoluta acumulada de PAS
	fiPAS = prop.table(niPAS)								#frecuencia relativa de edad
	FiPAS = cumsum(fiPAS)									#frecuencia relativa acumulada de PAS
	summary(PASAux)										#Calculamos cuartiles, el m�nimo y el m�ximo
	mean(PASAux)										#Calculamos la media
	sd(PASAux)											#Calculamos la desviaci�n t�pica
	boxplot(PASAux,main="PAS",ylab="mmHg")						#diagrama de caja de la frecuencia relativa de PASAux
	hist(PASAux,main="PAS",xlab="mmHg",ylab="frecuencia absoluta")		#histograma de PASAux

	niPeso = table(peso)									#frecuencia absoluta de peso
	NiPeso = cumsum(niPeso)									#frecuencia absoluta acumulada de peso
	fiPeso = prop.table(niPeso)								#frecuencia relativa de peso
	FiPeso = cumsum(fiPeso)									#frecuencia relativa acumulada de peso
	summary(pesoAux)										#Calculamos cuartiles, el m�nimo y el m�ximo
	mean(pesoAux)										#Calculamos la media
	sd(pesoAux)											#Calculamos la desviaci�n t�pica
	boxplot(pesoAux,main="PAS",ylab="KG")						#diagrama de caja de la frecuencia relativa de pesoAux
	hist(pesoAux,main="peso",xlab="KG",ylab="frecuencia absoluta")		#histograma de pesoAux

	niTalla = table(talla)									#frecuencia absoluta de talla
	NiTalla = cumsum(niTalla)								#frecuencia absoluta acumulada de talla
	fiTalla = prop.table(niTalla)								#frecuencia relativa de talla
	FiTalla = cumsum(fiTalla)								#frecuencia relativa acumulada de talla
	summary(tallaAux)										#Calculamos cuartiles, el m�nimo y el m�ximo
	mean(tallaAux)										#Calculamos la media
	sd(tallaAux)										#Calculamos la desviaci�n t�pica
	boxplot(tallaAux,main="talla",ylab="cm")						#diagrama de caja de la frecuencia relativa de tallaAux
	hist(tallaAux,main="talla",xlab="cm",ylab="frecuencia absoluta")		#histograma de tallaAux

	niIMC = table(IMC)									#frecuencia absoluta de talla
	NiIMC = cumsum(niIMC)								#frecuencia absoluta acumulada de talla
	fiIMC = prop.table(niIMC)								#frecuencia relativa de talla
	FiIMC = cumsum(fiIMC)								#frecuencia relativa acumulada de talla
	summary(IMCAux)										#Calculamos cuartiles, el m�nimo y el m�ximo
	mean(IMCAux)										#Calculamos la media
	sd(IMCAux)										#Calculamos la desviaci�n t�pica
	boxplot(IMCAux,main="IMC",ylab="cm")						#diagrama de caja de la frecuencia relativa de tallaAux
	hist(IMCAux,main="IMC",xlab="cm",ylab="frecuencia absoluta")		#histograma de tallaAux


#An�lisis bivariado con la variable sexo

	#Cualitativas con sexo
	conjuntoSexoFuma=table(sexo,fuma)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoFumaRelativa=prop.table(conjuntoSexoFuma)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoFuma)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoFumaRelativa)						#f.j y fi. de las frecuencias relativas marginales
	fumaCondSexo=prop.table(conjuntoSexoFuma,1)					#variable fuma condicionada al sexo
	addmargins(fumaCondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(fumaCondSexo),main="Fumadores seg�n el sexo",xlab="sexo",ylab="fuma",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores

	conjuntoSexoHTA=table(sexo,HTA)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoHTARelativa=prop.table(conjuntoSexoHTA)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoHTA)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoHTARelativa)						#f.j y fi. de las frecuencias relativas marginales
	HTACondSexo=prop.table(conjuntoSexoHTA,1)					#variable fuma condicionada al sexo
	addmargins(HTACondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(HTACondSexo),main="HTA seg�n el sexo",xlab="sexo",ylab="HTA",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores

	#Cuantitativas con sexo
	conjuntoSexoEdad=table(sexo,edad)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoEdadRelativa=prop.table(conjuntoSexoEdad)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoEdad)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoEdadRelativa)						#f.j y fi. de las frecuencias relativas marginales
	edadCondSexo=prop.table(conjuntoSexoEdad,1)					#variable fuma condicionada al sexo
	addmargins(edadCondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(edadCondSexo),main="Edad seg�n el sexo",xlab="sexo",ylab="edad",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores
	boxplot(edadAux~sexo,main="Edad seg�n el sexo",xlab="sexo",ylab="edad",legend.text=T)
	
	conjuntoSexoPAS=table(sexo,PAS)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoPASRelativa=prop.table(conjuntoSexoPAS)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoPAS)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoPASRelativa)						#f.j y fi. de las frecuencias relativas marginales
	PASCondSexo=prop.table(conjuntoSexoPAS,1)					#variable fuma condicionada al sexo
	addmargins(PASCondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(PASCondSexo),main="PAS seg�n el sexo",xlab="sexo",ylab="PAS",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores
	boxplot(PASAux~sexo,main="PAS seg�n el sexo",xlab="sexo",ylab="PAS",legend.text=T)

	conjuntoSexoPeso=table(sexo,peso)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoPesoRelativa=prop.table(conjuntoSexoPeso)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoPeso)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoPesoRelativa)						#f.j y fi. de las frecuencias relativas marginales
	pesoCondSexo=prop.table(conjuntoSexoPeso,1)					#variable fuma condicionada al sexo
	addmargins(pesoCondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(pesoCondSexo),main="Peso seg�n el sexo",xlab="sexo",ylab="peso",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores
	boxplot(pesoAux~sexo,main="Peso seg�n el sexo",xlab="sexo",ylab="peso",legend.text=T)

	
	conjuntoSexoTalla=table(sexo,talla)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoTallaRelativa=prop.table(conjuntoSexoTalla)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoTalla)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoTallaRelativa)						#f.j y fi. de las frecuencias relativas marginales
	tallaCondSexo=prop.table(conjuntoSexoTalla,1)					#variable fuma condicionada al sexo
	addmargins(tallaCondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(tallaCondSexo),main="Talla seg�n el sexo",xlab="sexo",ylab="talla",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores
	boxplot(tallaAux~sexo,main="Talla seg�n el sexo",xlab="sexo",ylab="talla",legend.text=T)

	conjuntoSexoIMC=table(sexo,IMC)							#tabla nij (frecuencia absoluta conjunta)
	conjuntoSexoIMCRelativa=prop.table(conjuntoSexoIMC)				#tabla de fij frecuencia relativa conjunta
	addmargins(conjuntoSexoIMC)								#ni. y n.j de las frecuencias absolutas marginales 
	addmargins(conjuntoSexoIMCRelativa)							#f.j y fi. de las frecuencias relativas marginales
	IMCCondSexo=prop.table(conjuntoSexoIMC,1)						#variable fuma condicionada al sexo
	addmargins(IMCCondSexo,2)								#frecuencias condicionadas marginales
	barplot(t(IMCCondSexo),main="IMC seg�n el sexo",xlab="sexo",ylab="IMC",legend.text=T)	#se crea un diagrama de barras que indica la relaci�n entre el sexo y los fumadores y no fumadores
	boxplot(IMCAux~sexo,main="IMC seg�n el sexo",xlab="sexo",ylab="IMC",legend.text=T)


#An�lisis de regresi�n lineal de PAS

	cor(cbind(edad,PAS,talla,HTA,fuma,peso,sexo,IMC))					#Matriz de correlaci�n lineal de las variables
	

	#Com ambos sexos
	plot(edadAux,PASAux,"p",col ="purple")	#Sacar la nube de puntos
	regresionPASedad=lm(PASAux~edadAux)		#Calcular una regresi�n lineal de m�nimos cuadrados
	regresionPASedad					#La mostramos
	summary(regresionPASedad)			#Mostramos los datos de la regresi�n
	abline(regresionPASedad, col = "red")	#Dibujamos la l�nea sobre la nube de puntos

	plot(tallaAux,PASAux,"p",col ="purple")
	regresionPASTalla=lm(PASAux~tallaAux)
	regresionPASTalla
	summary(regresionPASTalla)	
	abline(regresionPASTalla, col = "red")

	plot(HTA,PASAux,"p",col ="purple", xlab="PAS", ylab="HTA")
	regresionPASHTA=lm(PASAux~HTA)
	regresionPASHTA
	summary(regresionPASHTA)	
	abline(regresionPASHTA, col = "red")
		
	plot(fuma,PASAux,"p",col ="purple")
	regresionPASfuma=lm(PASAux~fuma)
	regresionPASfuma
	summary(regresionPASfuma)	
	abline(regresionPASfuma, col = "red")

	plot(pesoAux,PASAux,"p",col ="purple")
	regresionPASpeso=lm(PASAux~pesoAux)
	regresionPASpeso
	summary(regresionPASpeso)	
	abline(regresionPASpeso, col = "red")

	plot(sexo,PASAux,"p",col ="purple")
	regresionPASSexo=lm(PASAux~sexo)
	regresionPASSexo
	summary(regresionPASSexo)	
	abline(regresionPASSexo, col = "red")

	plot(IMCAux,PASAux,"p",col ="purple")
	regresionPASIMC=lm(PASAux~IMCAux)
	regresionPASIMC
	summary(regresionPASIMC)	
	abline(regresionPASIMC, col = "red")
	
	#Con mujeres

	cor(cbind(edadM,PASM,tallaM,HTAM,fumaM,pesoM,sexoM,IMCM))

	plot(edadAuxM,PASAuxM,"p",col ="purple")	#Sacar la nube de puntos
	regresionPASedadM=lm(PASAuxM~edadAuxM)	#Calcular una regresi�n lineal de m�nimos cuadrados
	regresionPASedadM					#La mostramos
	summary(regresionPASedadM)			#Mostramos los datos de la regresi�n
	abline(regresionPASedadM, col = "red")	#Dibujamos la l�nea sobre la nube de puntos

	plot(tallaAuxM,PASAuxM,"p",col ="purple")
	regresionPASTallaM=lm(PASAuxM~tallaAuxM)
	regresionPASTallaM
	summary(regresionPASTallaM)	
	abline(regresionPASTallaM, col = "red")

	plot(HTAM,PASAuxM,"p",col ="purple")
	regresionPASHTAM=lm(PASAuxM~HTAM)
	regresionPASHTAM
	summary(regresionPASHTAM)	
	abline(regresionPASHTAM, col = "red")
		
	plot(fumaM,PASAuxM,"p",col ="purple")
	regresionPASfumaM=lm(PASAuxM~fumaM)
	regresionPASfumaM
	summary(regresionPASfumaM)	
	abline(regresionPASfumaM, col = "red")

	plot(pesoAuxM,PASAuxM,"p",col ="purple")
	regresionPASpesoM=lm(PASAuxM~pesoAuxM)
	regresionPASpesoM
	summary(regresionPASpesoM)	
	abline(regresionPASpesoM, col = "red")

	plot(sexoM,PASAuxM,"p",col ="purple")
	regresionPASSexoM=lm(PASAuxM~sexoM)
	regresionPASSexoM
	summary(regresionPASSexoM)	
	abline(regresionPASSexoM, col = "red")

	plot(IMCAuxM,PASAuxM,"p",col ="purple")
	regresionPASIMCM=lm(PASAuxM~IMCAuxM)
	regresionPASIMCM
	summary(regresionPASIMCM)	
	abline(regresionPASIMCM, col = "red")

	#Con hombres
	cor(cbind(edadH,PASH,tallaH,HTAH,fumaH,pesoH,sexoH,IMCH))

	plot(edadAuxH,PASAuxH,"p",col ="purple")	#Sacar la nube de puntos
	regresionPASedadH=lm(PASAuxH~edadAuxH)	#Calcular una regresi�n lineal de m�nimos cuadrados
	regresionPASedadH					#La mostramos
	summary(regresionPASedadH)			#Mostramos los datos de la regresi�n
	abline(regresionPASedadH, col = "red")	#Dibujamos la l�nea sobre la nube de puntos

	plot(tallaAuxH,PASAuxH,"p",col ="purple")
	regresionPASTallaH=lm(PASAuxH~tallaAuxH)
	regresionPASTallaH
	summary(regresionPASTallaH)	
	abline(regresionPASTallaH, col = "red")

	plot(HTAH,PASAuxH,"p",col ="purple", xlab = "HTA", ylab = "PAS")
	regresionPASHTAH=lm(PASAuxH~HTAH)
	regresionPASHTAH
	summary(regresionPASHTAH)	
	abline(regresionPASHTAH, col = "red")
		
	plot(fumaH,PASAuxH,"p",col ="purple")
	regresionPASfumaH=lm(PASAuxH~fumaH)
	regresionPASfumaH
	summary(regresionPASfumaH)	
	abline(regresionPASfumaH, col = "red")

	plot(pesoAuxH,PASAuxH,"p",col ="purple")
	regresionPASpesoH=lm(PASAuxH~pesoAuxH)
	regresionPASpesoH
	summary(regresionPASpesoH)	
	abline(regresionPASpesoH, col = "red")

	plot(sexoH,PASAuxH,"p",col ="purple")
	regresionPASSexoH=lm(PASAuxH~sexoH)
	regresionPASSexoH
	summary(regresionPASSexoH)	
	abline(regresionPASSexoH, col = "red")

	plot(IMCAuxH,PASAuxH,"p",col ="purple")
	regresionPASIMCH=lm(PASAuxH~IMCAuxH)
	regresionPASIMCH
	summary(regresionPASIMCH)	
	abline(regresionPASIMCH, col = "red")

	


