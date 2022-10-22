import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

Widget buildNotificationsItem() => Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ScreenUtilInit(
                      builder: (BuildContext context, Widget? child) =>
                          CustomText(
                        size: ScreenUtil().setSp(12),
                        text: 'The Task# : 9816498565',
                        color: primaryNotificationColor,
                        isBold: true,
                      ),
                    ),
                    spaceInWidth(width: 15),
                    CustomText(
                      text: 'Is Under Review',
                      color: Colors.grey,
                    ),
                  ],
                ),
                spaceInHeight(height: 7),
                CustomText(
                  text: '10/19/2022 22:49',
                  color: secondaryNotificationColor,
                  isBold: true,
                ),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                  size: 35,
                ))
          ],
        ),
      ),
    );
