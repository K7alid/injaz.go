import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/route_screen/cubit/route_cubit.dart';
import 'package:injaz_go/module/route_screen/model/route_tasks.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class AllCustomerScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouteCubit, RouteState>(
      listener: (context, state) {},
      builder: (context, state) {
        var routeCubit = RouteCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                //navigateTo(context, CustomerDetailScreen(index: index));
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
                          text: routeCubit.routeModel!.customer.name.toString(),
                          color: primaryColor,
                          size: 18,
                        ),
                        spaceInHeight(height: 5),
                        CustomText(
                          text: routeTasks[index].taskName,
                        ),
                        spaceInHeight(height: 5),
                        CustomText(
                          text: routeTasks[index].customerNumber.toString(),
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
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: routeTasks.length,
          ),
        );
      },
    );
  }
}
