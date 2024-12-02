import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {
  late stt.SpeechToText speech;

  bool isListening = false;

  String text = "Press the button and start speaking!";

  String languageCode = "en_US";
  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (status) {
          if (kDebugMode) {
            print("Status: $status");
          }
        } ,
        onError: (error) {
          setState(() {
            text = "sorry couldn't recognize";
          });
        },
      );
      if (available) {
        setState(() => isListening = true);
        speech.listen(
          onResult: (result) {
            setState(() {
              text = result.recognizedWords;
            });
          },
          localeId: languageCode,

        );
      }
    } else {
      speech.stop();
      setState(() => isListening = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Recognition'),
        actions: [
          DropdownButton<String>(
            style:  const TextStyle(color: Colors.black),
            hint: Text(languageCode=="en_US"?"English":"Arabic",style: const TextStyle(color: Colors.black),),

            items: <String>['English', 'Arabic',].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: const TextStyle(color: Colors.black),),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                value=="English"?languageCode="en_US":languageCode="ar_SA";
              });
            },
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: listen,
        child: Icon(isListening ? Icons.mic : Icons.mic_none),
      ),
      body: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
