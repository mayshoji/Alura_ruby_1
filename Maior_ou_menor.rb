def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n\n\n\n\n"
	puts "Começaremos o jogo para você, #{nome}" 
end

def pede_dificuldade
	puts " Qual o nível de dificuldade que deseja (1 fácil , 5 difícil)"
	dificudade = gets.to_i

def sorteia_numero_secreto (dificudade)

	case dificudade
	when 1
		máximo = 30
	when 2
		máximo = 60
	when 3
		máximo = 100
	when 4
		máximo = 150
	else
		máximo = 200
	end
	puts "Escolhendo um número secreto entre 0 e #{máximo - 1}..."
	sorteado = rand(200)
	puts "Escolhido! Que tal adivinhar hoje nosso número secreto?"
	sorteado
end

def pede_um_numero (chutes, tentativa, limite_de_tentativas)
	puts "\n\n\n\n\n"
	puts  "tentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Chutes até agora: #{chutes}"
	puts "Entre com o número"
	chute = gets.strip
	puts "será que você acertou? Você chutou #{chute}" 
	chute.to_i
end

def verifica_se_acertou (numero_secreto, chute)
	acertou = numero_secreto == chute.to_i

	if acertou
		puts "Acertou!"
		return true
	end 

	
	maior = numero_secreto > chute.to_i  
	if maior 
		puts "O número secreto é maior!"
	else 
		puts "O número secreto é menor!"
	end
	false
end


da_boas_vindas
dificudade = pede_dificuldade
numero_secreto = sorteia_numero_secreto dificuldade

pontos_ate_agora = 1000
limite_de_tentativas  = 5
chutes = []

for tentativa in 1..limite_de_tentativas 

	chute = pede_um_numero chutes,tentativa,limite_de_tentativas
	chutes << chute

	pontos_a_perder = (chute - numero_secreto).abs / 2.0
	pontos_ate_agora -= pontos_a_perder

	if  verifica_se_acertou numero_secreto, chute
		break
	tentativa = tentativa + 1
	end	
end

puts "Você ganhou #{pontos_ate_agora} pontos."


