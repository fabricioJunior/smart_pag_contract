import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_pag_contract/interfaces/log.dart';
import 'package:smart_pag_contract/interfaces/pagamento.dart';

class FakePagamento extends PagamentoContract {
  @override
  Future<PagamentoResult> fazerPagamento(FormaDePagamento formaDePagamento,
      int parcelas, int valor, BuildContext context,
      {String? deepLinkReturnSchema,
      bool? imprimirComprovanteAutomaticamente,
      FormaDeCobrancaDeJuros? formaDeCobranca}) async {
    log('forma de pagamento: $formaDePagamento \n parcelas: $parcelas \n valor: $valor');
    return PagamentoResult(
      cardBrand: 'master',
      cardBin: 'card bin',
      nsu: '12314512jdajsb',
      date: '',
      time: '',
      hostNSU: 'hostNSU',
      transactionID: '90394090',
      transactionCode: 'transactionCode',
    );
  }

  @override
  Future<void> imprimirArquivo({
    required String filePath,
    required BuildContext context,
  }) async {
    return;
  }

  @override
  Future<String> serialDaMaquina() async {
    return 'serial';
  }

  @override
  String get tipoDaMaquina => 'maquinaTeste';

  @override
  Future<bool> realizarEstorno(
      {required BuildContext context,
      int? valor,
      bool? permiteEditarValor,
      String? transactionCode,
      String? transactionId}) async {
    return true;
  }

  @override
  Future<List<Log>> recuperarLogsUltimaTransacao() {
    throw UnimplementedError();
  }

  @override
  Future<void> salvarLog(Log log) {
    throw UnimplementedError();
  }
}
