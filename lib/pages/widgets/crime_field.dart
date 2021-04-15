import 'package:calculadora_penal/models/crime.dart';
import 'package:flutter/material.dart';

class CrimeField extends StatelessWidget {
  final Crime crime;
  final bool active;

  const CrimeField(this.crime, this.active, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _comentario = SizedBox();

    if (crime.comentario != null) {
      _comentario = Text(
        '* ${crime.comentario!}',
        style: TextStyle(color: Colors.black, fontSize: 10.0),
      );
    }

    return Container(
      width: 130.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: !active ? Color(0xcFF097000) : Color(0xcFF2C312B),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            crime.titulo.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _comentario
        ],
      ),
    );
  }
}
