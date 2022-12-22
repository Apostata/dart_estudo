import 'dart:math';

void main(List<String> args) {
  double raio = 5;
  Calculos calculo = Calculos();
  print(calculo.pi);
  print(calculo.areaCirculo(raio));
  print(Calculos.piEstatico);
  print(Calculos.areaCirculoEstatica(raio));
}

class Calculos {
  double pi = 3.14;
  static double piEstatico = 3.14;

  double areaCirculo(double raio) {
    return pi * (pow(raio, 2));
  }

  static double areaCirculoEstatica(double raio) {
    return piEstatico * (pow(raio, 2));
  }
}
