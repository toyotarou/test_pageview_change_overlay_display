import 'package:flutter/material.dart';

import 'overlay_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView + Overlay Expand Transition',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyOverlaySample(),
    );
  }
}

class MyOverlaySample extends StatefulWidget {
  const MyOverlaySample({super.key});

  @override
  State<MyOverlaySample> createState() => _MyOverlaySampleState();
}

class _MyOverlaySampleState extends State<MyOverlaySample> {
  final int totalDays = 10;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 60,
          height: 200,
          child: PageView.builder(
            itemCount: totalDays,
            scrollDirection: Axis.vertical,
            onPageChanged: (int index) {
              showMessageOverlay(context: context, message: '選択された日: ${index + 1}');
            },
            itemBuilder: (BuildContext context, int index) {
              return CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.3),
                child: Text('${index + 1}', style: const TextStyle(fontSize: 12, color: Colors.black)),
              );
            },
          ),
        ),
      ),
    );
  }
}
