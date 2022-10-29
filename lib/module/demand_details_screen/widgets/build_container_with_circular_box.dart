import 'package:flutter/material.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget buildContainerWithCircularBox({required String title}) => Row(
      children: [
        Icon(
          Icons.check_circle,
          color: primaryNotificationColor,
          size: 27,
        ),
        spaceInWidth(width: 7),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFF7F8FA),
            ),
            height: 60,
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            child: Row(
              children: [
                CustomText(
                  text: title,
                  size: 18,
                  alignment: AlignmentDirectional.center,
                  color: Colors.grey,
                ),
                Spacer(),
                CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 2.5,
                  percent: .75,
                  center: Text("75%"),
                  progressColor: primaryNotificationColor,
                ),
                spaceInWidth(width: 20),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.grey,
                  size: 35,
                ),
              ],
            ),
          ),
        ),
      ],
    );
