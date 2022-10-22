import 'package:flutter/material.dart';
import 'package:injaz_go/module/notifications_screen/widgets/build_notifications_item.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'My Notifications',
          alignment: AlignmentDirectional.center,
          isBold: true,
          size: 25,
          color: primaryNotificationColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
              color: primaryNotificationColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemBuilder: (context, index) => buildNotificationsItem(),
          separatorBuilder: (context, index) => spaceInHeight(height: 10),
          itemCount: 10,
        ),
      ),
    );
  }
}
