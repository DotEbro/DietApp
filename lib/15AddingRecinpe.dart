import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class AddingRecipe extends StatefulWidget {
  final image;
  final recipeName;
  final cal;
  final fats;
  final protein;
  final carbs;
  final nutritionList;
  const AddingRecipe({Key? key,
    required this.image,
    required this.recipeName,
    required this.cal,
    required this.fats,
    required this.protein,
    required this.carbs,
    required this.nutritionList
  }) : super(key: key);

  @override
  State<AddingRecipe> createState() => _AddingRecipeState();
}

class _AddingRecipeState extends State<AddingRecipe> {

  String? timing;
  final timingList = ["BreakFast", "Lunch", "Dinner", "Snacks"];
  String? serving;
  final servingList = ["1.0", "1.5", "2.0", "2.5", "3.0"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1728),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF2D2943),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.recipeName,
                  style: TextStyle(
                    color: Color(0xFF07D7B7),
                    fontFamily: "NoyhR_regular",
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                centerTitle: true,
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.fill
                    )
                  ),
                )
                    //child: Image.asset("images/Dinner.jpg")),
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    icon: Icon(Icons.close, color: Colors.black,)
                )
              ],
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                 [
                   Container(
                      height: 222,
                      color: Color(0xFF1A1728),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF07D7B7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          (widget.cal).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          "Calories",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          (widget.fats).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          "Fats",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          (widget.protein).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          "Protein",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          (widget.carbs).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          "Carbs",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Serving",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 74,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFF383647),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            dropdownColor: Color(0xFF383647),
                                            borderRadius: BorderRadius.circular(20),
                                            value: serving,
                                            iconSize: 30,
                                            icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                                            isExpanded: true,
                                            items: servingList.map(buildMenuItem).toList(),
                                            onChanged: (value) => setState(() => this.serving = value!),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Timing",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 230,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFF383647),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            dropdownColor: Color(0xFF383647),
                                            borderRadius: BorderRadius.circular(20),
                                            value: timing,
                                            iconSize: 30,
                                            icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                                            isExpanded: true,
                                            items: timingList.map(buildMenuItem).toList(),
                                            onChanged: (value) => setState(() => this.timing = value!),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // GestureDetector(
                                  //   onTap: () => setState(() {
                                  //     isDropDown = !isDropDown;
                                  //   }),
                                  //   child: Container(
                                  //     height: 50,
                                  //     width: 230,
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       color: Color(0xFF383647),
                                  //     ),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Padding(
                                  //           padding: const EdgeInsets.symmetric(horizontal: 10),
                                  //           child: Text(
                                  //             "Select Time",
                                  //             style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 20
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Icon(
                                  //           isDropDown ? Icons.arrow_upward : Icons.arrow_downward,
                                  //           color: Colors.white,
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Nutrition Facts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "NoyhR_Bold"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                 ]
              )
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Tile(widget.nutritionList[index]);
                },
                childCount: widget.nutritionList.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 35,),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: RaisedButton(
          color: Color(0xFF07D7B7),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {},//=> setState(() {Navigator.of(context).pop(false);}),
          child: Text(
            "Add",
            style: TextStyle(
              color: Color(0xFF1A1728),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "NoyhR_regular",
            ),
          ),
        ),
        // size: Size.fromHeight(70),
        // child: FloatingActionButton(
        //   backgroundColor: Color(0xFF07D7B7),
        //   onPressed: () =>setState(() {Navigator.of(context).pop(false);}),
        //   child: Text(
        //     "Back",
        //     style: TextStyle(
        //       color: Colors.white,//Color(0xFF07D7B7),
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: "NoyhR_regular",
        //     ),
        //   ),
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item){
    return DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          item,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget Tile(Tuple2 nList){
    return Container(
      color: Color(0xFF1A1728),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        title: Text(
          nList.item1,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        trailing: Text(
          nList.item2,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }

  static const List<Tuple2> nutritionList = [
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
    const Tuple2<String, String>("Nutrition", "48.4g"),
  ];
}

// class FoodInformation extends StatefulWidget {
//   final nutrition;
//   final grams;
//   const FoodInformation({Key? key, required this.nutrition, required this.grams}) : super(key: key);
//
//   @override
//   State<FoodInformation> createState() => _FoodInformationState();
// }

// class _FoodInformationState extends State<FoodInformation> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class FoodInformation {
//   final nutrition;
//   final grams;
//
//   const FoodInformation({
//     required this.nutrition,
//     required this.grams,
//   });
//
// }
//
// const nutritionList = const [
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
//   FoodInformation(nutrition: "nutrition", grams: "45.8g"),
// ];
