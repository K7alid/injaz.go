import 'package:flutter/material.dart';
import 'package:injaz_go/module/route_screen/model/route_tasks.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RouteScreenBuilder extends StatelessWidget {
  int totalSteps = routeTasks.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: routeTasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: buildTimelineTile(index, context),
          );
        },
      ),
    );
  }

  Widget buildTimelineTile(int index, context) {
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
                text: routeTasks[index].customerName,
                isBold: true,
                color: primaryColor,
              ),
              spaceInHeight(height: 7),
              CustomText(
                text:
                    '${routeTasks[index].city}, ${routeTasks[index].taskName}',
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
  return Container(
    child: Material(
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
    ),
  );
}

/*
import 'package:flutter/material.dart';
import 'package:injaz_go/module/route_screen/model/route_tasks.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class RouteScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: ListView.separated(
              itemBuilder: (context, index) => Container(
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
                      text: routeTasks[index].customerName,
                      isBold: true,
                      color: primaryColor,
                    ),
                    spaceInHeight(height: 7),
                    CustomText(
                      text:
                          '${routeTasks[index].city}, ${routeTasks[index].taskName}',
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => spaceInHeight(height: 20),
              itemCount: routeTasks.length,
            ),
          ),
        ],
      ),
    );
  }
}
*/
