import 'package:flutter/material.dart';
import 'package:injaz_go/module/customer_detail_screen/widget/build_cusomer_tasks.dart';
import 'package:injaz_go/module/route_screen/model/route_tasks.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class CustomerDetailScreen extends StatelessWidget {
  final int index;

  const CustomerDetailScreen({
    required this.index,
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
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title:
            CustomText(text: 'Customer | ${routeTasks[index].customerNumber}'),
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
                    const CustomText(
                      text: 'Customer Name',
                      size: 13,
                      color: primaryColor,
                    ),
                    CustomText(
                      text: routeTasks[index].customerName,
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
                    const CustomText(
                      text: 'Pendings Deliveries',
                      size: 13,
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
                const CustomText(
                  text: 'Active Campaign',
                  size: 13,
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
                  text: 'Other Tasks',
                ),
              ),
            ),
            spaceInHeight(height: 10),
            Expanded(
              child: buildCustomerTasks(),
            ),
          ],
        ),
      ),
    );
  }
}
