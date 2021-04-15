import 'package:calculadora_penal/models/crime.dart';

final crimes = <Crime>[
  Crime(id: 0, titulo: "Caixa eletronico/ATM", multa: 5000, pena: 30),
  Crime(id: 0, titulo: "Caixa registradora", multa: 2000, pena: 20),
  Crime(id: 0, titulo: "Tentativa de fuga/desobediência", multa: 1000, pena: 5),
  Crime(
    id: 0,
    titulo: "Porte de dinheiro sujo",
    multa: 2500,
    pena: 1,
    comentario: "a cada 2000 adiciona + 1 unidade de pena",
  ),
];
