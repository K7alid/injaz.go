import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  leading: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  title: const CustomText(
                    text: 'Route | 02 OCT, SUN',
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
                  bottom: const TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(
                        text: 'Route',
                      ),
                      Tab(
                        text: 'All Customers',
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
