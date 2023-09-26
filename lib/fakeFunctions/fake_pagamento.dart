import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_pag_contract/interfaces/pagamento.dart';

class FakePagamento extends PagamentoContract {
  @override
  Future<Map<String, String>> fazerPagamento(
    String formaDePagamento,
    int parcelas,
    int valor,
    BuildContext context,
  ) async {
    log('forma de pagamento: $formaDePagamento \n parcelas: $parcelas \n valor: $valor');
    return {'codigoDaTransacao': 'codigoFake'};
  }

  @override
  Future<void> realizarEstorno({
    String? transactionCode,
    String? transactionId,
  }) async {}
}
