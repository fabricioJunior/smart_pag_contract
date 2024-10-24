import 'package:flutter/material.dart';
import 'package:smart_pag_contract/interfaces/pagamento.dart';

import 'fakeFunctions/fake_pagamento.dart';
import 'injections/injections.dart';
import 'interfaces/log.dart';

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
    required BuildContext context,
    int? valor,
    String? codigoDaTransacao,
    String? identificadorDaTransacao,
  }) async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().realizarEstorno(
          context: context,
          transactionCode: codigoDaTransacao,
          transactionId: identificadorDaTransacao,
          permiteEditarValor: false,
          valor: valor);
    }

    return FakePagamento().realizarEstorno(context: context);
  }

  static Future<String> serialDaMaquina() async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().serialDaMaquina();
    }
    return '12391023u1';
  }

  static Future<String> tipoMaquina() async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().tipoDaMaquina;
    }
    return 'teste';
  }

  static Future<List<Log>> recuperarLogsUltimaTransacao() async {
    if (pagamentoContractInject) {
      return sl<PagamentoContract>().recuperarLogsUltimaTransacao();
    }
    return [];
  }

  static Future<void> salvarLog(Log log) async {
    if (pagamentoContractInject) {
      await sl<PagamentoContract>().salvarLog(log);
    }
  }
}
