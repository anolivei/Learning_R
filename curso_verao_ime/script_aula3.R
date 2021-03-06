
# Introdução à Programação em R
# XLIX Programa De Verão (2021)
# Nathália Demetrio, Geovana Lopes e Alex Kushima

# --- dia 3 

# Revisando - Estruturas de Dados -----
    #No R existem 6 tipos de dados, em geral trabalhamos com 4: character > numeric > integer > logical
    #Estes dados podem ser organizados em 5 estruturas: vetor atômico, matriz, array, data.frame e listas
        #REPASSAR CAPITULO DE ESTRUTURA DA AULA 1 


# Revisando - Manipulação de dados com o Rbase -----
    state.abb
    state.area
    state.center
    state.division
    state.name
    state.region
    state.x77
    
        #qual dos datasets acima é uma matriz?
          is.matrix(state.x77)
          class(state.x77)
        #o que são os nomes à esquerda? como acessa-los?
          rownames(state.x77)
        #retorne as linhas de "Virginia" e "Colorado"
          state.x77[rownames(state.x77) %in% c("Virginia", "Colorado"),]
        #retorne as colunas de "Population" e "Income"
          state.x77[,colnames(state.x77) %in% c("Population", "Income")]
          
        #transforme todos os datasets em um data frame chamado state
        state <- data.frame(state.abb, state.area, state.division, 
                     state.name, state.region, state.x77, state.center)
        
        #se tivessemos transformado em matrix, qual seria o problema?
          cbind(state.abb, state.area) #viraria matriz
            #no caso de querer combinar empilhar por linhas 
            rbind(state.abb, state.area)
        
        #acesse a coluna x da base state.center das três formas abaixo, qual a diferença entre elas? 
           # state.center$x
            class(state.center$x)
           # state.center[["x"]]
            class(state.center[["x"]])
           # state.center["x"]
            class(state.center["x"])
          
        #voltando aos dados state, exclua as colunas "repetidas", i.e. colunas que contenham as mesmas informações
        #quantos estados possuem em cada região?
          state <- state[,!(colnames(state) %in% c("Area", "state.name" ))]
          
        #qual state.division possui a maior renda (`Income`)? E a menor?
          state[state$Income == 6315,"state.division"]
          state[state$Income == max(state$Income),"state.division"]
          as.character(state[state$Income == max(state$Income),"state.division"])

        #as variáveis `Illiteracy` e `Murder` são correlacionadas?
          cor(state$Illiteracy, state$Murder)
          
        #considerando todas as colunas numéricas, qual é a mais correlacionada com a variável `Murder`?
          cor(state)
          cor(state[,!(colnames(state) %in% c("state.region","state.abb", "state.name", "state.division"))])
          
        #adicione uma coluna que tenha a contagem dos estados
          state <- data.frame(state, contagem = 1:nrow(state))
          
        #Visualize a versão final do dataset criado
          View(state)
          
# :::::::::::: hands-on pt.0 -----
          
        #exporte os dados em um arquivo .csv
        write.csv(state, "base_exportada.csv")
        
        #em qual diretório o arquivo se encontra?
        getwd()
        
        #qual a função que altera o diretório
        setwd()
        
        #delete o objeto state e releia o arquivo
        rm(state)
        state
        state <- read.csv("D:/OneDrive/_R/_cursoR/202001_veraoIME_cursoR/base_exportada.csv")
        state
        
# Importação/exportação -----
    #Com a função `write.table()`, tendo como parametros o nome do objeto a ser exportado e o path desejado
    #o arquivo é criado no diretório de trabalho. 
    #Para saber qual o diretório de trabalho corrente, utilizamos o comando `getwd()` (*get working directory*)
    #Enquanto que para alterar o diretório de trabalho temos a função `setwd()` (*set working directory*)
    
    #Alternativamente podemos especificar o destino do arquivo de interesse, precedendo o nome do arquivo 
    #com o diretório desejado, p.e.: `write.table(mtcars, file = "C:/Users/mtcars.txt")` 
    #note que trabalhamos com barras simples (`/` ou `\\`) para especificação de diretórios.
    
    #para a leitura de arquivos: `read.table`
    
    #Tanto a função `write.table()` quanto a `read.table()`possuem uma série de parâmetros, 
    #permitindo especificações de separadores, títulos e comentários, 
    #além de variações de extenção
    #para consultar funções relacionadas pesquise os tópicos `??read` e `??write`.


# .Rproj -----
    #Existe ainda uma terceira alternativa: trabalhar com a opção de projetos do RStudio (`.RProj`). 
    #Nesta, o diretório em que o arquivo `.RProj` estiver salvo, passa a ser a pasta raiz da análise. 
    #Para criar um projeto no RStudio, é necessário clicar no ícone superior à direita:
    
        
# :::::::::::: hands-on pt.1 -----
    # 1) crie um projeto em um novo repositório, 
    # 2) salve um script chamado "aula_2_hands_on.R" neste repo
    # 3) no script escreva um programa que tire uma amostra aleatória de tamanho 50 da base de dados iris, 
    #   considerando para tal a set.seed(1), visando garantir a reprodutibilidade dos resultados
    # 4) salve este novo data.frame em um arquivo .csv e o exclua do seu environment
    # 5) leia o arquivo .csv em um novo objeto, chamado iris_amostra
    # 6) rode uma análise estatística da base iris original e da base que vc criou
    #   você observou alguma mudança significativa?
    
# :::::::::::: hands-on pt.2 -----
  # em duplas zip o repositório criado e envie para a sua dupla
  # sua dupla deve conseguir abrir a pasta e rodar toda a sua análise sem ter problemas com os diretórios 
        
        
# Estruturas de controle -----
    #Estruturas de controle são blocos de programação que, baseado em parâmetros pré-definidos, 
    #define a direção a seguir. o R possui todas as funções usualmente existentes em outras linguagens
    #Contudo, vamos primeiro listar os principais operadores lógicos disponíveis no R:
        
        #retorna TRUE (T) ou FALSE (F) se:
            !x #não
            x | y #ou: retornando T/F para cada elemento das comparações
            x || y #ou, retornando apenas um T/F (1ª comparação à esquerda do vetor)
            x & y #e, retornando T/F para cada elemento das comparações
            x && y #e, retornando apenas um T/F (1ª comparação à esquerda do vetor)
            x %in% y #se os elementos à esquerda, um a um, estão contidos à direita

        #Além das funções `any()` e `all()`, uteis no caso de vetores lógicos
            
    #Voltando as estruturas de controle, considerando fluxos condicionais e de repetição, temos:
        
        #if: se a declaração for verdade, então os comandos dentro das chaves `{}` serão executados: 
            x <- 1
            if(x != 0){
                print(x+1)
            }
            
    
        #if-else: similar ao comando `if()` porém seguido de um segundo bloco, que será avaliado se, 
        #e somente se, o resultado do primeiro bloco for `FALSE`: 
            x <- 30
            if (x<=10) {
                print("x é menor ou igual a 10")
            } else if (x>10 & x<20) {
                print("x está entre 10 e 20")
            } else{
                print("x é maior ou igual a 20")
            }
    
        #ifelse: versão mais simples, em que especificamos ambas as ações como parametro de uma função
            x <- "olar"
            ifelse(x == "olar", "flor.do.campo", "xovens")

            
        #for: uma sequência de instruções que são repetidas com cada um dos elementos especificados:
            x <- 1:3
            for(i in x){
                print(i)
            }

            #Podemos não utilizar as chaves caso as instruções sejam dadas em até uma linha após o `for`:
            x <- 1:3
            for(i in x) print(i)
            
    
        #nested loops: De modo similar ao anterior temos o caso dos loops aninhados:
            x <- 1:2; y <- c(1,10)
            for(i in seq(x)){
                for(j in seq(y)) print(x[i]*y[j])
            }

        #while: repetição de um bloco de comandos até que certa condição não seja mais satisfeita:
            i <- 1
            while (i<=6){
                print(i*i)
                i = i+1
            }
 
    #além dos comandos citados, existem ainda funções como: 
            #`break()`, que pode ser utilizado para interromper um loop e dar continuidade ao fluxo, ou
            #`next()`, que descontinua uma interação particular, e pula para a próxima, 
        

# Funções -----
    #No R podemos criar as nossas próprias funções, por meio do objeto function(). 
    #O que permite a automação de atividades de forma: estruturada, consistente, escalonável e reprodutível
    #Para criar tais funções existem três aspectos que devemos considerar: 
        #o nome do objeto criado para a função ser armazenada (que terá papel fundamental na legibilidade do código), 
        #os argumentos que a função pode, ou não, possuir, e 
        #o corpo da função, onde é definido o que a função faz, e o que retorna.       
            #modelo
            #nome_funcao <- function(arg_1, arg_2, ...){
            #    corpo da função
            #}
            
            #exemplo
            celcius_fahrenheit <- function(temp_c){
                temp_f <- (temp_c * 9/5) + 32
                temp_f #ou, equivalentemente, return(temp_f)
            }
            celcius_fahrenheit(temp_c = 25)
            
    #Em relação ao retorno da função, o R, por default, retorna a última linha do corpo da função.
    #Alternativamente, a função `return()`, que independe da posição do item no corpo da função.
            
    #Quanto aos argumentos, assim como ocorre nas funções *built-in*, podemos especificar valores default 
    #adicionalmente, quando o corpor da função estiver na mesma linha do comando `function`
    #o uso de chaves não é necessário - assim como descrito para o comando `for()`:
      #exemplos
        ex_function <- function(x, y=1) x+y
        ex_function(1,0)
        ex_function(1)    
        
    #Ao definir funções, podemos salva-las em outros scripts e chama-las por meio da função `source()`, 
    #sendo necessário especificar apenas o nome do script (e o diretório caso este não se encontre em outro diretório).

        
    #Funções possuem os seus próprios ambientes, ou `environment`
    #ou seja, sua própria coleção de objetos (funções, variáveis, etc)
    #Assim os cálculos realizados dentro de uma função não alteram, e não são registrados, pelos demais ambientes.
    #Contudo, o `environment` de uma função consegue consultar o ambiente em que foi definida (`parent environment`)
    #bem como o ambiente pai deste, e assim por diante, de forma hierárquica
    #Tal recurso é utilizado no contexto em que algum objeto necessário para a execução da função não é encontrado.
        #exemplo
        temp_c <- 25
        
        celcius_fahrenheit <- function(){
            temp_f <- (temp_c * 9/5) + 32
            temp_f #ou, equivalentemente, return(temp_f)
        }
        
        temp_f
        celcius_fahrenheit()
        temp_f
        
    #Vale ressaltar que o exemplo acima foi desenhado visando ilustrar como o R lida 
    #com os funções e seus ambientes. Porém, em termos práticos, é extremamente desaconselhável 
    #deixar que a função dependa de parâmetros externos ao seu próprio `environment`. 
    #Idealmente, todas as dependências devem ser especificadas e passadas como argumentos da função.
        

# Bibliotecas -----
    #Bibliotecas tratam-se de uma coleção de funções, dados e códigos compilados
    #A instalação destas bibliotecas/pacotes, pode ser feita pelo comando `install.packages("nome_do_pacote")`
    #Após a instalação é necessário apenas carregar os pacotes desejados, por meio do comando `library(nome_do_pacote)`
        install.packages("praise")
        library(praise)

        praise::praise()
 
    #Tais bibliotecas se encontram disponíveis pela rede de distribuição oficial do R, o CRAN 
    #Mas existem também bibliotecas disponibilizadas via repositórios como o Bioconductor, GitHub, ou mesmo via .zip
        
        #exemplo
            #instalação do pacote a partir do CRAN
            install.packages("dplyr")
            #instalação a partir do git (versão mais recente da biblioteca)
            devtools::install_github("tidyverse/dplyr")
            #instalação a partir de um arquivo .zip
            install.packages("C:/Users/dplyr.zip", repos = NULL)

    #Uma vez que a biblioteca esteja instalada, não é necessário carregar toda a biblioteca 
    #sendo suficiente utilizar o nome da biblioteca, seguido por `::` e a função desejada
        #nome_da_biblioteta::função_de_interesse()
            
            dplyr::band_members
            
    #Para checar quais bibliotecas estão instaladas: aba `Packages` do RStudio, ou `installed.packages()`. 
    #As atualizações das bibliotecas podem ser feitas para todas as bibliotecas com `update.packages()`, 
    #ou reinstalando o pacote de interesse - para consultar quais estão desatualizadas temos `old.packages()`.
            
    #refs: 
        #link bibliotecas: https://cran.r-project.org/web/views/
        #link bibliotecas: https://awesome-r.com/
          
# :::::::::::: QUIZ 2 & Refs -----
            
  # Refs:
    # Rstudio Learn (material em inglês) 
      # https://rstudio.cloud/learn/primers/1.2
            
    #	Point-and-click Rbase
      # precisa instalar várias bibliotecas
      # install.packages("Rcmdr")
      # library(Rcmdr)
