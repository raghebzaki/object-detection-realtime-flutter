import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection_realtime_flutter/features/home/presentation/widgets/card_item.dart';

import '../../../object_detection/presentation/pages/object_detection.dart';
import '../../../speech_to_text/presentation/pages/speech_to_text_page.dart';


class HomeView extends StatelessWidget {
  final List<CameraDescription> cameras;

  const HomeView({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Choose Your Feature"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardItem(
              context: context,
              title: "Object Detection",
              icon: Icons.camera_alt_outlined,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RealTimeObjectDetection(cameras: cameras),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardItem(
              context: context,
              title: "Speech to Text",
              icon: Icons.mic_outlined,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SpeechToTextPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
