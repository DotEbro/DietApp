import 'dart:math';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime date = DateTime.now();
  String _date = "Today";
  int Day = 0;
  int month = 0;
  int dayInThisMonth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Day = date.day;
    month = date.month;
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    dayInThisMonth = firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1728),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "Hi Abrar Khan,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "NoyhR_regular",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15,),
              child: Text(
                "Ready to lose some Calories today?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "NoyhR_regular",
                ),
              ),
            ),
            Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xAA5A4F46),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Fats",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0x77FEC661),
                                    ),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFFFEC661),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "45/89 g",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Protein",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0x77FC5C5C),
                                    ),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFFFC5C5C),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "45/89 g",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Carbs",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0x7770E620),
                                    ),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFF70E620),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "45/89 g",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30, left: 18, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Water",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0x772C8CCB),
                                    ),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFF2C8CCB),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "4/8 glass",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF07D7B7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Eaten",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Burned",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Circular_arc()),
                      ],
                    ),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
              child: Text(
                "Recipes Category",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: "Georgia_Regular",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FoodPage(index: 1, time: "BreakFast", image: "images/breakFast.jpg"),
                  SizedBox(width: 15,),
                  FoodPage(index: 2, time: "Lunch", image: "images/lunch.jpeg"),
                  SizedBox(width: 15,),
                  FoodPage(index: 3, time: "Dinner", image: "images/Dinner.jpg"),
                  SizedBox(width: 15,),
                  FoodPage(index: 4, time: "Appetizer", image: "images/appetizer.jpeg"),
                  SizedBox(width: 15,),
                  FoodPage(index: 5, time: "Desserts", image: "images/desserts.jpg"),
                  SizedBox(width: 15,),
                ],
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            //      child: GridView.count(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10,
            //         children: [
            //           FoodPage(index: 1, time: "BreakFast", image: "images/breakFast.jpg"),
            //           FoodPage(index: 2, time: "Lunch", image: "images/lunch.jpeg"),
            //           FoodPage(index: 3, time: "Dinner", image: "images/Dinner.jpg"),
            //           FoodPage(index: 4, time: "Appetizer", image: "images/appetizer.jpeg"),
            //           FoodPage(index: 5, time: "Desserts", image: "images/desserts.jpg"),
            //         ],
            //       ),
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }

  Widget FoodPage({index, time, image}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.03),
                    ]
                )
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                time,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "NoyhR_regular",
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        onTap: (){
          setState(() {

          });
        },
      ),
    );
  }
}


class Circular_arc extends StatefulWidget {
  const Circular_arc({Key? key}) : super(key: key);

  @override
  _Circular_arcState createState() => _Circular_arcState();
}

class _Circular_arcState extends State<Circular_arc>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubic);
    animation = Tween<double>(begin: 0.0, end: 3.14 / 2).animate(curvedAnimation)..addListener(() {
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
    return Container(child: Stack(
      children: [
        CustomPaint(
          size: Size(230, 150),
          painter: ProgressArc(null, false, Colors.black12),
        ),
        CustomPaint(
          size: Size(230, 150),
          painter: ProgressArc(animation?.value, false, Colors.white),
        ),
        Positioned(
            top: 25,
            left: 40,
            child: Column(
              children: [
                Text(
                  "1798", //${}%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: "NoyhR_Bold"),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 150,
                  height: 1,
                  color: Colors.black,
                ),
                Text(
                  "1798",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "NoyhR_Bold"),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Calories left",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Georgia_Regular"),
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    ));
  }
}

class ProgressArc extends CustomPainter {
  bool isBackground;
  double? arc;
  Color progressColor;
  ProgressArc(this.arc, this.isBackground, this.progressColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 230, 230);
    final startAngle = -pi;
    final sweepAngle = arc != null ? arc : pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    if (isBackground) {}
    canvas.drawArc(rect, startAngle, sweepAngle!, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}