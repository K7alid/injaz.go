import 'package:flutter/material.dart';
import 'package:injaz_go/module/customer_detail_screen/customer_detail_screen.dart';
import 'package:injaz_go/module/route_screen/model/route_model.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RouteScreenBuilder extends StatelessWidget {
  final List<RouteModel> routeModel;
  int totalSteps = 5;
  RouteScreenBuilder({super.key, required this.routeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: routeModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateTo(
                  context,
                  CustomerDetailScreen(
                    index: index,
                    routeModel: routeModel,
                  ));
            },
            child: Container(
              child: buildTimelineTile(index, routeModel, context),
            ),
          );
        },
      ),
    );
  }

  Widget buildTimelineTile(int index, List<RouteModel> routeModel, context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.0,
      isFirst: index == 0 ? true : false,
      isLast: index == totalSteps - 1 ? true : false,
      indicatorStyle: IndicatorStyle(
        width: 20,
        height: 20,
        indicator: buildIndicator(index),
      ),
      afterLineStyle: LineStyle(
        thickness: 1,
        color: secondaryColor,
      ),
      beforeLineStyle: LineStyle(
        thickness: 1,
        color: secondaryColor,
      ),
      endChild: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15, bottom: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10),
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: routeModel[index].customer.name.toString(),
                isBold: true,
                color: primaryColor,
              ),
              spaceInHeight(height: 7),
              CustomText(
                text:
                    '${routeModel[index].customer.address}, ${routeModel[index].tasks[index].name}',
                size: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildIndicator(index) {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(7),
    child: Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text((index + 1).toString()),
      ),
    ),
  );
}
