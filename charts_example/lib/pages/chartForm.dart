import 'package:charts_example/widgets/myButton.dart';
import 'package:charts_example/widgets/myInput.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartForm extends StatefulWidget {
  ChartForm({Key? key}) : super(key: key);

  @override
  State<ChartForm> createState() => _ChartFormState();
}

class _ChartFormState extends State<ChartForm> {
  TextEditingController _valor1 = TextEditingController();

  TextEditingController _valor2 = TextEditingController();

  TextEditingController _valor3 = TextEditingController();

  TextEditingController _valor4 = TextEditingController();

  bool disabled = true;
  bool generate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Gráfica de torta'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Ingresa los valores a mostrar en la gráfica:',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                //VALOR 1
                MyInput(
                  controller: _valor1,
                  onChanged: () {
                    isDisabled();
                  },
                  placeholder: 'valor 1',
                ),
                SizedBox(
                  height: 20,
                ),
                //VALOR 2
                MyInput(
                  controller: _valor2,
                  onChanged: () {
                    isDisabled();
                  },
                  placeholder: 'valor 2',
                ),
                SizedBox(
                  height: 20,
                ),
                //VALOR 3
                MyInput(
                  controller: _valor3,
                  onChanged: () {
                    isDisabled();
                  },
                  placeholder: 'valor 3',
                ),
                SizedBox(
                  height: 20,
                ),
                //VALOR 4
                MyInput(
                  controller: _valor4,
                  onChanged: () {
                    isDisabled();
                  },
                  placeholder: 'valor 4',
                ),
                SizedBox(
                  height: 40,
                ),
                if (generate == true) myPie(),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MyButton(
            disabled: disabled,
            onTap: () {
              if (!generate) {
                setState(() {
                  generate = true;
                });
              } else {
                setState(() {
                  generate = false;
                  _valor1.text = '';
                  _valor2.text = '';
                  _valor3.text = '';
                  _valor4.text = '';
                });
                isDisabled();
              }
            },
            title: !generate ? 'Generar gráficas' : 'Limpiar formulario',
          ),
        ));
  }

  myPie() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Torta:',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: Center(
            child: PieChart(PieChartData(
                centerSpaceRadius: 80,
                centerSpaceColor: Colors.transparent,
                startDegreeOffset: 270,
                sectionsSpace: 0,
                sections: [
                  sectionPie(Colors.red, double.parse(_valor1.text.toString())),
                  sectionPie(Colors.blue, double.parse(_valor2.text.toString())),
                  sectionPie(Colors.green, double.parse(_valor3.text.toString())),
                  sectionPie(Colors.yellow, double.parse(_valor4.text.toString()))
                ])),
          ),
        ),
      ],
    );
  }

  PieChartSectionData sectionPie(Color color, double value) {
    return PieChartSectionData(
        color: color,
        value: value,
        title: value.toString(),
        radius: 50,
        showTitle: true,
        titleStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500));
  }

  isDisabled() {
    if (_valor1.text.isNotEmpty &&
        _valor2.text.isNotEmpty &&
        _valor3.text.isNotEmpty &&
        _valor4.text.isNotEmpty) {
      setState(() {
        disabled = false;
      });
    } else {
      setState(() {
        disabled = true;
      });
    }
  }
}
