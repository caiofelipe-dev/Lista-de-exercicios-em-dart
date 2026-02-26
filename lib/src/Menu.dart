import 'dart:io';
import 'SubMenu.dart';
import 'package:aprendendo_dart/helpers/terminal-control.dart';

enum Alignment {center, start}

class Menu {
	String _menu = "";
	late bool is_submenu = false;

	String _tittle;
	List<dynamic> _options;
	
	int _length = 70;
	/// O desenho da linha do menu
	late String _line = "+"+lineFactory("-", _length-2)+"+\n";

	Menu(this._tittle, this._options) {
		drawMenu();
	}
	
	/// Desenha o menu
	void drawMenu() {
		_addHeader();
		_addBody();
		_menu += _line+"\n";
	}

	void _addText(String text, Alignment align) {
		int leng = text.length - 1;
		if(!(leng > _length - 3)) {
			_menu += "|"+textFactory(text, _length, align).substring(1,_length-1)+"|\n";
		} else {
			// Se extrapolar
				int difference = leng - _length + 3;
				_addText(text.substring(0, leng - difference), align); // antes da quebra
				_addText(text.substring(leng - difference), align); // depois da quebra
		}
	}
	/// Desenha o cabecalho
	void _addHeader() {
		_menu += _line;
		_addText(_tittle, Alignment.center);
		_menu += _line;
	}

	/// Desenha as opções
	void _addBody() {
		for (var i = 0; i < _options.length; i++) {
      String option = "Erro: Opção inválida.";
      if(_options[i] is String) {
			  option = _options[i];
      }
      if(_options[i] is SubMenu) {
        option = _options[i].getTittle();
      }
      _addText("${i+1} - ${option}", Alignment.start);
		}
		_addText("0 - Sair/Voltar", Alignment.start);
	}

	/// Retorna uma sequência de caracteres repetidos com base no comprimento passado como argumento
	static String lineFactory(String char,int length) {
		String text = "";
		for(int i = 0; i<length; i++)
			text += char;
		text = text.substring(0,length); // Garante que o texto não extrapole o comprimento passado
		return text;
	}

	/// Retorna um texto alinhado determinado comprimento de caracteres
	static String textFactory(String txt, int length, Alignment align, {String char = " ", int margin = 2}) {
		String result = "";

		length = length - txt.length;
		
		if(align == Alignment.center) {  // Alinha no Centro
			String white_space = lineFactory(char, (length/2).toInt());
			return result += white_space+txt+white_space;
		}
		if(align == Alignment.start) { // Alinha no começo
			String white_space = lineFactory(char, (length).toInt());
			String margin_wp = lineFactory(" ", margin);
			return result += margin_wp+txt+white_space;
		}
		return result;
	}

	@override
  String toString() {
    return _menu;
  }

  String getTittle() {
    return this._tittle;
  }

  /// Imprime o menu na tela e processa as opções
	void run({bool error = false}) {
    clear();
    String mensagem = (error == false) ? "Digite um número para escolher a opção: ": "Valor inválido, tente novamente: ";
		stdout.write("$this$mensagem");
		int input = int.parse(stdin.readLineSync()!);

    if( input >= 0 && input <= _options.length) { // verifica se o código é válido
      return runOption(input);
    }

    run(error: true);
	}
  void runOption(int option) {

  }
}