import 'package:smart_pag_contract/interfaces/pagamento.dart';

import 'injections/injections.dart';

abstract class SmartPagHandler {
  static Future<Map<String, String>> fazerPagamento(
    String formaDePagamento,
    int parcelas,
    int valor,
  ) async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().fazerPagamento(
        formaDePagamento,
        parcelas,
        valor,
      );
    }

    return {};
  }

  static Future<void> realizarEstorno() async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().realizarEstorno();
    }

    return;
  }
}
