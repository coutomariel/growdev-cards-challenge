import 'dart:io';
import '../src/controller/card-controller.dart';

void main() async {
  int opcao;
  var controller = CardController();

  void exibeMenu() {
    print('============================================');
    print('===== Bem-vindo ao sistema de Cards o/ =====');
    print('============================================');
    print('');
    print('========= Escolha uma das opções: ==========');
    print('1 - Buscar todos os cards');
    print('2 - Buscar card pelo ID');
    print('3 - Criar card');
    print('4 - Atualizar card');
    print('5 - Deletar card');
    print('6 - Sair');
    print('============================================');
  }

  void escolheOpcao() {
    print('Opcão escolhida: ');
    opcao = int.tryParse(stdin.readLineSync());
  }

  void tratandoOpcao(int opcao) async {
    switch (opcao) {
      case 1:
        {
          await controller.imprimir();
        }
        break;
      case 2:
        {
          print('Informe o ID do card a ser encontrado: ');
          var cardId = int.tryParse(stdin.readLineSync());
          await controller.buscarPorId(cardId);
        }
        break;
      case 3:
        {
          print('Informe o titulo do novo card: ');
          var title = stdin.readLineSync();
          print('Informe o conteudo do novo card: ');
          var content = stdin.readLineSync();
          await controller.salvar(title, content);
        }
        break;
      case 4:
        {
          print('Informe o ID do card a ser atualizado: ');
          var cardId = int.tryParse(stdin.readLineSync());
          print('Informe o novo titulo do card: ');
          var title = stdin.readLineSync();
          print('Informe o novo conteudo do card: ');
          var content = stdin.readLineSync();
          await controller.atualizar(cardId, title, content);
        }
        break;
      case 5:
        {
          print('Informe o ID do card a ser excluído: ');
          var id = int.tryParse(stdin.readLineSync());
          await controller.deletar(id);
        }
        break;
      case 6:
        {
          print('============================================');
          print('==========  Saindo do Sistema... ===========');
          print('==========    Valeu, falows o/   ===========');
          print('============================================');
        }
        break;
      default:
        print('Opção Inválida. Tente novamente um valor entre 1 e 6!');
    }
  }

  do {
    exibeMenu();
    escolheOpcao();
    await tratandoOpcao(opcao);
  } while (opcao != 6);
}
