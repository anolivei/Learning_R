
# ************** INTRODUCÃO
 
	#http://www.r-project.org/

	#Software livre
	#Códigos abertos, reproduzíveis e adaptáveis

# ************** LEITURA DE DADOS

	# Vetor
		dados1 <- c(1,2,3,4)
		dados1_1 <- dados1*2

		dados2 <- scan()
		dados3 <- rep(0,4)
		

		dados4 <- 20:25
		dados4_1 <- dados4[2]

		dados5 <- c(rep(1,2), 50:55, dados3)


	# Matrix
		dados_matrix <- matrix(c(1,2,3,4,5,6,7,8,9),3,3)
		t(dados_matrix)

	# Dados disponibilizados pelo R	
		data(mtcars)	
		dados_R <- head(mtcars) 

		dados_R[1,]
		dados_R[,1]

	# Verificar o diretório 
		getwd()

	# Mudar o diretório 
		setwd()
		
	# Salvar Arquivo
		write(dados_matrix, "teste.txt",ncolumns=3)
          
     # Ler arquivo
		read.table("teste.txt")


# ************** BIBLIOTECAS

	# Bibliotecas já disponíveis
          require(MASS)==T
     
          
     #Dados já disponíveis
		library(datasets)
		data(iris)
		head(iris)


# ************** FUNÇÕES

		data <- TRUE

		for(i in 1:10)
		{
			data[i] <- i
		}

		j<-0
		while(1>0)
		{
			j <- j+1
			if(j == 5)
			{break}
		}
		

# ************** ANÁLISE DESCRITIVA

		mean(dados)
		var(dados)
		max(dados)
		summary(dados)


# ************** GR?FICOS

		plot(dados)
		hist(dados)
		pie(dados)
		boxplot(dados)


# ************** MODELAGEM

	# Números aleatórios 
		rnorm()

	# Probabilidades
		pnorm()

	# Quantís
		qnorm()

	# Densidade
		dnorm()

# ************** DISTRIBUIÇÕES 

	# Uniforme
		runif() ; punif() ; qunif() ; dunif()

	# Exponencial
		rexp() ; pexp() ; qexp() ; dexp()

	# Poisson
		rpois() ; ppois() ; qpois() ; dpois()

	# Chi-Quadrado
		rchisq() ; pchisq() ; qchisq() ; dchisq()


# ************** INFERÊNCIA

	# Testes de Hipótese 
		anova()
		t.test()
		chisq.test()
		ks.test()

	# Regressão 
		lm()
		stepAIC()
		glm()

	# Amostragem 
		sample()

	# Simulação
		boot() ; # library("bootstrap")

	# Séries Temporais
		arima()

	# Análise Multivariada
		hclust()
		kmeans()

# ************** AJUDA

	help()
	help.search("?")

	# http://cran.r-project.org/doc/manuals/R-intro.html

# ******************************************************* 

# 	Obrigada a todos
# 
# 	"Não pergunte se o R é capaz de fazer algo. 
# 	Pergunte como ele faz!" 
# 		Bill Venables
# 
# 
# 	Quit
      q()

# ******************************************************* 




