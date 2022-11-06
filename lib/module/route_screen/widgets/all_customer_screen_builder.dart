import 'package:flutter/material.dart';
import 'package:injaz_go/module/customer_detail_screen/customer_detail_screen.dart';
import 'package:injaz_go/module/route_screen/model/route_model.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class AllCustomerScreenBuilder extends StatelessWidget {
  final List<RouteModel> routeModel;

  const AllCustomerScreenBuilder({
    super.key,
    required this.routeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            navigateTo(
                context,
                CustomerDetailScreen(
                  routes: routeModel[index],
                ));
          },
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: routeModel[index].customer.name.toString(),
                      color: primaryColor,
                      size: 18,
                    ),
                    spaceInHeight(height: 5),
                    CustomText(
                      text: routeModel[index].customer.address.toString(),
                    ),
                    spaceInHeight(height: 5),
                    CustomText(
                      text: routeModel[index].code,
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: Colors.grey[700],
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: routeModel.length,
      ),
    );
  }
}
