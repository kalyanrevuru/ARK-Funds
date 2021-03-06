import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:arkfundsapp/providers/holdings_provider.dart';
import 'package:provider/provider.dart';

import '../models/holdings_screen_ListView.dart';
import '../models/holdings_screen_GraphView.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Holdings extends StatefulWidget {
  static const routeName = '/holdings';

  @override
  _HoldingsState createState() => _HoldingsState();
}

class _HoldingsState extends State<Holdings> {
  final date = DateFormat.yMMMd().format(DateTime.now()).toString();
  var _isLoading = false;

  Future<void> fetch() async {
    final productGroups =
        Provider.of<FundProductGroup>(context, listen: false).groups;
    List<Category> groups = [];
    for (int i = 0; i < productGroups.length; i++) {
      groups += productGroups[i];
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<HoldingsProvider>(context, listen: false)
          .fetchHoldings(groups[i].id);
    }
  }

  @override
  void initState() {
    _isLoading = true;
    fetch().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  List<HoldingsObject> _holdingsDetails;
  HoldingsObject _holdingsObj;
  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Category etfListItem = etfDetails['listItem'];
    final fundTitle = etfDetails['title'];
    if (!_isLoading) {
      _holdingsDetails =
          Provider.of<HoldingsProvider>(context, listen: false).holdingsList;
      _holdingsObj = _holdingsDetails
          .firstWhere((fund) => fund.id == etfListItem.id, orElse: () => null);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            fundTitle,
            style: TextStyle(
              fontFamily: 'SF-Pro-Text',
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color.fromRGBO(247, 247, 247, 1),
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(
                child: Text('List view'),
              ),
              Tab(
                child: Text('Graph View'),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                      'AS OF DATE - ' + _holdingsObj.date,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Sf-Pro-Text',
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: TabBarView(
                      children: [
                        HoldingsListView(_holdingsObj),
                        HoldingsGraphView(_holdingsObj),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
