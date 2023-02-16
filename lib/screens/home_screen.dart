import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Navigate to Sorting Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/sorting');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Navigate to Fibonacci Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/fibonacci');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Navigate to Prime Numbers Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/prime');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Navigate to Elements Generator Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/elements');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Navigate to String Generator Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/string');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
