import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

//new Class Lottery App
class lotteryApp extends StatefulWidget {
  @override
  State<lotteryApp> createState() => _lotteryAppState();
}

class _lotteryAppState extends State<lotteryApp> {
  int _number = 0;
  Random random = Random(); //generate a random number
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff845460),
        title: Text('Lottery App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Lottery winning number is 4',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.brown.shade50,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _number == 4
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 35,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                _number == 4
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 3),
                        child: Text(
                          'Congratulations you won this lottery your number is $_number \n',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 3),
                        child: Text(
                          'Better luck next time your number is $_number \n try again....!!',
                          textAlign: TextAlign.center,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff845460),
        onPressed: () {
          _number = random.nextInt(10);
          setState(() {});
        },
        child: _number == 4 ? Icon(Icons.done) : Icon(Icons.refresh),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => lotteryApp())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff845460),
        child: Center(
            child: Container(
          height: 200,
          width: 200,
          child: Image.asset('lib/images/logolottery.png'),
        )),
      ),
    );
  }
}
