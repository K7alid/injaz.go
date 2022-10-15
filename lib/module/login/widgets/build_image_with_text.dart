import 'package:flutter/material.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildImageWithText({
  required String text,
  required Function onTap,
  bool isSelected = false,
}) =>
    InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        color: isSelected ? Colors.grey : null,
        padding: EdgeInsets.all(7),
        child: Column(
          children: [
            Image.asset(
              '$assetImageBaseUrl$text.png',
            ),
            CustomText(
              text: text,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    );
