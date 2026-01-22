import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Logo image
        Image.asset('assets/images/logo.png', height: 80),

        const SizedBox(height: 12),

        /// App name
        // RichText(
        //   text: const TextSpan(
        //     text: 'Day',
        //     style: TextStyle(
        //       fontSize: 28,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //     children: [
        //       TextSpan(
        //         text: 'Task',
        //         style: TextStyle(color: Color(0xFFF5D77A)),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
