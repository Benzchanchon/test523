import 'package:flutter/material.dart';
import 'package:test523/game.dart';

class gamepage extends StatefulWidget {
  @override
  State<gamepage> createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  @override
  final _controller = TextEditingController(); //เก็บค่าที่ใส่มา
  var showTest = false;

  final _game = Game();
  var _feeblackText = "";

  void handleClickGuess() {
    setState(() {
      //showTest = !showTest; //เปลี่ยนshowTestเป็นตรงข้าม
    });
    print('button click');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      print('ERROR');
      setState(() {
        //เปลี่ยนแปลงตัวแปรระดับคลาส
        _feeblackText = "Error";
        showTest = false;
      });
      //error
    } else {
      var result = _game.doGuess(
          guess); //สร้างตัวแปร์resultเก็บguessที่ส่งไปทำเมธอดdoGuessในไฟล์game
      if (result == Result.tooHigh) {
        print('Hight');
        setState(() {
          _feeblackText = "Too higt";
          showTest = false;
        });
      } else if (result == Result.tooLow) {
        print('LOW');
        setState(() {
          _feeblackText = "Too low";
          showTest = false;
        });
      } else {
        print('NICE');
        print('NICE');
        setState(() {
          _feeblackText = "Correct";
          showTest = true;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("555")), //ส่วนบน
      body: Center(
        //ส่วนกลาง
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //จัดไปตรงกลาง หลัง.คือบอกตำแหน่ง
          children: [
            Text('เกม'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number', //ข้อความข้างใน
              ),
            ),
            ElevatedButton(
              onPressed: handleClickGuess, //เมื่อกดปุ่มให้นำไปผูกกับคลาส
              child: Text("TRY"), //ข้อความบนปุ่ม
            ),
            Text(_feeblackText),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: showTest? Colors.green : Colors.deepOrange //ถ้าเป็นtrueจะเป็นเขียวถ้าfalseเป็นแดง
              ),
              onPressed: (){},
              child: Text('Test'),
            ),
            Icon(showTest? Icons.ac_unit_sharp:Icons.add_a_photo_outlined), //เปลี่ยนไอคอน
          ],
        ),
      ),
    );
  }
}
