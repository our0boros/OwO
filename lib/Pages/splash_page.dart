import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Text(
              "OwO",
              style: TextStyle(
                fontSize: 200,
              )
          ),
        ),
      )
    );
  }
}
