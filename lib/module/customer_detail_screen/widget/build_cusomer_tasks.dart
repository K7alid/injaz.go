import 'package:flutter/material.dart';
import 'package:injaz_go/module/customer_detail_screen/model/customer_detail_model.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildCustomerTasks() => ListView.separated(
      itemBuilder: (context, index) => Row(
        children: [
          Icon(
            customerTasks[index].icon,
            size: 50,
            color: Colors.grey[600],
          ),
          spaceInWidth(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: customerTasks[index].taskName,
                color: Colors.grey[600]!,
                size: 18,
                isBold: true,
              ),
              CustomText(
                text: customerTasks[index].taskDetail,
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
      itemCount: customerTasks.length,
    );
