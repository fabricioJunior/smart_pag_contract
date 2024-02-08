import 'package:flutter/material.dart';

bool pagamentoContractInject = false;

abstract class PagamentoContract {
  Future<PagamentoResult> fazerPagamento(
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

class PagamentoResult {
  final String cardBrand;
  final String cardBin;
  final String nsu;
  final DateTime date;
  final DateTime time;
  final String hostNSU;
  final String transactionID;
  final String transactionCode;

  PagamentoResult({
    required this.cardBrand,
    required this.cardBin,
    required this.nsu,
    required this.date,
    required this.time,
    required this.hostNSU,
    required this.transactionID,
    required this.transactionCode,
  });
}
