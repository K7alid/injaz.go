import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/calendar_screen/cubit/cubit.dart';
import 'package:injaz_go/module/calendar_screen/cubit/states.dart';
import 'package:injaz_go/module/calendar_screen/widgets/build_month_tab_view.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CalendarCubit(),
      child: BlocConsumer<CalendarCubit, CalendarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: CustomText(
                  text: 'My Calendar',
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
                bottom: const TabBar(
                  indicatorColor: primaryNotificationColor,
                  unselectedLabelColor: Colors.grey,
                  labelColor: primaryNotificationColor,
                  tabs: <Widget>[
                    Tab(
                      text: 'Day',
                    ),
                    Tab(
                      text: 'Week',
                    ),
                    Tab(
                      text: 'Month',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  buildMonthTabView(
                    context,
                    isMonth: false,
                  ),
                  buildMonthTabView(
                    context,
                    isMonth: false,
                  ),
                  buildMonthTabView(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /*void _handleNewDate(date) {
    print('Date selected: $date');
  }*/
  /* @override
  void initState() {
    super.initState();
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }*/

}
