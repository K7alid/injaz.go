import 'package:flutter/material.dart';
import 'package:injaz_go/module/login/cubit/cubit.dart';
import 'package:injaz_go/module/login/widgets/build_image_with_text.dart';

class BuildAllImagesWithText extends StatelessWidget {
  final LoginCubit cubit;

  const BuildAllImagesWithText({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildImageWithText(
              text: 'MRP',
              isSelected: cubit.isSelectedList[0],
              onTap: () {
                cubit.changeIconToggle(0);
              },
            ),
            buildImageWithText(
              text: 'CRM',
              isSelected: cubit.isSelectedList[1],
              onTap: () {
                cubit.changeIconToggle(1);
              },
            ),
            buildImageWithText(
              text: 'POS',
              isSelected: cubit.isSelectedList[2],
              onTap: () {
                cubit.changeIconToggle(2);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildImageWithText(
              text: 'Inventory',
              isSelected: cubit.isSelectedList[3],
              onTap: () {
                cubit.changeIconToggle(3);
              },
            ),
            buildImageWithText(
              text: 'Sales',
              isSelected: cubit.isSelectedList[4],
              onTap: () {
                cubit.changeIconToggle(4);
              },
            ),
            buildImageWithText(
              text: 'Timesheet',
              isSelected: cubit.isSelectedList[5],
              onTap: () {
                cubit.changeIconToggle(5);
              },
            ),
          ],
        ),
      ],
    );
  }
}
