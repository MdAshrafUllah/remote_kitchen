import 'package:assignment_eight/view/assignment%20one/second_screen.dart';
import 'package:flutter/material.dart';

class AssignmentOneHomeScreen extends StatelessWidget {
  const AssignmentOneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment One"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SecondScreen()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text("Next Screen")),
      ),
    );
  }
}
