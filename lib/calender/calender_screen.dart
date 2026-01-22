import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime focusedDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(
      focusedDate.year,
      focusedDate.month,
    );
    final firstDayWeekday = DateTime(
      focusedDate.year,
      focusedDate.month,
      1,
    ).weekday;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Calendar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            focusedDate = DateTime(
                              focusedDate.year,
                              focusedDate.month - 1,
                            );
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            focusedDate = DateTime(
                              focusedDate.year,
                              focusedDate.month + 1,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// MONTH TITLE
              Text(
                DateFormat.yMMMM().format(focusedDate),
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 20),

              /// WEEK DAYS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _WeekDay('Mon'),
                  _WeekDay('Tue'),
                  _WeekDay('Wed'),
                  _WeekDay('Thu'),
                  _WeekDay('Fri'),
                  _WeekDay('Sat'),
                  _WeekDay('Sun'),
                ],
              ),

              const SizedBox(height: 12),

              /// CALENDAR GRID
              Expanded(
                child: GridView.builder(
                  itemCount: daysInMonth + firstDayWeekday - 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    if (index < firstDayWeekday - 1) {
                      return const SizedBox();
                    }

                    final day = index - firstDayWeekday + 2;

                    final date = DateTime(
                      focusedDate.year,
                      focusedDate.month,
                      day,
                    );

                    final isSelected = DateUtils.isSameDay(date, selectedDate);

                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedDate = date);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFF5D77A)
                              : const Color(0xFF1C2632),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          day.toString(),
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              /// EVENTS SECTION
              const Text(
                'Events',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C2632),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.event, color: Color(0xFFF5D77A)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'No events for this day',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================
   SMALL WIDGETS
   ========================= */

class _WeekDay extends StatelessWidget {
  final String label;
  const _WeekDay(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
