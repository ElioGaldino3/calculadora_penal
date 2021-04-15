import 'package:calculadora_penal/models/crime.dart';
import 'package:calculadora_penal/models/crime_with_amount.dart';
import 'package:calculadora_penal/pages/widgets/detalhes.dart';
import 'package:calculadora_penal/pages/widgets/lista_crimes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CrimeWithAmount> _crimes = <CrimeWithAmount>[];

  _onChanged(Crime crime, bool remove) {
    setState(() {
      if (remove) {
        _crimes.removeWhere((element) => element.crime.titulo == crime.titulo);
      } else {
        _crimes.add(CrimeWithAmount(crime));
      }
    });
  }

  _setCrimes(List<CrimeWithAmount> crimes) {
    setState(() {
      _crimes = crimes;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: ListaCrimes(onChanged: _onChanged)),
          Container(
            width: width * .3,
            color: Colors.grey[800],
            child: Detalhes(
              crimes: _crimes,
              onChanged: _setCrimes,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.clear),
      ),
    );
  }
}
