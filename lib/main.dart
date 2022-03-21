import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/2Weight.dart';
import '13.0mainPage.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: page13()
));


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1728),
      appBar: AppBar(
        title: const Text('Welcome to Dieto'),
        backgroundColor: const Color(0xFF2D2943),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: const Text(
                  'It took five minute to consume 500 Calories. It take'
                      ' two hours to burn them off.',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Image.asset('images/logo.png', width: 200, height: 200,),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: const Text(
                  'Welcome to the Dieto app, where you can manage your'
                      ' body fitness and also manage your daily diet. At first you can enter'
                      ' the width, height age and sex and this app calculate the calories'
                      ' that you can consume per day.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            Center(
              child: SizedBox(
                width: 330,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => page2())
                    );
                  },
                  child: const Text('Ready',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  color: const Color(0xFF07D7B7),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account? ",
                      children: [
                        TextSpan(text: 'Sign in',
                            style: const TextStyle(color: Colors.indigo),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              })
                      ]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}