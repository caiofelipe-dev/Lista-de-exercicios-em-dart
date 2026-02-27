import 'dart:io';
import 'SubMenu.dart';
import 'package:aprendendo_dart/helpers/terminal-control.dart';
import 'package:aprendendo_dart/src/algoritmos.dart' show algoritmosMapa;
import 'package:meta/meta.dart';

enum Alignment {center, start}

class Menu {
  @protected
	String _menu = "";
  @protected
	late bool is_submenu = false;
  @protected
	String tittle;
  @protected
	dynamic options;
	@protected
	int _length = 70;
	/// O desenho da linha do menu
	late final String line = "+${lineFactory("-", _length-2)}+\n";

	Menu(this.tittle, {List<dynamic>? options}) {
		this.options = options ?? "Erro: Sem opções.";
		drawMenu();
	}
  Menu.submenu(this.tittle);
	
	/// Desenha o menu
	void drawMenu() {
		_addHeader();
		_addBody();
		_menu += "$line\n";
	}

	void _addText(String text, Alignment align) {
		int leng = text.length - 1;
		if(!(leng > _length - 3)) {
			_menu += "|${textFactory(text, _length, align).substring(1,_length-1)}|\n";
		} else {
			// Se extrapolar
				int difference = leng - _length + 3;
				_addText(text.substring(0, leng - difference), align); // antes da quebra
				_addText(text.substring(leng - difference), align); // depois da quebra
		}
	}
	/// Desenha o cabecalho
	void _addHeader() {
		_menu += line;
		_addText(tittle, Alignment.center);
		_menu += line;
	}

	/// Desenha as opções
	void _addBody() {
		if (options is List) {
			for (var i = 0; i < options.length; i++) {
				dynamic option = options[i];
        String tittle;
				if (option is SubMenu) {
					if (checkStrErro(option.tittle)) continue;
          tittle = option.tittle;
				} else if (option is Menu) {
					if (checkStrErro(option.tittle)) continue;
          tittle = option.tittle;
				} else if (option is String) {
					if (checkStrErro(option)) continue;
					tittle = option;
				}
        else {tittle = "Erro: Opção inválida (Deveria ser Menu/SubMenu object ou String).";}
        _addText("${i+1} - $tittle", Alignment.start);
			}
		} else if (options is Map) {
			for (var i = 0; i < options.length; i++) {
				var key = options.keys.elementAt(i).toString();
				_addText("${i+1} - $key", Alignment.start);
			}
		} else if(options is String) {
      _addText("$options", Alignment.start);
    }
		_addText("0 - Sair/Voltar", Alignment.start);
	}

  bool checkStrErro(String option) {
    if (option.startsWith("Erro")) {
      _addText(option, Alignment.start);
      return true;
    }
    return false;
  }

	/// Retorna uma sequência de caracteres repetidos com base no comprimento passado como argumento
	static String lineFactory(String char,int length) {
		String text = "";
		for(int i = 0; i<length; i++) {
		  text += char;
		}
		text = text.substring(0,length); // Garante que o texto não extrapole o comprimento passado
		return text;
	}

	/// Retorna um texto alinhado determinado comprimento de caracteres
	static String textFactory(String txt, int length, Alignment align, {String char = " ", int margin = 2}) {
		String result = "";

		length = length - txt.length;
		
		if(align == Alignment.center) {  // Alinha no Centro
			String whiteSpace = lineFactory(char, (length/2).toInt());
			return result += whiteSpace+txt+whiteSpace;
		}
		if(align == Alignment.start) { // Alinha no começo
			String whiteSpace = lineFactory(char, (length).toInt());
			String marginWp = lineFactory(" ", margin);
			return result += marginWp+txt+whiteSpace;
		}
		return result;
	}
	
  // Métodos mágicos
  @override
  String toString() {
    return _menu;
  }
  // ignore: unnecessary_getters_setters
  dynamic getOption(int index) => options[index];

  /// Imprime o menu na tela e processa as opções
	run({bool invalid = false, bool error = false}) {
    clear();
    String mensagem = (error == false) ? "Digite um número para escolher a opção: ": "Valor inválido, tente novamente: ";
		stdout.write("$this$mensagem");
		int input = int.parse(stdin.readLineSync()!);
		// int input = 1;
    // print(input);
    // pause();

    if(input == 0) {
      return;
    }

    if( input > 0 && input <= options.length) { // verifica se o código é válido
      runOption(input);
      clear();
      return run();
    }
    run(invalid: true);
    return this;
	}
  /// Imprime ou executa a opção escolhida
  dynamic runOption(int choice) {
    if(options is List) {
      // Menu com lista de opções (pode conter SubMenu objects)
      final option = getOption(choice - 1);
      if (option is Menu) {
        return option.run();
      }
    } else if (options is Map) {
      // SubMenu com mapa de algoritmos
      final algorithmKey = options.keys.elementAt(choice-1);
      final algorithmFunc = options[algorithmKey];
      clear();
      print(algorithmKey);
      algorithmFunc(); // executa a função
      print("\n");
      pause();
    }
  }

  Menu isSubMenu() {
    is_submenu = true;
    return this;
  }
}
