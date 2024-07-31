import 'package:flutter/material.dart';

bool pagamentoContractInject = false;

abstract class PagamentoContract {
  Future<PagamentoResult> fazerPagamento(FormaDePagamento formaDePagamento,
      int parcelas, int valor, BuildContext context,
      {String? deepLinkReturnSchema,
      bool? imprimirComprovanteAutomaticamente,
      FormaDeCobrancaDeJuros? formaDeCobranca});

  Future<void> realizarEstorno({
    required BuildContext context,
    int? valor,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
  });

  Future<void> imprimirArquivo({
    required String filePath,
    required BuildContext context,
  });

  Future<String> serialDaMaquina();

  String get tipoDaMaquina;
}

enum FormaDePagamento {
  credito(2),
  debito(1),
  vale(3),
  pix(4);

  final int codigo;
  const FormaDePagamento(this.codigo);
}

enum FormaDeCobrancaDeJuros {
  jurosCobradoDoCliente,
  jurosCobradoDoVendedor,
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
  final String date;
  final String time;
  final String hostNSU;
  final String transactionID;
  final String transactionCode;

  final String? erro;

  PagamentoResult({
    required this.cardBrand,
    required this.cardBin,
    required this.nsu,
    required this.date,
    required this.time,
    required this.hostNSU,
    required this.transactionID,
    required this.transactionCode,
  }) : erro = null;
  PagamentoResult.erro({required this.erro})
      : cardBin = 'erro',
        cardBrand = 'erro',
        nsu = 'erro ',
        date = '',
        time = '',
        hostNSU = 'erro',
        transactionCode = 'erro',
        transactionID = 'erro';
}
