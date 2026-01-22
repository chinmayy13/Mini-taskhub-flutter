import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              /// TODAY
              const _SectionLabel('Today'),
              const SizedBox(height: 12),

              const _NotificationTile(
                icon: Icons.check_circle,
                iconColor: Color(0xFFF5D77A),
                title: 'Task Completed',
                description: 'You completed “Mobile App Wireframe”.',
                time: '10 min ago',
                unread: true,
              ),

              const _NotificationTile(
                icon: Icons.notifications_active,
                iconColor: Colors.orangeAccent,
                title: 'Reminder',
                description: 'Don’t forget to review your tasks.',
                time: '1 hour ago',
                unread: true,
              ),

              const SizedBox(height: 24),

              /// EARLIER
              const _SectionLabel('Earlier'),
              const SizedBox(height: 12),

              const _NotificationTile(
                icon: Icons.calendar_month,
                iconColor: Colors.lightBlueAccent,
                title: 'Upcoming Deadline',
                description: 'Real Estate App Design is due tomorrow.',
                time: 'Yesterday',
              ),

              const _NotificationTile(
                icon: Icons.person_add,
                iconColor: Colors.purpleAccent,
                title: 'New Member',
                description: 'Sophia joined your project.',
                time: '2 days ago',
              ),

              const _NotificationTile(
                icon: Icons.chat_bubble,
                iconColor: Colors.greenAccent,
                title: 'New Message',
                description: 'You received a new message from Olivia.',
                time: '3 days ago',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================
   SMALL REUSABLE WIDGETS
   ========================= */

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String time;
  final bool unread;

  const _NotificationTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.time,
    this.unread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2632),
        borderRadius: BorderRadius.circular(14),
        border: unread
            ? Border.all(color: const Color(0xFFF5D77A), width: 1)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 14),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          /// TIME + DOT
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const SizedBox(height: 6),
              if (unread)
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5D77A),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
