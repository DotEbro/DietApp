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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Align(
            alignment: Alignment(0.9, 0.1),
            child: IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 40,
              )
            ),
          ),
          Center(
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
                    color: Color(0xFF1A1728),
                    all: 2,
                    child: buildCircle(
                      color: Color(0xFF07D7B7),
                      all: 10,
                      child: Icon(
                        Icons.add_a_photo,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
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
