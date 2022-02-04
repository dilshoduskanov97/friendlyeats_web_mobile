import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);
  static const String id = "mobile_page";

  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  final List _list = [
    ["assets/images/food2.jpeg", "Cake ", "Uzbekistan", "Tashkent", 4.5],
    ["assets/images/food1.jpeg", "Burger ", "Italy", "Valencia", 1.5],
    ["assets/images/food3.jpeg", "Pizza ", "Canada", "Ottawa", 5.0],
    ["assets/images/food4.jpeg", "Egg and Avocado ", "USE", "Seattle", 3.0],
    ["assets/images/food5.jpeg", "Fish Stack ", "UK", "London", 4.5],
    ["assets/images/food6.jpeg", "Big Burger ", "Australia", "Sidney", 1.0],
    ["assets/images/food7.jpeg", "Fruit Cake ", "Chexiya", "Praga", 2.5],
    ["assets/images/food8.jpeg", "Asorti ", "UK", "Seattle", 3.5],
    ["assets/images/food5.jpeg", "Fish", "UK", "Seattle", 3.0],
    ["assets/images/food3.jpeg", "Pizza ", "UK", "Seattle", 5.0],
    ["assets/images/food2.jpeg", "Cake ", "UK", "Seattle", 4.0],
    ["assets/images/food4.jpeg", "Salad ", "UK", "Seattle", 2.0],
    ["assets/images/food8.jpeg", "Asorti ", "UK", "Seattle", 3.5]
  ];

  List<int> _sortList = [4, 3, 2, 1, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.restaurant),
        title: const Text(
          "FriendlyEats",
          style: TextStyle(fontSize: 25),
        ),
        bottom: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                  size: 30,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("All Restaurants",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("by rating")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            for (int i = 0; i < 5; i++) {
              _sortList = [_sortList.length] + _sortList;
            }
            print(_sortList);
          });
        },
        child: ListView.builder(
          reverse: true,
          itemCount: _sortList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
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
                                image:
                                AssetImage(_list[_sortList[index] % 13][0]),
                                fit: BoxFit.cover)),
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
                                _list[_sortList[index] % 13][1],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              RatingBar(
                                  ignoreGestures: true,
                                  itemSize: 25,
                                  initialRating: _list[_sortList[index] % 13]
                                  [4],
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
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(_list[_sortList[index] % 13][2],
                                      style: TextStyle(
                                          color: Colors.grey.shade600)),
                                  SizedBox(width: 3),
                                  Icon(
                                    Icons.circle,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text(_list[_sortList[index] % 13][3],
                                      style: TextStyle(
                                          color: Colors.grey.shade600)),
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
          },
        ),
      ),
    );
  }
}
