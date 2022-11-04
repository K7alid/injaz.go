import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/customer_detail_screen/customer_detail_screen.dart';
import 'package:injaz_go/module/route_screen/cubit/route_cubit.dart';
import 'package:injaz_go/module/route_screen/model/route_tasks.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RouteScreenBuilder extends StatelessWidget {
  int totalSteps = routeTasks.length;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouteCubit, RouteState>(
      listener: (context, state) {},
      builder: (context, state) {
        var routeCubit = RouteCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: routeTasks.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  navigateTo(context, CustomerDetailScreen(index: index));
                },
                child: Container(
                  child: buildTimelineTile(index, context),
                ),
              );
            },
          ),
        );
      },
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
