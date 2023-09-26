import 'package:flutter/material.dart';

bool pagamentoContractInject = false;

abstract class PagamentoContract {
  Future<Map<String, String>> fazerPagamento(
    String formaDePagamento,
    int parcelas,
    int valor,
    BuildContext context,
  );

  Future<void> realizarEstorno({
    String? transactionCode,
    String? transactionId,
  });
}
