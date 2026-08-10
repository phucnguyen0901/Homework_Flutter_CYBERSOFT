import 'package:flutter/material.dart';
import 'homepage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _topContainer(),
          const SizedBox(height: 20),
          _speech(),
          const SizedBox(height: 30),
          _startButton(context),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Expanded _topContainer() => Expanded(
    flex: 3,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(200, 20),
          bottomRight: Radius.elliptical(200, 20),
        ),
      ),
    ),
  );

  Expanded _speech() {
    return Expanded(
      flex: 2,
      child: Center(
        child: const Text(
          'Complete your grocery need easily',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SizedBox _startButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        child: const SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Get started',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Icon(Icons.arrow_right_alt, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
