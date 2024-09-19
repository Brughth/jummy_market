import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const CounterScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jummy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
            
                
              )
            ],
          )
        ],
      ),
    );
  }
}
