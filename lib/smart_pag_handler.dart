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
    bool? imprimirComprovanteAutomaticamente,
    FormaDeCobrancaDeJuros? formaDeCobranca,
  }) async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().fazerPagamento(
        formaDePagamento,
        parcelas,
        valor,
        context,
        deepLinkReturnSchema: deepLinkReturnSchema,
        imprimirComprovanteAutomaticamente: imprimirComprovanteAutomaticamente,
        formaDeCobranca: formaDeCobranca,
      );
    }

    return FakePagamento().fazerPagamento(
      formaDePagamento,
      parcelas,
      valor,
      context,
      deepLinkReturnSchema: deepLinkReturnSchema,
      imprimirComprovanteAutomaticamente: imprimirComprovanteAutomaticamente,
      formaDeCobranca: formaDeCobranca,
    );
  }

  static Future<void> imprimirArquivo(String filePath, BuildContext context) {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().imprimirArquivo(
        filePath: filePath,
        context: context,
      );
    }

    return FakePagamento().imprimirArquivo(
      filePath: filePath,
      context: context,
    );
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
