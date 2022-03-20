import 'package:flutter/material.dart';
import 'package:app/0Pictures.dart';

class RecipePage extends StatefulWidget {
  RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1728),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          children: [
            Container(
              width: 350,
              height: 50,
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF383647),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "Search...",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "NoyhR_regular",
                      fontSize: 22
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.list,
                    color: Colors.white,
                    size: 33,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: GridView.count(
                  //scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: foodList.map((recipie) => FoodPage(
                    recipie.index,
                    recipie.cal,
                    recipie.image,
                    recipie.name
                  )).toList(),
                  // children: [
                  //   FoodPage(index: 1, time: "Aloo Gobi", image: "images/aloo-gobi.jpg"),
                  //   FoodPage(index: 2, time: "Aloo Palak", image: "images/aloo-palak.jpg"),
                  //   FoodPage(index: 3, time: "Balochi Tikka", image: "images/Balochi-tikka.jpg"),
                  //   FoodPage(index: 4, time: "Chai", image: "images/Chai.jpg"),
                  //   FoodPage(index: 5, time: "Channa Dal", image: "images/Channa-Dal.jpg"),
                  //   FoodPage(index: 6, time: "Chapli Kabab", image: "images/Chapli-Kabab.jpg"),
                  //   FoodPage(index: 7, time: "Chicken Baryani", image: "images/Chicken-Baryani.jpg"),
                  //   FoodPage(index: 8, time: "Chicken Chargha", image: "images/Chicken-Chargha.jpg"),
                  //   FoodPage(index: 9, time: "Chicken Kofta", image: "images/Chicken-Kofta.jpg"),
                  //   FoodPage(index: 10, time: "Chicken Korama", image: "images/Chicken-Korma.jpg"),
                  //   FoodPage(index: 11, time: "Malai Tikka", image: "images/Chicken-Malai-Tikka.jpg"),
                  //   FoodPage(index: 12, time: "Chicken Slider", image: "images/Chicken-Parmesan-Slider-Bake.jpg"),
                  //   FoodPage(index: 13, time: "Chicken Tikka", image: "images/Chicken-Tikka-Leg-Recipe.jpg"),
                  //   FoodPage(index: 14, time: "Pudding", image: "images/Chocolate-Biscuit-Pudding.jpg"),
                  //   FoodPage(index: 15, time: "Cookies", image: "images/chocolate_chip_cookies1.jpg"),
                  //   FoodPage(index: 16, time: "Egg Sandwich", image: "images/Egg-Sandwich.jpg"),
                  //   FoodPage(index: 17, time: "Eggs", image: "images/eggs.jpg"),
                  //   FoodPage(index: 18, time: "Tortellini", image: "images/Fried-Prosciutto-Tortellini.jpg"),
                  //   FoodPage(index: 19, time: "Gajar Halwa", image: "images/gajar-halwa.jpg"),
                  //   FoodPage(index: 20, time: "Peach Pizza", image: "images/Grilled-Tomato-Peach-Pizza.jpg"),
                  //   FoodPage(index: 21, time: "Ham-n-Chesse", image: "images/Ham-n-Cheese-Biscuit-Stacks.jpg"),
                  //   FoodPage(index: 22, time: "Artichoke", image: "images/Hot-Artichoke-Spinach-Dip.jpg"),
                  //   FoodPage(index: 23, time: "Keema Naan", image: "images/keema-naan.jpg"),
                  //   FoodPage(index: 24, time: "Lab-e-Shireen", image: "images/lab-e-shireen.jpg"),
                  //   FoodPage(index: 25, time: "Mango Kulfi", image: "images/mango-kulfi.jpg"),
                  //   FoodPage(index: 26, time: "Masoor Daal", image: "images/Masoor-Daal.jpg"),
                  //   FoodPage(index: 27, time: "Nan Khatai", image: "images/nan-khatai.jpg"),
                  //   FoodPage(index: 28, time: "Glazed Meatballs", image: "images/Orange-Glazed-Meatballs.jpg"),
                  //   FoodPage(index: 29, time: "Chowmein", image: "images/Pakistani-chowmein-noodle.jpg"),
                  //   FoodPage(index: 30, time: "Pancakes", image: "images/pancakes.jpg"),
                  //   FoodPage(index: 31, time: "Parata", image: "images/parata.jpg"),
                  //   FoodPage(index: 32, time: "Rice Kherr", image: "images/Rice-Kheer.jpg"),
                  //   FoodPage(index: 33, time: "Sarsoon Saag", image: "images/Sarsoon-ka-saag.jpg"),
                  //   FoodPage(index: 34, time: "Seekh Kabab", image: "images/seekh-kaba.jpg"),
                  //   FoodPage(index: 35, time: "Shahi Tukda", image: "images/shahi-tukda.jpg"),
                  //   FoodPage(index: 36, time: "Sooji Halwa", image: "images/sooji-halwa.jpg"),
                  //   FoodPage(index: 37, time: "Teriyaki Meatballs", image: "images/Teriyaki-Meatballs.jpg"),
                  //   FoodPage(index: 38, time: "Tuscan Bean", image: "images/Tuscan-Sausage-Bean-Dip.jpg"),
                  //   FoodPage(index: 39, time: "Yakhni Pulao", image: "images/Yakhni-Pulao.jpg"),
                  // ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}

class FoodPage extends StatelessWidget {
  final index;
  final cal;
  final image;
  final name;
  FoodPage(this.index, this.cal, this.image, this.name);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "NoyhR_regular",
                  ),
                ),
                Text(
                  cal.toString(),
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                    fontFamily: "NoyhR_regular",
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: (){

        },
      ),
    );
  }
}


