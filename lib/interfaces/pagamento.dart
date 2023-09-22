bool pagamentoContractInject = false;

abstract class PagamentoContract {
  Future<Map<String, String>> fazerPagamento(
    String formaDePagamento,
    int parcelas,
    int valor,
  );

  Future<void> realizarEstorno();
}
