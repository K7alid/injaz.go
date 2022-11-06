import 'package:flutter/material.dart';
import 'package:injaz_go/module/route_screen/model/route_model.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildCustomerTasks(List<Task> tasks) => ListView.separated(
      itemBuilder: (context, index) => Row(
        children: [
          Icon(
            Icons.speed_outlined,
            size: 50,
            color: Colors.grey[600],
          ),
          spaceInWidth(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: tasks[index].name.toString(),
                color: Colors.grey[600]!,
                size: 18,
                isBold: true,
              ),
              CustomText(
                text: tasks[index].description.toString(),
                color: Colors.grey,
                size: 13,
              ),
            ],
          ),
        ],
      ),
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
      itemCount: tasks.length,
    );
