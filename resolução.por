programa{ 
	//bibliotecas
	inclua biblioteca Util --> ut
	//variáveis globais
	
	caracter jogo[3][3]
	inteiro l, c, linha, coluna

	funcao criandoMatriz(){
		para(l = 0; l < 3; l++){
			para(c = 0; c < 3; c++){
				jogo[l][c] = ' ' 
			}
		}
	}
	
	funcao escrevendoMatriz(){
		escreva("\n\n  0   1    2\n\n")
		para(l = 0; l < 3; l++){
			para(c = 0; c < 3; c++){
				escreva(" ", jogo[l][c])
				se(c < 2){
					escreva(" | ")
				}se(c == 2){
					escreva("  ", l)
				}
			}se(l < 2){
        escreva("\n -----------")
			}
      escreva("\n")
		}
	}

	funcao lerPosicao(inteiro jogador){ 
		faca{
			faca{
				escreva("\nJogador ",jogador, " Digite a linha: ")
				leia(linha)
				escreva("Jogador ", jogador, " Digite a coluna: ")
				leia(coluna)	
			}enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
		}enquanto(jogo[linha][coluna] != ' ')
	}

  ///atualizar jogador
	funcao inteiro atualizarJogador(inteiro jogador){ 
    		se(jogador == 1){
      		jogador = 2 
    		}
    		senao{
      		jogador = 1
    		}
        retorne jogador
  	}


	//salvando uma jogada
	funcao inteiro saveJogada(inteiro jogador){
		se(jogador == 1){
			jogo[linha][coluna] = 'o'
		}
		senao{
			jogo[linha][coluna] = 'x'
		}
		retorne 1
	}

	 
	
	//Ganhou por linha?
	funcao inteiro ganhouPorLinha(caracter k){
		para(l = 0; l < 3; l++){
			se(jogo[l][0] == k e jogo[l][1] == k e jogo[l][2] == k){
				retorne 1 //Jogador ganhou 
			}
		}
		retorne 0 //Segue o jogo
	}

	//funcao para teste de vitoria por linha dos jogadores
	funcao inteiro ganhouPorLinhas(){//Matheus
		se(ganhouPorLinha('o') == 1)
		{
			retorne 1 //jogador 1 ganhou
		}
		se(ganhouPorLinha('x') == 1)
		{
			retorne 2 //jogador 2 ganhou
		}
		retorne 0 //ninguem ganhou
	}
	
	//Ganhou por coluna?
	funcao inteiro ganhouPorColuna(caracter f){
			para(c = 0; c < 3; c++)
			{
			se(jogo[0][c] == f e jogo[1][c] == f e jogo[2][c] == f)
			{
				 retorne 1 //jogador ganhou
			}
		}
		retorne 0 //segue jogo
	}

	//Quem ganhou por coluna? Alguem ganhou?
	funcao inteiro ganhouPorColunas(){
		se(ganhouPorColuna('o') == 1)
		{
			retorne 1 //jog 1 venceu
		}
		se(ganhouPorColuna('x') == 1)
		{
			retorne 2 //jog 2 venceu
		}
		retorne 0 //ninguem venceu
	}
	
	//Ganhou na Diagonal principal?
	funcao inteiro ganhouDPrincipal(caracter d){
		se(jogo[0][0] == d e jogo[1][1] == d e jogo[2][2] == d)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal principal? Alguem ganhou?
	funcao inteiro ganhouDiPrincipal() {
		se(ganhouDPrincipal('o') == 1)
		{
			retorne 1
		}
		se(ganhouDPrincipal('x') == 1)
		{
			retorne 2
      
		}
		retorne 0
	}
	
	//Ganhou na diagonal secundária?
	funcao inteiro ganhouDSecundaria(caracter p){
		se(jogo[0][2] == p e jogo[1][1] == p e jogo[2][0] == p)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal secundaria? alguem ganhou?
	funcao inteiro ganhouDiagSecundaria(){ 
		se(ganhouDSecundaria('o') == 1)
		{
			retorne 1
		}
		se(ganhouDSecundaria('x') == 1)
		{
			retorne 2
		}
		retorne 0
	}

	//funcao repetição
	funcao inteiro jogar(inteiro jogador, inteiro jogadas, inteiro ganhou){//Mateus status: ok
			faca{
				escrevendoMatriz()
				lerPosicao(jogador)
				
				//salvar jogadas e adicionar + 1 na qnt. de jogadas
				jogadas += saveJogada(jogador)
				jogador = atualizarJogador(jogador)

				//verificar vencedor por linhas
				ganhou += ganhouPorLinhas() // += para evitar resetar a variavel ganhou e perder a informações

				//verificar vencedor por colunas
				ganhou += ganhouPorColunas()
				
				//verificar vencedor na diagonal principal
				ganhou += ganhouDiPrincipal()
				
				//verificar vencedor na diagonal secundária
				ganhou += ganhouDiagSecundaria()
				
			}enquanto(ganhou == 0 e jogadas < 9)

        retorne ganhou

	}
	
	funcao inicio(){
		//variáveis da main
		inteiro jogador, jogadas, op, ganhou
		
		faca{
			jogador = 1
			ganhou = 0
			jogadas = 0

			criandoMatriz()

			ganhou = jogar(jogador, jogadas, ganhou)

			escrevendoMatriz()

				se(ganhou == 1)
				{
				  escreva("\n\tPARABÉNS JOGADOR 1")
					
				}
				se(ganhou == 2)
				{
				  escreva("\n\tPARABÉNS JOGADOR 2")
				}
			
		      escreva("\nDigite 1 para jogar novamente: ")
			leia(op)
		}enquanto (op == 1)

  }
}
