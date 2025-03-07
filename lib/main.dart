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
      title: 'PageView + Overlay (Below & Center)',
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

  final GlobalKey _pageViewKey = GlobalKey();

  ///
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => showMessageOverlay(context: context, targetKey: _pageViewKey, message: '初期表示時の Overlay'));
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          key: _pageViewKey,
          width: 60,
          height: 200,
          color: Colors.grey.withOpacity(0.2),
          child: PageView.builder(
            itemCount: totalDays,
            scrollDirection: Axis.vertical,
            onPageChanged: (int index) {
              showMessageOverlay(
                context: context,
                targetKey: _pageViewKey,

                message: '選択された日: ${index + 1}',
                // overlayWidth: 180.0,  // デフォルト値でもOK
              );
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
