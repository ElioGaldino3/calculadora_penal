import 'package:calculadora_penal/models/crime.dart';
import 'package:calculadora_penal/pages/widgets/crime_field.dart';
import 'package:calculadora_penal/utils/consts/crimes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ListaCrimes extends StatefulWidget {
  final Function(Crime, bool) onChanged;

  const ListaCrimes({Key? key, required this.onChanged}) : super(key: key);

  @override
  _ListaCrimesState createState() => _ListaCrimesState();
}

class _ListaCrimesState extends State<ListaCrimes> {
  final TextEditingController _searchController = TextEditingController();
  final List<Crime> _selectedCrimes = <Crime>[];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Crime> _getListaCrimes({String? search}) {
    if (search == null || search.isEmpty) return crimes;

    final tempList = <Crime>[];

    for (var crime in crimes) {
      if (crime.titulo.toLowerCase().contains(search.toLowerCase()))
        tempList.add(crime);
    }

    return tempList;
  }

  bool _isSelected(Crime crime) {
    for (var selectedCrime in _selectedCrimes) {
      if (crime.titulo == selectedCrime.titulo) return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xcFF101010),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('CALCULADORA PENAL'),
          TextField(
            decoration: InputDecoration(hintText: "Digite para pesquisar"),
            controller: _searchController,
            onChanged: (value) {
              setState(() {});
            },
          ),
          SizedBox(height: 12.0),
          Expanded(
            child: ResponsiveGridList(
              desiredItemWidth: 130,
              minSpacing: 4,
              children: _getListaCrimes(search: _searchController.text).map(
                (crime) {
                  final bool isSelected = _isSelected(crime);
                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        _selectedCrimes.removeWhere(
                            (element) => element.titulo == crime.titulo);
                        widget.onChanged(crime, true);
                      } else {
                        _selectedCrimes.add(crime);
                        widget.onChanged(crime, false);
                      }
                      _searchController.text = "";
                      
                    },
                    child: CrimeField(crime, isSelected),
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
