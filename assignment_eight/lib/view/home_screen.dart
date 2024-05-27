import 'package:assignment_eight/view/assignment%20five/home_screen.dart';
import 'package:assignment_eight/view/assignment%20four/home_screen.dart';
import 'package:assignment_eight/view/assignment%20seven/home_screen.dart';
import 'package:assignment_eight/view/assignment%20six/home_screen.dart';
import 'package:assignment_eight/view/assignment%20three/home_screen.dart';
import 'package:assignment_eight/view/assignment%20two/count_screen.dart';
import 'package:assignment_eight/view/assignment%20one/home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Eight"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignmentOneHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment One"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentTwoHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment Two"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentThreeHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment Three"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentFourHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment Four"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignmentFiveHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment Five"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignmentSixHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment Six"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignmentSevenHomeScreen(),
                  ),
                );
              },
              child: const Text("Assignment Seven"),
            ),
          ],
        ),
      ),
    );
  }
}
