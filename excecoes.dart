/*
  Tratamento de Error
  - try : Testar a lógica
  - catch : captura erros no try, caso tenho
  - on: Captura erros no try específicos
  - throw Exception: Exceção tratada pelo catch
  - finally : Executado ao final de try catch, tento ou não exceções, Libera recurso na logica try
 */

// caso 1 - quando desconhece a exceção, use try catch
void case1() {
  try {
    int res = 1 ~/ 0; // vai dar exceção
    // double res = 1 / 0; // resultado infinity mas não vai dar exceção
    // trucante division, o resultado em decimais é arredondado para 0;
    print(res);
  } catch (e) {
    print('Exception: $e');
  }
}

// caso 2 - quando você conhece a exceção, use ON

void case2() {
  try {
    // int res = 1 ~/ 0; // vai dar exceção
    int res = 1 ~/ 0; // resultado infinity mas não vai dar exceção
    // trucante division, o resultado em decimais é arredondado para 0;
    print(res);
  } on UnsupportedError {
    print('Exception: Não é possível dividir por zero!');
  } catch (e) {
    print('Exception: $e');
  }
}

//caso3: para descobrir eventos antes da exceção, use stack trace
void case3() {
  try {
    int res = 1 ~/ 0; // vai dar exceção
    // trucante division, o resultado em decimais é arredondado para 0;
    print(res);
  } catch (e, s) {
    print('Exception: $e');
    print('Stacktrace: $s');
  }
}

//caso4: use Finaly para tratamentos após exceção do try catch
void case4() {
  try {
    int res = 1 ~/ 0; // vai dar exceção
    print(res);
  } catch (e, s) {
    print('Exception: $e');
  } finally {
    print('após erro ou sucesso!');
  }
}

//caso5: use Finaly para tratamentos após exceção do try catch
void case5() {
  try {
    double res = 1 / 0; // vai dar exceção
    print(res);
    if (res.isInfinite) throw Exception('Divisão não pode ser feita por 0');
  } catch (e, s) {
    print('Exception: $e');
  }
}

void main(List<String> args) {
  case1();
  case2();
  case3();
  case4();
  case5();
}
