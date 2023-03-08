import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensor/edge_detector.dart';
import 'package:sensor/record_sensor.dart';
import 'package:sensor/speech_to_text.dart';

import 'internet_check.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: const Center(child: Text('Main Screen')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const SpeechScreen());
                },
                child: const Text('SpeechScreen')),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(InternetConnectionSystem());
              },
              child: const Text('InternetConnectionSystem')),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const EdgeDetectorScreen());
              },
              child: const Text('EdgeDetectorScreen')),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const MicPage());
              },
              child: const Text('Record Sounds')),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
