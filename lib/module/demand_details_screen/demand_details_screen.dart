import 'package:flutter/material.dart';
import 'package:injaz_go/module/demand_details_screen/widgets/build_container_with_circular_box.dart';
import 'package:injaz_go/module/demand_details_screen/widgets/build_text_with_form_field.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class DemandDetailsScreen extends StatelessWidget {
  const DemandDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(
            text: 'تفاصيل الطلب',
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
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              buildTextWithFormField(
                text: 'رقم الطلب',
                hintText: '12345679',
              ),
              spaceInHeight(height: 7),
              buildTextWithFormField(
                text: 'مقدم الطلب',
                hintText: 'امجد محمد الدسوقي',
              ),
              spaceInHeight(height: 7),
              buildTextWithFormField(
                text: 'تاريخ الطلب',
                hintText: '29/10/2022',
              ),
              spaceInHeight(height: 37),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, state) =>
                      buildContainerWithCircularBox(title: 'البيانات الأساسية'),
                  separatorBuilder: (context, state) =>
                      spaceInHeight(height: 15),
                  itemCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
