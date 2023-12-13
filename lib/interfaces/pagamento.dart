import 'package:flutter/material.dart';

bool pagamentoContractInject = false;

abstract class PagamentoContract {
  Future<Map<String, String>> fazerPagamento(
    FormaDePagamento formaDePagamento,
    int parcelas,
    int valor,
    BuildContext context,
  );

  Future<void> realizarEstorno({
    String? transactionCode,
    String? transactionId,
  });

  Future<void> imprimirArquivo({
    required String filePath,
  });
}

enum FormaDePagamento {
  credito(2),
  debito(1),
  vale(3),
  pix(4);

  final int codigo;
  const FormaDePagamento(this.codigo);
}

extension DataIntToFormaDePagamento on int {
  FormaDePagamento toFormaDePagamento() {
    return FormaDePagamento.values.firstWhere(
      (formaDePagamento) => formaDePagamento.codigo == this,
    );
  }
}
