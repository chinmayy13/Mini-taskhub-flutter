import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _HeaderText(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFF3A4652),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// SEARCH BAR
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A4652),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.white54),
                          SizedBox(width: 10),
                          Text(
                            'Search tasks',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5D77A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              /// COMPLETED TASKS
              const _SectionHeader(title: 'Completed Tasks'),
              const SizedBox(height: 16),

              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _CompletedCard(
                      title: 'Real Estate\nWebsite Design',
                      dark: false,
                    ),
                    _CompletedCard(
                      title: 'Finance\nMobile App Design',
                      dark: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              /// ONGOING PROJECTS
              const _SectionHeader(title: 'Ongoing Projects'),
              const SizedBox(height: 16),

              const _OngoingCard(
                title: 'Mobile App Wireframe',
                percent: 0.75,
                due: '21 March',
              ),
              const SizedBox(height: 16),
              const _OngoingCard(
                title: 'Real Estate App Design',
                percent: 0.6,
                due: '20 June',
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

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back!',
          style: TextStyle(color: Color(0xFFF5D77A), fontSize: 14),
        ),
        SizedBox(height: 6),
        Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('See all', style: TextStyle(color: Color(0xFFF5D77A))),
      ],
    );
  }
}

class _CompletedCard extends StatelessWidget {
  final String title;
  final bool dark;

  const _CompletedCard({required this.title, required this.dark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF3A4652) : const Color(0xFFF5D77A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: dark ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          LinearProgressIndicator(
            value: 1,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation(
              dark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Completed 100%',
            style: TextStyle(color: dark ? Colors.white70 : Colors.black87),
          ),
        ],
      ),
    );
  }
}

class _OngoingCard extends StatelessWidget {
  final String title;
  final double percent;
  final String due;

  const _OngoingCard({
    required this.title,
    required this.percent,
    required this.due,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF3A4652),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Due on : $due',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              value: percent,
              strokeWidth: 6,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Color(0xFFF5D77A)),
            ),
          ),
        ],
      ),
    );
  }
}
