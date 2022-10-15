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
