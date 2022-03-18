import 'package:app/0AppDataBase.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1728),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipShadowPath(
                    shadow: BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0,4),
                        blurRadius: 4,
                        spreadRadius: 4
                    ),
                    clipper: CustomClipPath(),
                    child: Container(
                      color: Color(0xFF383647),
                      height: 250,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.95, 0.1),
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                image: AssetImage("images/body1.jpg"),
                                fit: BoxFit.cover,
                                width: 140,
                                height: 140,
                                child: InkWell(
                                  onTap: (){},
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: buildCircle(
                              color: Colors.white,
                              all: 2,
                              child: buildCircle(
                                color: Color(0xFF07D7B7),
                                all: 8,
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Abrar Khan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      fontFamily: "NoyhR_regular",
                      color: Colors.white
                  ),
                ),
              ),
              Center(
                child: Text(
                  "abrarkhan@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey[400],
                      fontFamily: "Georgia_Regular"
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        buildText(title: "70", size: 30, color: Color(0xFF07D7B7)),
                        buildText(title: "Weight(kg)", size: 18, color: Colors.grey),
                      ],
                    ),
                    Container(height: 60, width: 2, color: Colors.white,),
                    Column(
                      children: [
                        buildText(title: "170", size: 30, color: Color(0xFF07D7B7)),
                        buildText(title: "Height(cm)", size: 18, color: Colors.grey),
                      ],
                    ),
                    Container(height: 60, width: 2, color: Colors.white,),
                    Column(
                      children: [
                        buildText(title: "21", size: 30, color: Color(0xFF07D7B7)),
                        buildText(title: "Age", size: 18, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Center(
                child: Text(
                  "2188",
                  style: TextStyle(
                      fontFamily: "Cambria_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Color(0xFF07D7B7)
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Calories Per Day",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        buildText(title: "165", size: 25, color: Color(0xFFFEC661)),
                        buildText(title: "Fats", size: 18, color: Colors.grey),
                      ],
                    ),
                    Container(height: 45, width: 1, color: Colors.white,),
                    Column(
                      children: [
                        buildText(title: "59", size: 25, color: Color(0xFFFC5C5C)),
                        buildText(title: "Protein", size: 18, color: Colors.grey),
                      ],
                    ),
                    Container(height: 45, width: 1, color: Colors.white,),
                    Column(
                      children: [
                        buildText(title: "25", size: 25, color: Color(0xFF70E620)),
                        buildText(title: "Carbs", size: 18, color: Colors.grey),
                      ],
                    ),
                    Container(height: 45, width: 1, color: Colors.white,),
                    Column(
                      children: [
                        buildText(title: "8", size: 25, color: Color(0xFF2C8CCB)),
                        buildText(title: "Water", size: 18, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
  );

  Widget buildText({
    required String title,
    required double size,
    required Color color
  }) => Text(
    title,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "Cambria_Regular",
    ),
  );
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipShadowPath({
    Key? key,
    required this.shadow,
    required this.clipper,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(child: child, clipper: clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadow.spreadRadius,
      );
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;

    final path = Path();
    
    // (0, 0) // 1. point
    path.lineTo(0, h - 100); // 2. point
    path.quadraticBezierTo(
        w * 0.5 , // 3 point
        h + 50, // 3 point
        w, // 4 point
        h - 100 // 4 point
    );
    path.lineTo(w, 0); // 5. Point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}
