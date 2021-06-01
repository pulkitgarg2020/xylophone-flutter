import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// 1. arrow => equivalent to a function between { }
// 2. => arrow syntax - fat arrow
// 3. can be used with functions that just have single line of return
void main() => runApp(XylophoneApp());

// 1. Flutter packages are open source codes that you can use
//    to implement a functionality
// 2. english_words: ^4.0.0 - so that anytime the version updates
//    it will take anything in 4.0 range
// 3. Audio player already assumes that your files are in a folder
//    called Assets
class XylophoneApp extends StatelessWidget {
  // function to play a particular note
  void playSound(int soundNum) {
    final player = AudioCache();
    player.play('note$soundNum.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orangeAccent, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.teal, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }

  // 1. to have named parameters you need to enclose them in
  //    curly brackets
  // 2. Converted this to an arrow syntax since it just has
  //    one return statement
  Expanded buildKey({int soundNumber, Color color}) => Expanded(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: color),
          onPressed: () {
            playSound(soundNumber);
          },
        ),
      );
}
