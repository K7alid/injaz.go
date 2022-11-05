import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/home_screen/cubit/home_cubit.dart';
import 'package:injaz_go/module/home_screen/widgets/build_grid_view_item.dart';
import 'package:injaz_go/module/route_screen/route_screen.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/network/local/cache_helper.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCards(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const CustomText(
                text: 'Injaz.Go',
                color: primaryColor,
                size: 20,
                isBold: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    CacheHelper.signOut(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_outline,
                    color: primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(context, const RouteScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 70,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomText(
                                text: 'Start Route',
                                color: Colors.white,
                                isBold: true,
                                size: 18,
                              ),
                              CustomText(
                                text: 'Start your daily journey',
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/delivery.png',
                            height: 70,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceInHeight(height: 30),
                  const CustomText(
                    text: 'Today\'s Journey',
                    size: 20,
                    isBold: true,
                  ),
                  spaceInHeight(height: 30),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      scrollDirection: Axis.vertical,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      children: List.generate(cubit.cards.length, (index) {
                        return Center(
                          child: buildGridViewItem(cubit.cards[index]),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
