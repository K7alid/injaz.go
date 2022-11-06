import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildTextWithFormField({
  required String text,
  String hintText = '',
  double width = 250,
  double paddingFromEnd = 25,
  Color backgroundColor = Colors.white,
}) =>
    Row(
      children: [
        ScreenUtilInit(
          builder: (BuildContext context, Widget? child) => CustomText(
            size: ScreenUtil().setSp(13),
            text: text,
            color: primaryNotificationColor,
            isBold: true,
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsetsDirectional.only(end: paddingFromEnd),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          height: 35,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
