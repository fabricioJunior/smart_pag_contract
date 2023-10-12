import 'package:flutter/material.dart';
import 'package:smart_pag_contract/interfaces/pagamento.dart';

import 'injections/injections.dart';

abstract class SmartPagHandler {
  static Future<Map<String, String>> fazerPagamento(
    BuildContext context,
    FormaDePagamento formaDePagamento,
    int parcelas,
    int valor,
  ) async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().fazerPagamento(
        formaDePagamento,
        parcelas,
        valor,
        context,
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
