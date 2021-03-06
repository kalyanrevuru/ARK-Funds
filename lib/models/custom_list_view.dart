import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../screens/etf_detail_screen.dart';

class CustomListView extends StatelessWidget {
  final List<Category> categoryList;

  CustomListView(this.categoryList);

  void selectEtf(BuildContext context, Category listItem) {
    Navigator.of(context)
        .pushNamed(EtfDetailScreen.routeName, arguments: listItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              InkWell(
                onTap: () => selectEtf(context, categoryList[index]),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(
                    left: 12,
                    top: 8,
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              categoryList[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'SF-Pro-Rounded',
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            categoryList[index].subtitle,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF4D4D4D),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            FlutterMoneyFormatter(
                              amount: categoryList[index].amount,
                            ).output.compactSymbolOnLeft,
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'SF-Pro-Rounded',
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 12,
                height: 3,
                thickness: 0.5,
                color: Colors.grey,
              ),
            ],
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
