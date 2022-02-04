import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        children: [
          _itemWeb("assets/images/food2.jpeg", "Cake ", "Uzbekistan",
              "Tashkent", 4.5),
          _itemWeb(
              "assets/images/food1.jpeg", "Burger ", "Italy", "Valencia", 1.5),
          _itemWeb(
              "assets/images/food3.jpeg", "Pizza ", "Canada", "Ottawa", 5.0),
          _itemWeb("assets/images/food4.jpeg", "Egg and Avocado ", "USE",
              "Seattle", 3.0),
          _itemWeb(
              "assets/images/food5.jpeg", "Fish Stack ", "UK", "London", 4.5),
          _itemWeb("assets/images/food6.jpeg", "Big Burger ", "Australia",
              "Sidney", 1.0),
          _itemWeb("assets/images/food7.jpeg", "Fruit Cake ", "Chexiya",
              "Praga", 2.5),
          _itemWeb("assets/images/food5.jpeg", "Fish", "UK", "Seattle", 3.0),
          _itemWeb("assets/images/food3.jpeg", "Pizza ", "UK", "Seattle", 5.0),
          _itemWeb("assets/images/food2.jpeg", "Cake ", "UK", "Seattle", 4.0),
          _itemWeb("assets/images/food4.jpeg", "Salad ", "UK", "Seattle", 2.0),
          _itemWeb("assets/images/food8.jpeg", "Asorti ", "UK", "Seattle", 3.5)
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 4,
        ),
      ),
    );
  }

  // GridView.builder(
  //         gridDelegate:
  //             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  //         itemCount: 30,
  //         itemBuilder: (BuildContext context, int index) {
  //           return ListView(
  //             children: [
  //               _itemWeb("assets/images/food2.jpeg", "Cake ", "Uzbekistan",
  //                   "Tashkent", 4.5),
  //               _itemWeb("assets/images/food1.jpeg", "Burger ", "Italy",
  //                   "Valencia", 1.5),
  //               _itemWeb("assets/images/food3.jpeg", "Pizza ", "Canada", "Ottawa",
  //                   5.0),
  //               _itemWeb("assets/images/food4.jpeg", "Egg and Avocado ", "USE",
  //                   "Seattle", 3.0),
  //               _itemWeb("assets/images/food5.jpeg", "Fish Stack ", "UK",
  //                   "London", 4.5),
  //               _itemWeb("assets/images/food6.jpeg", "Big Burger ", "Australia",
  //                   "Sidney", 1.0),
  //               _itemWeb("assets/images/food7.jpeg", "Fruit Cake ", "Chexiya",
  //                   "Praga", 2.5),
  //               _itemWeb(
  //                   "assets/images/food5.jpeg", "Fish", "UK", "Seattle", 3.0),
  //               _itemWeb(
  //                   "assets/images/food3.jpeg", "Pizza ", "UK", "Seattle", 5.0),
  //               _itemWeb(
  //                   "assets/images/food2.jpeg", "Cake ", "UK", "Seattle", 4.0),
  //               _itemWeb(
  //                   "assets/images/food4.jpeg", "Salad ", "UK", "Seattle", 2.0),
  //               _itemWeb(
  //                   "assets/images/food8.jpeg", "Asorti ", "UK", "Seattle", 3.5)
  //             ],
  //           );
  //         },
  //       )

  Widget _itemWeb(String image, String name, String country, String location,
      double rating) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RatingBar(
                          ignoreGestures: true,
                          itemSize: 25,
                          initialRating: rating,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              ),
                              empty: const Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              )),
                          onRatingUpdate: (rating) {}),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(country,
                              style: TextStyle(color: Colors.grey.shade600)),
                          SizedBox(width: 3),
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          Text(location,
                              style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      )
                    ],
                  ),
                  const Text(
                    "\$\$\$",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
