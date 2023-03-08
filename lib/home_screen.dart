import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  double dx = 100, dy = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensor')),
      body: StreamBuilder<GyroscopeEvent>(
          stream: SensorsPlatform.instance.gyroscopeEvents,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              dx = dx + snapshot.data!.y;
              dy = dy + snapshot.data!.x;
            }
            return Transform.translate(
                offset: Offset(dx, dy),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amber,
                ));
          }),
    );
  }
}
