import 'dart:io';

// controle do terminal

/// Limpa o console
void clear() {
  if (Platform.isWindows) {
    // No Windows, precisamos do 3J para limpar o buffer de scroll
    stdout.write('\x1B[2J\x1B[3J\x1B[H');
  } else {
    // No Linux/Mac, o 2J costuma ser suficiente
    stdout.write('\x1B[2J\x1B[H');
  }
}

void pause() {
  stdout.write("Digite ENTER para continuar: ");
  try {
    // Tenta configurar o terminal para ler teclas individualmente
    stdin.lineMode = false;
    stdin.echoMode = false;
    while (true) {
      int byte = stdin.readByteSync();
      // 10 = LF (Newline), 13 = CR (Carriage Return)
      if (byte == 10 || byte == 13) {
        print('Enter pressionado!');
        break;
      }
    }
  } catch (e) {
    // Se não conseguir manipular o modo do terminal, usa método simples
    stdin.readLineSync();
    print('');
  }
  // Restaura o modo do terminal (boa prática)
  stdin.lineMode = true;
  stdin.echoMode = true;
  clear();
}