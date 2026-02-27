import 'dart:io';

import 'package:aprendendo_dart/helpers/terminal-control.dart' as terminal;

import 'package:aprendendo_dart/src/algoritmos.dart'; // onde está os algorítimos
import 'package:aprendendo_dart/src/Menu.dart';
import 'package:aprendendo_dart/src/Submenu.dart';

/// Imprime o Menu de opções no terminal/console
void printMenu() {
  Menu main = Menu("Menu de Opções", options: [
		SubMenu("Operadores Aritméticos", [1]),
		SubMenu("Estruturas Condicionais", [2, 3, 4, 5, 6, 7]),
		SubMenu("Laços de Repetição", [8, 9, 10, 11, 12]),
		SubMenu("Estruturas de Dados", [13, 14, 15])
	]);
	main.run();
}


void main() {
  printMenu();

  // // print("========================================================\nOPERADORES ARITMÉTICOS\n");
  // print("Algoritmo 1: Cálculo de Média Ponderada");
  // alg1(); stdout.write("\n");
  // terminal.pause();

  // // print("========================================================\nESTRUTURAS CONDICIONAIS\n");
  // print("Algoritmo 2: Verificação de Par ou Ímpar");
  // alg2(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 3: Classificação de Idade");
  // alg3(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 4: Calculadora Simples (Switch)");
  // alg4(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 5: Acesso ao Sistema");
  // alg5(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 6: Semáforo (Switch)");
  // alg6(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 7: Desconto de Produto");
  // alg7(); stdout.write("\n");
  // terminal.pause();

  // // print("========================================================\nLAÇOS DE REPETIÇÃO\n");
  // print("Algoritmo 8: Tabuada");
  // alg8(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 9: Contagem Regressiva");
  // alg9(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 10: Soma de Números Pares em Intervalo de 1 a 50");
  // alg10(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 11: Média de Notas com Condição de Parada");
  // alg11(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 12: Números Primos em Intervalo");
  // alg12(); stdout.write("\n");
  // terminal.pause();

  // // print("========================================================\nESTRUTURA DE DADOS\n");
  // print("Algoritmo 13: Iteração de Lista de Frutas");
  // alg13(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 14: Filtragem de Números Maiores que 10");
  // alg14(); stdout.write("\n");
  // terminal.pause();
  // print("Algoritmo 15: Contagem de Ocorrências");
  // alg15(); stdout.write("\n");
  // terminal.pause();

	print("Saindo...");
}