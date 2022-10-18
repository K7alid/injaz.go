import 'package:flutter/material.dart';

class CustomerTask {
  final String taskName;
  final String taskDetail;
  final IconData icon;

  CustomerTask({
    required this.taskName,
    required this.taskDetail,
    required this.icon,
  });
}

List<CustomerTask> customerTasks = [
  CustomerTask(
    taskName: 'Customer History',
    taskDetail: 'Check the history of the customer',
    icon: Icons.speed_outlined,
  ),
  CustomerTask(
    taskName: 'Reschedule',
    taskDetail: 'Reschedule customer visit',
    icon: Icons.schedule_outlined,
  ),
  CustomerTask(
    taskName: 'Teleorder',
    taskDetail: 'Order goods on behalf of the customer',
    icon: Icons.phone_callback_sharp,
  ),
  CustomerTask(
    taskName: 'Skip',
    taskDetail: 'Declare that the customer can not be served',
    icon: Icons.close,
  ),
  CustomerTask(
    taskName: 'Set New Location',
    taskDetail: 'Set customer\' GPS coordinates',
    icon: Icons.location_on,
  ),
];
