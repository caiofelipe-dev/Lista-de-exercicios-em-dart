import 'Menu.dart';
import 'package:aprendendo_dart/src/algoritmos.dart' show algoritmosMapa;

// /// classe selada que criei para as opções
// sealed  class Opt {
//   // Pode ser uma única string:
//   factory Opt.str(String v) = OptString;
//   // Pode ser uma array:
//   factory Opt.arr(List v) = OptList;
//   // Pode ser um Map com string e string/int:
//   factory Opt.map(Map<String, Object> v) = OptMap;
// }
// // Pode ser uma única string:
// class OptString implements Opt {
//   final String value;
//   OptString(this.value);
// }
// // Pode ser um array
// class OptList implements Opt {
//   final List value;
//   OptList(this.value);
// }
// // Pode ser um Map com string e string/int
// class OptMap implements Opt {
//   Map<String, Object> value;
//   OptMap(this.value);
// }


class SubMenu extends Menu{
  SubMenu(super.tittle, [List<int>? options]) : super.submenu(){
    if(options != null) {
      super.options = {};
      for (var opt in options) {
        super.options[algoritmosMapa.keys.elementAt(opt-1)] = algoritmosMapa.values.elementAt(opt-1);
      }
    } else {
      super.options = "Erro: Sem opções.";
    }
    super.is_submenu = true;
    drawMenu();
  }
}