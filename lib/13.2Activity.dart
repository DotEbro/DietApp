import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {


  DateTime date = DateTime.now();
  String _date = "Today";
  int Day = 0;
  late int monthIndex;
  String currentMonth = "";
  int dayInThisMonth = 0;
  List Months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  List<Widget> adds = [];
  int glassOfWater = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Day = date.day;
    currentMonth = Months[date.month - 1];
    monthIndex = date.month - 1;
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    dayInThisMonth = firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1728),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70, 10, 70, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Ink(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 33,
                        onPressed: (){
                          setState(() {
                            Day = Day - 1;
                            if(Day == date.day && currentMonth == Months[date.month-1]){
                              _date = "Today";
                            }
                            else if(Day == (date.day-1) && currentMonth == Months[date.month-1]){
                              _date = "Yesterday";
                            }
                            else if(Day == (date.day+1) && currentMonth == Months[date.month-1]){
                              _date = "Tomorrow";
                            }
                            else if(Day < 1){
                              Day = dayInThisMonth;
                              monthIndex = monthIndex - 1;
                              _date = Day.toString();
                              currentMonth = Months[monthIndex];
                            }
                            else
                              _date = Day.toString();
                            print("Back " + _date);
                          });
                        },
                      ),
                    ),
                    Text(
                      _date + "-" + currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "NoyhR_regular",
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    Ink(
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        iconSize: 33,
                        onPressed: (){
                          setState(() {
                            Day = Day + 1;
                            if(Day == date.day && currentMonth == Months[date.month-1]){
                              _date = "Today";
                            }
                            else if(Day == (date.day+1) && currentMonth == Months[date.month-1]){
                              _date = "Tomorrow";
                            }
                            else if(Day == (date.day-1) && currentMonth == Months[date.month-1]){
                              _date = "Yesterday";
                            }
                            else if(Day > dayInThisMonth){
                              Day = 1;
                              monthIndex = monthIndex + 1;
                              _date = Day.toString();
                              currentMonth = Months[monthIndex];
                            }
                            else
                              _date = Day.toString();
                            print("Forward " + _date);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    height: 360,
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
                    height: 260,
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
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                width: 330,
                height: 85,
                decoration: BoxDecoration(
                  color: Color(0xFF242231),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Exercise",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NoyhR_regular",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "0 Cal",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NoyhR_regular",
                              color: Colors.grey[300],
                            ),
                          ),
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF07D7B7),
                          ),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' Add Exercise',
                                      style: TextStyle(color: Color(0xFF07D7B7),),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {

                                        }
                                  )
                                ]
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                width: 330,
                height: 85,
                decoration: BoxDecoration(
                    color: Color(0xFF242231),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Breakfast",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NoyhR_regular",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "0 Cal",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NoyhR_regular",
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF07D7B7),
                          ),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' Add Food',
                                      style: TextStyle(color: Color(0xFF07D7B7),),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        }
                                  )
                                ]
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                width: 330,
                height: 85,
                decoration: BoxDecoration(
                    color: Color(0xFF242231),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Lunch",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NoyhR_regular",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "0 Cal",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NoyhR_regular",
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF07D7B7),
                          ),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' Add Food',
                                      style: TextStyle(color: Color(0xFF07D7B7),),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        }
                                  )
                                ]
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                width: 330,
                height: 85,
                decoration: BoxDecoration(
                    color: Color(0xFF242231),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Dinner",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NoyhR_regular",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "0 Cal",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NoyhR_regular",
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF07D7B7),
                          ),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' Add Food',
                                      style: TextStyle(color: Color(0xFF07D7B7),),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        }
                                  )
                                ]
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                width: 330,
                height: 85,
                decoration: BoxDecoration(
                    color: Color(0xFF242231),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Snack",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NoyhR_regular",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "0 Cal",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NoyhR_regular",
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF07D7B7),
                          ),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' Add Food',
                                      style: TextStyle(color: Color(0xFF07D7B7),),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        }
                                  )
                                ]
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                width: 330,
                height: 150,
                decoration: BoxDecoration(
                    color: Color(0xFF242231),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Water",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NoyhR_regular",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            glassOfWater.toString() + " Cups",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NoyhR_regular",
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 5,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: glassOfWater,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return waterGlass;
                          },
                          //children: adds,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 290,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xFF07D7B7),
                            ),
                            // GestureDetector(
                            //   child: Chip(
                            //     label: Text(
                            //       " Add Water",
                            //       style: TextStyle(color: Color(0xFF07D7B7),),
                            //     ),
                            //   ),
                            //   onTap: (){
                            //     setState(() {
                            //       adds.add(waterGlass);
                            //       glassOfWater++;
                            //     });
                            //   },
                            // )
                            // RichText(
                            //   text: TextSpan(
                            //     children: [
                            //       TextSpan(
                            //         text: ' Add Water',
                            //         style: TextStyle(color: Color(0xFF07D7B7),),
                            //         recognizer: TapGestureRecognizer()
                            //           ..onTap = () {
                            //             setState(() {
                            //               adds.add(waterGlass);
                            //               glassOfWater++;
                            //             });
                            //           }
                            //       )
                            //     ]
                            //   ),
                            // ),
                            Text(
                              " Add Water",
                              style: TextStyle(color: Color(0xFF07D7B7),),
                            )
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            adds.add(waterGlass);
                            glassOfWater++;
                          });
                        }
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget waterGlass = Container(
    child: Image.asset("images/water.png")
  );


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