import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:injaz_go/module/demand_details_screen/widgets/build_text_with_form_field.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget buildContainerWithCircularBox(/*{required Function onTap}*/) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 20),
          child: Icon(
            Icons.check_circle,
            color: primaryNotificationColor,
            size: 27,
          ),
        ),
        Expanded(
          child: ExpandableNotifier(
              child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    hasIcon: false,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: primaryNotificationColor,
                    ),
                    height: 60,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'البيانات الأساسية',
                          size: 18,
                          alignment: AlignmentDirectional.center,
                          color: Colors.white,
                        ),
                        Spacer(),
                        CircularPercentIndicator(
                          radius: 20.0,
                          lineWidth: 2.5,
                          backgroundColor: Colors.white,
                          percent: .75,
                          center: CustomText(
                            text: '100%',
                            size: 14,
                            alignment: AlignmentDirectional.center,
                            color: Colors.white,
                          ),
                          progressColor: Colors.white,
                        ),
                        spaceInWidth(width: 20),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                  expanded: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF7F8FA),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                          spaceInHeight(height: 7),
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                          spaceInHeight(height: 7),
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                          spaceInHeight(height: 7),
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                          spaceInHeight(height: 7),
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                          spaceInHeight(height: 7),
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                          spaceInHeight(height: 7),
                          buildTextWithFormField(
                            text: 'اسم المقاول',
                            width: 200,
                            paddingFromEnd: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  builder: (_, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    );
                  },
                  collapsed: Container(),
                ),
              ),
            ],
          )),
        ),
      ],
    );
