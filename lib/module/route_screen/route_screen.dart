import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/app_localization.dart';
import 'package:injaz_go/module/route_screen/cubit/route_cubit.dart';
import 'package:injaz_go/module/route_screen/widgets/all_customer_screen_builder.dart';
import 'package:injaz_go/module/route_screen/widgets/route_screen_builder.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouteCubit()..getRoutes(),
      child: BlocConsumer<RouteCubit, RouteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RouteCubit.get(context);

          return DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                backgroundColor: landColor,
                appBar: AppBar(
                  backgroundColor: landColor,
                  title: CustomText(
                    text: 'InjazGo'.tr(context),
                    color: Colors.black,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    )
                  ],
                  bottom: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(
                        text: 'Route'.tr(context),
                      ),
                      Tab(
                        text: 'AllCustomers'.tr(context),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    ConditionalBuilder(
                      condition: cubit.routes.isEmpty,
                      builder: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: primaryColor,
                      )),
                      fallback: (context) =>
                          RouteScreenBuilder(routeModel: cubit.routes),
                    ),
                    ConditionalBuilder(
                      condition: cubit.routes.isEmpty,
                      builder: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: primaryColor,
                      )),
                      fallback: (context) =>
                          AllCustomerScreenBuilder(routeModel: cubit.routes),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
