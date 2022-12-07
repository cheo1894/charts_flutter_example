import 'package:charts_example/pages/chartForm.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'chartForm',
      routes: {'chartForm': (_) =>  ChartForm()},
    );
  }
}
