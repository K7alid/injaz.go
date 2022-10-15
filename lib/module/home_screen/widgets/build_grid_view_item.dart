import 'package:flutter/material.dart';
import 'package:injaz_go/module/home_screen/model/task_model.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildGridViewItem(Task task) => Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: task.number.toString(),
              isBold: true,
              size: 25,
              color: primaryColor,
              alignment: AlignmentDirectional.topCenter,
            ),
            CustomText(
              text: task.text,
              alignment: AlignmentDirectional.topCenter,
            ),
          ],
        ),
      ),
    );
