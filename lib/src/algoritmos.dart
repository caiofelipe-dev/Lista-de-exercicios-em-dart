import 'dart:io';
//Algoritmos em si:

// Operadores Aritméticos


///Cálculo de Média Ponderada:
///Calcular a média ponderada de quatro notas (N1, N2, N3, N4) com pesos 
///respectivos (P1, P2, P3, P4). O algoritmo deve solicitar as notas e os pesos.
void alg1() {
  List<List> notas = [];
  double soma_valores = 0;
  int soma_pesos = 0;
  double media_ponderada = 0;
  
  // Leitura das notas e seus respectivos pesos:
  for(int i =0; i<4; i++) {
    stdout.write("\nDigite a nota ${i+1}: ");
    double nota = double.parse(stdin.readLineSync()!);

    stdout.write("Digite o peso para a nota ${i+1}: ");
    int peso = int.parse(stdin.readLineSync()!);

    // Já realiza a operações aritméticas diretamente nesse loop
    double valor = peso*nota;
    soma_valores += valor;
    soma_pesos += peso;

    notas.add([nota, peso]);
  }

  media_ponderada = soma_valores/soma_pesos;
  
  // resultado no terminal:
  stdout.write("\nA média das seguintes notas: ");
  for(int i = 0; i<4; i++) {
    if(i == 3) stdout.write("e ");
    stdout.write("${notas[i][0].toStringAsFixed(1)} (de peso ${notas[i][1]}); ");
  }
  print("\nÉ igual a ${media_ponderada.toStringAsFixed(1)}.\n");
}


// ESTRUTURAS CONDICIONAIS

/// Algoritmo 2: Verificação de Par ou Ímpar:
/// Desenvolver um algoritmo que receba um número inteiro e use if/else para determinar se ele é par ou ímpar.
void alg2() {
  stdout.write("Digite um número para verificar se é par ou ímpar: ");
  int num = int.parse(stdin.readLineSync()!);
  
  if(num % 2 == 0) print("O número é par :D\n");
  else print("O número é ímpar :D\n");
}

/// Algoritmo 3: Classificação de Idade
/// Crie um programa que solicite a idade de uma pessoa e use a estrutura if/else if/else para classificá-la nas seguintes categorias: 
/// Criança (0-12);
/// Adolescente (13-17);
/// Adulto (18-59);
/// Idoso (60+).
void alg3() {
  stdout.write("Digite sua idade: ");
  int idade = int.parse(stdin.readLineSync()!);
  
  if(idade >= 0 && idade <= 12) {
    print("Criança");
  } else if(idade >= 13 && idade <= 17) {
    print("Adolescente");
  } else if(idade >= 18 && idade <= 59) {
    print("Adulto");
  } else if(idade >= 60) {
    print("Idoso");
  }
  stdout.write("\n");
}

/// Algoritmo 4: Calculadora Simples (Switch)
/// Implemente uma calculadora que aceite dois números e uma operação (+, -, *, /) como entrada. Utilize a estrutura switch para executar a operação correspondente.
void alg4() {
  print("Digite um número: ");
  double num1 = double.parse(stdin.readLineSync()!);
  print("Digite outro número: ");
  double num2 = double.parse(stdin.readLineSync()!);

  print("1 - Soma ($num1 + $num2)");
  print("2 - Subtração ($num1 - $num2)");
  print("3 - Multiplicação ($num1 \u00D7 $num2)");
  print("4 - Divisão ($num1 \u00F7 $num2)");
  stdout.write("\nEscolha um operação que deseja fazer digitando seu respectivo código: ");
  int cod = int.parse(stdin.readLineSync()!);

  switch(cod) {
    case 1:
      print("Escolhido: Soma\n   Resultado: $num1 + $num2 = ${num1+num2}");
      break;
    case 2:
      print("Escolhido: Subtração\n   Resultado: $num1 - $num2 = ${num1-num2}");
      break;
    case 3:
      print("Escolhido: Multiplicação\n   Resultado: $num1 \u00D7 $num2 = ${num1*num2}");
      break;
    case 4:
      print("Escolhido: Soma\n   Resultado: $num1 \u00F7 $num2 = ${num1/num2}");
      break;
    default:
      stdout.write("Código inválido, digite apenas UM número existente no menu: ");
      cod = int.parse(stdin.readLineSync()!);
  }
  stdout.write("\n");
}

///Algoritmo 5: Acesso ao Sistema
///Desenvolva um algoritmo que peça uma senha. Use if/else para verificar se a senha é "Dart2026". Se for correta, exiba "Acesso Liberado"; caso contrário, exiba "Acesso Negado".
void alg5() {
  stdout.write("Digite a senha para acessar o sistema: ");
  String senha = stdin.readLineSync()!;
  if(senha == "Dart2026") print("Acesso Liberado!\n");
  else print("Acesso Negado!\n");
}

///Algoritmo 6: Semáforo (Switch)
///Simule um semáforo. Peça ao usuário que insira uma cor (Vermelho, Amarelo, Verde) e use a estrutura switch para exibir a ação correspondente (Parar, Atenção, Seguir).
void alg6() {
  print("1 - VERMELHO");
  print("2 - AMARELO");
  print("3 - VERDE");
  stdout.write("Digite o código da luz do semáforo: ");
  int cod = int.parse(stdin.readLineSync()!);
  String cor = "";
  while(cor == "") {
    switch(cod) {
      case 1: cor = "Vermelho"; break;
      case 2: cor = "Amarelo"; break;
      case 3: cor = "Verde"; break;
      default:
        stdout.write("Digite novamente somente UM número existente no menu: ");
        cod = int.parse(stdin.readLineSync()!);
    }
  }
  switch(cor) {
    case "Vermelho": print("Parar\n"); break;
    case "Amarelo": print("Atenção\n");  break;
    case "Verde": print("Seguir\n");  break;
  }
}

///Algoritmo 7: Desconto de Produto
///Crie um algoritmo que receba o valor de um produto e a forma de pagamento (1 para à vista, 2 para parcelado). 
///Se a forma de pagamento for à vista (1), aplique um desconto de 10% no valor usando uma estrutura if.
void alg7() {
  stdout.write("Digite o valor do produto: ");
  double valor = double.parse(stdin.readLineSync()!);

  print(
    "Escolha opção de pagamento\n"
    "1 - À vista\n"
    "2 - Parcela"
  );
  stdout.write("Digite o código: ");
  int cod = int.parse(stdin.readLineSync()!);
  while(cod != 1 && cod != 2) {
    stdout.write("Digite novamente somente UM número existente no menu: ");
    cod = int.parse(stdin.readLineSync()!);
  }
  switch(cod) {
    case 1: print("À vista, o valor ficou ${((valor*10)/100).toStringAsFixed(2)} reais, com 10% de desconto.\n"); break;
    case 2: print("Escolheu parcelado. Ficou ${valor.toStringAsFixed(2)} reais.\n");
  }
}

// LAÇOS DE REPETIÇÃO

/// Algoritmo 8: Tabuada
/// Gere a tabuada de multiplicação de um número fornecido pelo usuário, de 1 a 10, utilizando o laço for.
alg8() {
  stdout.write("Digite um número para gerar a tabuada: ");
  int num = int.parse(stdin.readLineSync()!);
  print("\nTabuada de $num:");
  for(int i = 1; i <= 10; i++) {
    print("$num x $i = ${num*i}");
  }
  stdout.write("\n\n");
}

///Algoritmo 9: Contagem Regressiva
///Implemente um contador regressivo que comece em um número N fornecido pelo usuário e vá até 0. Utilize o laço while.
alg9() {
  stdout.write("Digite um número: ");
  int num = int.parse(stdin.readLineSync()!);
  
  stdout.write("\nContagem regressiva: $num");
  while(num > 0)
    stdout.write(", ${--num}");
  while(num < 0)
    stdout.write(", ${++num}");
  
  stdout.write("\n\n");
}

///Algoritmo 10: Soma de Números Pares em Intervalo de 1 a 50
///Calcule a soma de todos os números pares dentro de um intervalo de 1 a 50, usando o laço for.
alg10() {
  stdout.write("A soma dos números pares existentes no intervalo de 1 a 50 é:");
  int soma = 0;
  List<int> elementos_soma = [];

  for(int i = 1; i<=50; i=i+2) {
    soma += i+1;
    elementos_soma.add(i+1);
  }
  stdout.write(" $soma (${elementos_soma.join(" + ")})\n\n");
}

///Algoritmo 11: Média de Notas com Condição de Parada
///Desenvolva um algoritmo que leia notas de alunos até que o usuário digite um valor negativo. Ao final, calcule e exiba a média das notas válidas. Utilize o laço while.
alg11() {
  double soma = 0;
  int quantidade = 0;
  double nota = 0;
  while(nota >= 0) {
    stdout.write("Digite sua nota e digite um número negativo para finalizar: ");
    nota = double.parse(stdin.readLineSync()!);
    if(nota < 0) continue;
    soma += nota;
    quantidade++;
  }
  if(quantidade < 1)
    return print("Finalizado! Nenhuma nota foi inserida.");
  
  print("Finalizado! A média de suas notas é ${(soma/quantidade).toStringAsFixed(1)}\n");
}

///Algoritmo 12: Números Primos em Intervalo
///Crie um algoritmo que encontre e imprima todos os números primos entre 2 e 100. 
///Utilize o laço for aninhado para a verificação.
alg12() {
  List<int> primos = [];
  numero: for(int num = 3; num<100; num++) {
    for(int i = 2; i<num; i++)
      if(num%i == 0) continue numero;
    primos.add(num);
  }
  print("Números primos entre 2 e 100: ${primos.join(", ")}.\n");
}

//ESTRUTURA DE DADOS

///Algoritmo 13: Iteração de Lista de Frutas
///Crie uma List de strings contendo pelo menos 5 frutas. Use o método forEach ou um laço for para imprimir cada fruta da lista.
alg13() {
  List<String> frutas = ["manga", "açaí", "pequi", "jabuticaba", "caju", "umbu"];
  frutas.forEach((fruta) {
      fruta = fruta[0].toUpperCase()+fruta.substring(1);
      print("${fruta},");
    });
  stdout.write("\n");
}

///Algoritmo 14: Filtragem de Números Maiores que 10
///Crie uma List de inteiros. Use o método where (ou um laço for com if) para criar uma nova lista contendo apenas os números maiores que 10.
alg14() {
  List<int> numeros = [3, 34, 5, 76, 369, 1, 9, 21, 11, 2, 10, 99, 1024];
  List<int> maiores_dez = numeros.where((num) => num>10).toList();
  print("Numeros maiores que dez da lista \"${numeros.join(", ")}\" são: ${maiores_dez.join(", ")}");
}
///Algoritmo 15: Contagem de Ocorrências
///Dada uma List de strings (palavras), use um Map para contar quantas vezes cada palavra aparece na lista.
alg15() {
  /// Cria uma lista nova onde as palavras se repentem conforme a quantidade descrita no map
  mapToList() {
    Map<String, int> palavras_repeticoes = {
      "cadeira": 2,
      "berimbau": 1,
      "carranca": 4,
      "bastão": 1,
      "palavras": 2
    };
    List<String> palavras = [];
    stdout.write("\t* O MAP deve compor uma lista, onde as palavras: ");
    palavras_repeticoes.forEach(
      (palavra, repeticao) {
        stdout.write("\"$palavra\" se repete $repeticao vezes, ");
        palavras.addAll(List.filled(repeticao, palavra)); // adiciona as palavras n vezes
      } 
    );
    stdout.write("resultando na lista:\n\t[\"${palavras.join("\", \"")}\"].\n\n");
  }
  /// Cria um Map armazenando a quantidade de vezes que o elemento se repete na lista
  listToMap() {
    List<String> palavras = ["cadeira", "carranca", "bastão", "palavras", "carranca", "cadeira", "berimbau", "carranca", "palavras", "carranca"];
    var map = Map<String, int>();
    for(var palavra in palavras) {
      if(map.containsKey(palavra)) {
        map[palavra] = map[palavra]!+1;
        continue;
      }
      map[palavra] = 1;
    }

    stdout.write("\t* A LISTA :[\"${palavras.join("\", \"")}\"], compõe o MAP:\n");
    stdout.write("\t\tMap<String, int> {\n");
    for(var entidade in map.entries) // Imprime o Map gerado
      stdout.write("\t\t\t\"${entidade.key}\": ${entidade.value}\n");
    stdout.write("\t\t}\n");
    
  }

  mapToList(); listToMap();
}