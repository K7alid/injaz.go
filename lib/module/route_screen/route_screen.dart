import 'package:flutter/material.dart';
import 'package:injaz_go/module/route_screen/widgets/all_customer_screen_builder.dart';
import 'package:injaz_go/module/route_screen/widgets/route_screen_builder.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          backgroundColor: landColor,
          appBar: AppBar(
            backgroundColor: landColor,
            leading: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: const CustomText(
              text: 'Route | 02 OCT, SUN',
              color: Colors.black,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              )
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: CustomText(
                    text: 'Route',
                    color: Colors.black,
                  ),
                ),
                Tab(
                  child: CustomText(
                    text: 'All Customers',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              RouteScreenBuilder(),
              AllCustomerScreenBuilder(),
            ],
          ),
        ));
  }
}
