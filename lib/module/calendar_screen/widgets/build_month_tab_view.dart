import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:injaz_go/module/calendar_screen/cubit/cubit.dart';
import 'package:injaz_go/shared/constants.dart';

Widget buildMonthTabView(context) => Stack(
      children: [
        Container(
          height: 50,
          color: Colors.amber[200],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 40,
          color: Colors.amber[100],
        ),
        Calendar(
          startOnMonday: true,
          weekDays: [
            'Mon',
            'Tue',
            'Wed',
            'Thu',
            'Fri',
            'Sat',
            'Son',
          ],
          eventsList: CalendarCubit.get(context).eventList,
//isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          selectedTodayColor: secondaryColor,
          todayColor: Colors.blue,
          eventColor: null,
          locale: 'de_DE',
          allDayEventText: 'Ganztägig',
          multiDayEndText: 'Ende',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 11,
          ),
        ),
      ],
    );
