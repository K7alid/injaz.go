import 'package:flutter/material.dart';
import 'package:injaz_go/module/home_screen/task_model.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: CustomText(text: 'SLA-MOBILE-DEMO'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
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
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(7),
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
                      children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Today\'s Journey',
                  size: 20,
                  isBold: true,
                ),
                CustomText(
                  text: 'DM10002',
                  color: primaryColor,
                  isBold: true,
                ),
              ],
            ),
            spaceInHeight(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                children: List.generate(tasks.length, (index) {
                  return Center(
                    child: buildGridViewItem(tasks[index]),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildGridViewItem(Task task) => Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                text: task.number.toString(),
                isBold: true,
                size: 25,
                alignment: AlignmentDirectional.topCenter),
            CustomText(
                text: task.text, alignment: AlignmentDirectional.topCenter),
          ],
        ),
      ),
    );
