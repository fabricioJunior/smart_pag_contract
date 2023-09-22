import 'package:smart_pag_contract/interfaces/pagamento.dart';

class FakePagamento extends PagamentoContract {
  @override
  Future<Map<String, String>> fazerPagamento(
    String formaDePagamento,
    int parcelas,
    int valor,
  ) async {
    return {};
  }

  @override
  Future<void> realizarEstorno() async {}
}
