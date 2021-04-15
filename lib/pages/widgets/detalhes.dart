import 'package:calculadora_penal/models/crime.dart';
import 'package:calculadora_penal/models/crime_with_amount.dart';
import 'package:calculadora_penal/utils/consts/crimes.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  final List<CrimeWithAmount> crimes;
  final Function(List<CrimeWithAmount>) onChanged;

  const Detalhes({Key? key, required this.crimes, required this.onChanged})
      : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  final textController = TextEditingController();
  int penaTotal = 0;
  int multaTotal = 0;
  calcularPena() {
    List<String> texto = <String>[];

    penaTotal = 0;
    multaTotal = 0;

    for (var crime in widget.crimes) {
      penaTotal += crime.amount * crime.crime.pena;
      multaTotal += crime.amount * crime.crime.multa;
      texto.add(crime.crime.titulo);
    }

    textController.text = texto.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    calcularPena();
    return Container(
      color: Color(0xcFF1C1C1C),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text('DETALHES'),
          SizedBox(height: 12),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.crimes.length,
                    separatorBuilder: (_, __) => SizedBox(height: 8.0),
                    itemBuilder: (context, index) {
                      final crimeAmount = widget.crimes[index];
                      return Row(
                        children: [
                          Expanded(child: Text(crimeAmount.crime.titulo)),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (crimeAmount.amount > 1)
                                    widget.crimes[index].amount--;

                                  widget.onChanged(widget.crimes);
                                },
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(width: 16),
                              Text('${crimeAmount.amount}'),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  widget.crimes[index].amount++;
                                  widget.onChanged(widget.crimes);
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    children: [
                      Text('TOTAL'),
                      SizedBox(height: 6.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'PENA: $penaTotal meses',
                          textAlign: TextAlign.start,
                          style: TextStyle(),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'MULTA: $multaTotal reais',
                          textAlign: TextAlign.start,
                          style: TextStyle(),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          maxLines: 5,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0)
        ],
      ),
    );
  }
}
