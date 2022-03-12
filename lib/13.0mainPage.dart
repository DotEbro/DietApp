import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '13.1Home.dart';
import '13.2Activity.dart';
import '13.3Recipe.dart';
import '13.4Account.dart';

class page13 extends StatefulWidget {
  const page13({Key? key}) : super(key: key);

  @override
  _page13State createState() => _page13State();
}

class _page13State extends State<page13> {

  final screen = [
    HomePage(),
    ActivityPage(),
    RecipePage(),
    ProfilePage()
  ];

  int Index = 0;

  // DateTime date = DateTime.now();
  // String _date = "Today";
  // int Day = 0;
  // int month = 0;
  // int dayInThisMonth = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Day = date.day;
  //   month = date.month;
  //   var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
  //   var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
  //   dayInThisMonth = firstDayNextMonth.difference(firstDayThisMonth).inDays;
  // }

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home, size: 30, color: Color(0xFF1A1728),),
      Icon(Icons.equalizer_rounded, size: 30, color: Color(0xFF1A1728),),
      Icon(Icons.fastfood, size: 30, color: Color(0xFF1A1728),),
      Icon(Icons.person, size: 30, color: Color(0xFF1A1728),)
    ];

    Future<bool?> showWarning(BuildContext context) async{
      return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Do you want to exit app?", 
            style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black54,
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                "Yes",
                style: TextStyle(
                    color: Color(0xFF07D7B7),
                    fontSize: 22
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  "No",
                  style: TextStyle(
                    color: Color(0xFF07D7B7),
                    fontSize: 22
                  ),
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        )
      );
    };

    return WillPopScope(
      onWillPop: () async{
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFF1A1728),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF2D2943),
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Georgia_Regular",
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: screen[Index],
        bottomNavigationBar: CurvedNavigationBar(
          index: Index,
          buttonBackgroundColor: Colors.white,
          color: Color(0xFF07D7B7),
          backgroundColor: Colors.transparent,
          items: items,
          height: 70,
          onTap: (index){
            setState(() {
              this.Index = index;
            });
          },
        ),
      ),
    );
  }
  // Widget FoodPage({index, time, image}) {
  //   return AspectRatio(
  //     aspectRatio: 1 / 1,
  //     child: InkWell(
  //       child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             image: DecorationImage(
  //                 image: AssetImage(image),
  //                 fit: BoxFit.cover
  //             )
  //         ),
  //         child: Container(
  //           padding: EdgeInsets.all(20),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               gradient: LinearGradient(
  //                   begin: Alignment.bottomRight,
  //                   colors: [
  //                     Colors.black.withOpacity(.8),
  //                     Colors.black.withOpacity(.03),
  //                   ]
  //               )
  //           ),
  //           child: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Text(
  //               time,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 30,
  //                 fontFamily: "NoyhR_regular",
  //                 fontWeight: FontWeight.bold
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       onTap: (){
  //         setState(() {
  //
  //         });
  //       },
  //     ),
  //   );
  // }
}

// class Circular_arc extends StatefulWidget {
//   const Circular_arc({Key? key}) : super(key: key);
//
//   @override
//   _Circular_arcState createState() => _Circular_arcState();
// }
//
// class _Circular_arcState extends State<Circular_arc>
//     with SingleTickerProviderStateMixin {
//   Animation<double>? animation;
//   late AnimationController animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
//     final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubic);
//     animation = Tween<double>(begin: 0.0, end: 3.14 / 2).animate(curvedAnimation)..addListener(() {
//           setState(() {});
//         });
//     /*
//         (eat_Cal / total_Cal) * 100 = percentage_Cal
//         (percentage_Cal * 3.14) / 100 = end
//     */
//     //animationController.repeat(reverse: false);
//     animationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Stack(
//       children: [
//         CustomPaint(
//           size: Size(230, 150),
//           painter: ProgressArc(null, false, Colors.black12),
//         ),
//         CustomPaint(
//           size: Size(230, 150),
//           painter: ProgressArc(animation?.value, false, Colors.white),
//         ),
//         Positioned(
//             top: 25,
//             left: 40,
//             child: Column(
//               children: [
//                 Text(
//                   "1798", //${}%",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 60,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "NoyhR_Bold"),
//                   textAlign: TextAlign.center,
//                 ),
//                 Container(
//                   width: 150,
//                   height: 1,
//                   color: Colors.black,
//                 ),
//                 Text(
//                   "1798",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 25,
//                       fontFamily: "NoyhR_Bold"),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   "Calories left",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                       fontFamily: "Georgia_Regular"),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ))
//       ],
//     ));
//   }
// }
//
// class ProgressArc extends CustomPainter {
//   bool isBackground;
//   double? arc;
//   Color progressColor;
//   ProgressArc(this.arc, this.isBackground, this.progressColor);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTRB(0, 0, 230, 230);
//     final startAngle = -pi;
//     final sweepAngle = arc != null ? arc : pi;
//     final userCenter = false;
//     final paint = Paint()
//       ..strokeCap = StrokeCap.round
//       ..color = progressColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 20;
//
//     if (isBackground) {}
//     canvas.drawArc(rect, startAngle, sweepAngle!, userCenter, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
