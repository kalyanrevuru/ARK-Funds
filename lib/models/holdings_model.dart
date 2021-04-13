import 'package:arkfundsapp/screens/holdings_detail_screen.dart';
import 'package:flutter/material.dart';
import 'category.dart';

class HoldingsModel extends StatelessWidget {
  final List<Category> dummyList;
  final String date;

  HoldingsModel(this.dummyList, this.date);

  void selectHolding(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      HoldingsDetailScreen.routeName,
      arguments: {
        'id': id,
        'date': date,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => selectHolding(context, dummyList[index].id),
                    child: Container(
                      margin: EdgeInsets.zero,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 16,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  dummyList[index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                dummyList[index].subtitle,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${dummyList[index].amount}%',
                                style: TextStyle(fontSize: 17),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    height: 3,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              );
            },
            itemCount: dummyList.length,
          ),
        ],
      ),
    );
  }
}