class RouteTask {
  const RouteTask({
    required this.customerName,
    required this.city,
    required this.taskName,
    required this.customerNumber,
  });
  final String customerName;
  final String city;
  final String taskName;
  final int customerNumber;
}

List<RouteTask> routeTasks = [
  const RouteTask(
    customerName: 'Red Shop',
    city: 'Sofia',
    taskName: 'Sheikh Mohamed bin Rashid Blvd',
    customerNumber: 0101923,
  ),
  const RouteTask(
    customerName: 'Purple Shop',
    city: 'Dubai',
    taskName: 'Al Mada ar St',
    customerNumber: 01000019,
  ),
  const RouteTask(
    customerName: 'Green Shop',
    city: 'Dubai',
    taskName: 'Mall of Emirates',
    customerNumber: 01000006,
  ),
  const RouteTask(
    customerName: 'Jane\'s Outlet',
    city: 'Dubai',
    taskName: 'Any Task',
    customerNumber: 01000008,
  ),
  const RouteTask(
    customerName: 'Yellow Shop',
    city: 'Dubai',
    taskName: 'Royal Bridge Suites',
    customerNumber: 0300019,
  ),
  const RouteTask(
    customerName: 'Brown Shop',
    city: 'Dubai',
    taskName: 'Emirates First Business Class Chauffeur Service',
    customerNumber: 0300019,
  ),
];
