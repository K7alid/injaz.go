import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildTextWithFormField({required String text, String hintText = ''}) =>
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
          margin: EdgeInsetsDirectional.only(end: 25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF7F8FA),
          ),
          height: 30,
          width: 250,
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
