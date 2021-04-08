import 'package:flutter/material.dart';

import '../dummy_data.dart';

class DetailFundDescription extends StatelessWidget {
  static const routeName = '/detail-fund-description';
  @override
  Widget build(BuildContext context) {
    final etfTitle = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(etfTitle),
      ),
      body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'Fund Description and Objective',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          //margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          child: Text(
            FUND_DESCRIPTION[0],
            textAlign: TextAlign.left,
            // overflow: TextOverflow.ellipsis,
            // maxLines: 4,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ])),
    );
  }
}