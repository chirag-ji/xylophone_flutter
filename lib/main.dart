import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Xylophone',
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: XylophoneApp(),
      ),
    ),
  ));
}

class XylophoneApp extends StatelessWidget {
  static AudioCache player = AudioCache();

  static void playNote(int noteNum) {
    player.play('note$noteNum.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Tile(Colors.red, 1),
        Tile(Colors.orange, 2),
        Tile(Colors.yellow, 3),
        Tile(Colors.green, 4),
        Tile(Colors.teal, 5),
        Tile(Colors.blue, 6),
        Tile(Colors.purple, 7),
      ],
    );
  }
}

class Tile extends StatelessWidget {
  final Color color;
  final int noteNum;

  const Tile(this.color, this.noteNum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(this.color),
        ),
        onPressed: () => XylophoneApp.playNote(this.noteNum),
        child: SizedBox(),
      ),
    );
  }
}
