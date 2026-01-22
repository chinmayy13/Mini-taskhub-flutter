import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import '../chat/chat_screen.dart';
import '../calender/calender_screen.dart';
import '../notifications/notification_screen.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/add_task_modal.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final screens = const [
    DashboardScreen(),
    ChatScreen(),
    SizedBox(), // +
    CalendarScreen(),
    NotificationScreen(),
  ];

  void onTab(int i) {
    if (i == 2) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => AddTaskModal(),
      );
      return;
    }

    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavBar(currentIndex: _index, onTap: onTab),
    );
  }
}
