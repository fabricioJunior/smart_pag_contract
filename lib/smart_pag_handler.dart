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

  //'codigoDaTransacao'
  // 'identificadorDaTransacao'
  static Future<void> realizarEstorno({
    String? codigoDaTransacao,
    String? identificadorDaTransacao,
  }) async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().realizarEstorno(
        transactionCode: codigoDaTransacao,
        transactionId: identificadorDaTransacao,
      );
    }

    return;
  }
}
