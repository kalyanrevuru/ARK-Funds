import 'package:arkfundsapp/widgets/custom_list_view.dart';
import 'package:arkfundsapp/widgets/intoduction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './dummy_data.dart';

void main() => runApp(ArkFundsLAndingPage());

class ArkFundsLAndingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARK - Funds',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARK - Funds'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Introduction(150),
          Container(
            width: double.infinity,
            color: Colors.grey[350],
            child: Text(
              'ACTIVELY MANAGED INNOVATION  ETFs',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          CustomListView(DUMMY_CATEGORIES1, 300),
          Container(
            width: double.infinity,
            color: Colors.grey[350],
            child: Text(
              'INDEXED INNOVATION  ETFs',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          CustomListView(DUMMY_CATEGORIES2, 120),
        ],
      ),
    );
  }
}
