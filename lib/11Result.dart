import 'dart:math';
import 'package:flutter/material.dart';
import '12FinishingUp.dart';

class page11 extends StatefulWidget {
  int Calories;
  int height;
  int age;
  int weight;
  String gender;
  String goal;
  page11({
    Key? key,
    required this.Calories,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
  }) : super(key: key);

  @override
  _page11State createState() => _page11State();
}

class _page11State extends State<page11> {

  int protein = 0;
  int fats = 0;
  int carbs = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1A1728),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1728),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Center(
                child: Text(
                  "Your daily goal recommendation",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: const Text(
                  "Based on your setting, we calculated the optimal"
                      " plan for you to achieve your goal!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Circular_arc(cal: widget.Calories),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Text(
                  "The percentage of fats are 70, protein 25 and carbs are 5."
                      " The ingredients which you will consume the are given "
                      "below in grams.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 65,),
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 65,),
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[700],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ((widget.Calories * 0.7)~/9).toString() + " g\nFat",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 50,),
                  Text(
                    ((widget.Calories * 0.25)~/4).toString() + " g\nProtein",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 50,),
                  Text(
                    ((widget.Calories* 0.05)~/4).toString() + " g\nCarbs",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Center(
                child: Text(
                  "Your Goal is to " + widget.goal,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20,),
              showGoal(widget.goal),
              SizedBox(height: 70,),
              Center(
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        calculate();
                      });
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Page12(
                                  weight: widget.weight,
                                  height: widget.height,
                                  age: widget.age,
                                  gender: widget.gender,
                                  goal: widget.goal,
                                  protein: protein,
                                  fats: fats,
                                  carbs: carbs,
                                  cal: widget.Calories,
                                )));
                    },
                    child: const Text('Start Tracking',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    color: const Color(0xFF07D7B7),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  calculate(){
    protein = ((widget.Calories * 0.25)~/4).toInt();
    fats = ((widget.Calories * 0.7)~/9).toInt();
    carbs = ((widget.Calories * 0.05)~/4).toInt();
  }

  showGoal(String l_m_g) {
    if(l_m_g == "Lose weight"){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
        child: Text(
          "We have minus 15% of Calories from the resultant for the weight loss.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    if(l_m_g == "Maintain weight"){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
        child: Text(
          "We have calculated the protein about 0.8 ratio of the Calories.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    if(l_m_g == "Gain weight"){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
        child: Text(
          "We have add 18% of Calories to the resultant for you to gain weight.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}

class Circular_arc extends StatefulWidget {
  int? cal;
  Circular_arc({Key? key, required this.cal}) : super(key: key);

  @override
  _Circular_arcState createState() => _Circular_arcState();
}

class _Circular_arcState extends State<Circular_arc> with SingleTickerProviderStateMixin {

  Animation<double>? animationGreen;
  Animation<double>? animationPink;
  Animation<double>? animationOrange;
  late AnimationController animationController;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2),vsync: this);
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubic);
    animationGreen = Tween<double>(begin: 0.0, end: 3.14).animate(curvedAnimation)..addListener(() {
      setState(() {});
    });
    animationPink = Tween<double>(begin: 0.0, end:  3.14 - ((3.14 * 5) / 100)).animate(curvedAnimation)..addListener(() {
      setState(() {});
    });
    animationOrange = Tween<double>(begin: 0.0, end: 3.14 - ((3.14 * 25) / 100)).animate(curvedAnimation)..addListener(() {
      setState(() {});
    });
    /*
        (eat_Cal / total_Cal) * 100 = percentage_Cal
        (percentage_Cal * 3.14) / 100 = end
    */
    //animationController.repeat(reverse: false);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(250,200),
              painter: ProgressArc(animationGreen?.value, false, (Colors.lightGreen[700])!),
            ),
            CustomPaint(
              size: Size(250,200),
              painter: ProgressArc(animationPink?.value, false, Colors.pink),
            ),
            CustomPaint(
              size: Size(250,200),
              painter: ProgressArc(animationOrange?.value, false, (Colors.orange[300])!),
            ),
            Positioned(
                top: 30,
                left: 60,
                child: Text("${(widget.cal)}",
                  style: TextStyle(fontSize: 60, color: Color(0xFF07D7B7)),
                  textAlign: TextAlign.center,
                ),
            ),
            Positioned(
              top: 100,
              left: 63,
              child: Text("Calories Per Day",//${}%",
                style: TextStyle(fontSize: 18, color: Color(0xFF07D7B7)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
    );
  }
}

class ProgressArc extends CustomPainter{

  bool isBackground;
  double? arc;
  Color progressColor;
  ProgressArc(this.arc, this.isBackground, this.progressColor);

  @override
  void paint(Canvas canvas, Size size){
    final rect = Rect.fromLTRB(0, 0, 250, 250);
    final startAngle = -pi;
    final sweepAngle = arc != null ? arc : pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

    if(isBackground){
    }
    canvas.drawArc(rect, startAngle, sweepAngle!, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }
}