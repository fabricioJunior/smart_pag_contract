import 'package:flutter/material.dart';
import 'package:smart_pag_contract/interfaces/pagamento.dart';

import 'fakeFunctions/fake_pagamento.dart';
import 'injections/injections.dart';

abstract class SmartPagHandler {
  static Future<PagamentoResult> fazerPagamento(
    BuildContext context,
    FormaDePagamento formaDePagamento,
    int parcelas,
    int valor, {
    String? deepLinkReturnSchema,
  }) async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().fazerPagamento(
        formaDePagamento,
        parcelas,
        valor,
        context,
        deepLinkReturnSchema: deepLinkReturnSchema,
      );
    }

    return FakePagamento()
        .fazerPagamento(formaDePagamento, parcelas, valor, context);
  }

  static Future<void> imprimirArquivo(String filePath) {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().imprimirArquivo(filePath: filePath);
    }

    return FakePagamento().imprimirArquivo(filePath: filePath);
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

    return FakePagamento().realizarEstorno();
  }

  static Future<String> serialDaMaquina() async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().serialDaMaquina();
    }
    return '12391023u1';
  }
}
