import 'package:flutter/material.dart';
import 'package:injaz_go/app_localization.dart';
import 'package:injaz_go/module/customer_detail_screen/widget/build_cusomer_tasks.dart';
import 'package:injaz_go/module/route_screen/model/route_model.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class CustomerDetailScreen extends StatelessWidget {
  final RouteModel routes;
  CustomerDetailScreen({
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: landColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: CustomText(
            text: '${'Customer'.tr(context)} | ${routes.customer.name}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  color: primaryColor,
                  size: 50,
                ),
                spaceInWidth(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'CustomerName'.tr(context),
                      size: 15,
                      color: primaryColor,
                    ),
                    CustomText(
                      text: routes.customer.name,
                      size: 18,
                      isBold: true,
                      color: primaryColor,
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 50,
                ),
                spaceInWidth(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'PendingDeliveries'.tr(context),
                      size: 15,
                      color: Colors.red,
                    ),
                    const CustomText(
                      text: '1',
                      size: 18,
                      isBold: true,
                      color: Colors.red,
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 50,
                ),
                spaceInWidth(width: 15),
                CustomText(
                  text: 'ActiveCampaign'.tr(context),
                  size: 15,
                  color: Colors.red,
                ),
              ],
            ),
            spaceInHeight(height: 10),
            Container(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomText(
                  text: 'OtherTasks'.tr(context),
                  size: 17,
                ),
              ),
            ),
            spaceInHeight(height: 10),
            Expanded(
              child: buildCustomerTasks(routes.tasks),
            ),
          ],
        ),
      ),
    );
  }
}
