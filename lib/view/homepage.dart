import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:justmarryapp/help/ui.dart';
import 'package:justmarryapp/shared/navigation_drawer.dart';
import 'package:justmarryapp/shared/service_card.dart';
import 'package:justmarryapp/view/loginpage.dart';
import 'package:justmarryapp/view/weatherpage.dart';

class HomeView extends StatefulWidget {
  const HomeView({key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  int index =0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WeatherPage(),
    Text(
      'Index 2: Book',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = index;
    Size size = MediaQuery
        .of(context)
        .size;
    _widgetOptions[_selectedIndex];




    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.menu
        //   ),
        //   onPressed: () {
        //     Navigator.pushNamed(context, 'drawer');
        //   },
        // ),
      ),


      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.only(
                      left: 10,
                      right:10,
                      bottom: 46,

              ),
              height: size.height*0.2-27,
              decoration: BoxDecoration(color: Colors.amber[500],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),

                ),
              ),
                    child: Row(
                      children: <Widget>[
                        Text("Hello User!",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
                     UIHelper.horizontalSpaceMedium(),
                    // Container(
                    //
                    // decoration: BoxDecoration(
                    //   image:DecorationImage(
                    //   image: AssetImage("assets/logo.png"),
                    //
                    //
                    //     ),),),
                      ],

                    ),
            ),
            Positioned(
                bottom:0,
                left:0,
                right: 0,
                child: Container(

              margin:EdgeInsets.symmetric(horizontal: 10) ,
                  padding:EdgeInsets.symmetric(horizontal: 10) ,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow:
                  [
                    BoxShadow(
                      offset: Offset(0,10),
                      blurRadius: 50,
                      color: Colors.amber.withOpacity(0.23),
                    ),
                  ]
              ),
                  child: TextField(
                    onChanged: (value){},
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.orange[500].withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                        focusedBorder:InputBorder.none,
                      suffixIcon: Icon(Icons.search,color: Colors.orange,),
                    ),
                  ),
            ),
            ),
          ],

        ),

            ),
              Container(

              child:Stack(
                children:<Widget>[
                  Column(
                    children:<Widget> [
                      Row(
                        children: [
                          UIHelper.horizontalSpaceMedium(),
                          Text("Recommended",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          UIHelper.horizontalSpaceLarge(),
                          UIHelper.horizontalSpaceMedium(),

                          TextButton(onPressed: (){}, child: Text("More",style:TextStyle(color:Colors.grey),),),




                        ],

                      ),
                      getPromotionSlider(context),
                      getCateringSection(size),



                    ],

                  ),

                ]
                ),
            ),
              ]

    ),
      ),

    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex:_selectedIndex,
    //
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'Home',
    //
    //
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(CupertinoIcons.sun_max_fill),
    //       label: 'Weather',
    //
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(CupertinoIcons.doc_append),
    //       label: 'Book',
    //     ),
    //   ],
    //
    //   selectedItemColor: Colors.amber[800],
    //   onTap: _onItemTapped,
    // ),

    );
  }

  Widget getPromotionSlider(size) {
    List<ServiceCard> cardList = new List<ServiceCard>();
    // TODO - get list of cards from API
    cardList.add(
      ServiceCard(
        imageUrl: 'assets/photographer.png',
        // url: "iksmart",
        desc: "Photography",
      ),
    );
    cardList.add(
      ServiceCard(
        imageUrl: 'assets/catering.png',
        // url: "dico",
        desc: "Catering",
      ),
    );
    cardList.add(
      ServiceCard(
        imageUrl: 'assets/taylor.png',
        // url: "ptptn",
        desc: "Decor",
      ),
    );
    // cardList.add(
    //   ServiceCard(
    //     imageUrl: 'assets/images/IKLAN-BESTPAY-FOOD-BELI-NOW.png',
    //     // url: "food",
    //     desc: "food",
    //   ),
    // );

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        enlargeCenterPage: true,
      ),
      items: cardList.map((card) {
        return Builder(builder: (context) {
          width:
          MediaQuery.of(context).size.width;
          margin:
          EdgeInsets.symmetric(horizontal: 5.0);
          return card;
        });
      }).toList(),
    );
  }

  Widget getCateringSection(size) {

    double width = size.width - 10;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
        SizedBox(
          width: width,
          child: Column(
              children : [Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        IconButton(
                            iconSize: width/4-5,
                            icon: new Image.asset("assets/catering 1.jpg"),
                            onPressed: () {
                              // Navigator.pushNamed(context, '/ptptn_landing');
                            }),
                        Text("FourZBrothers", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        IconButton(
                            iconSize: width/4-2,
                            icon: new Image.asset("assets/catering2.png"),
                            onPressed: () {
                              // Navididigator.pushNamed(context, '/myprodigyhexo');
                            }),
                        Text("Waves", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        IconButton(
                            iconSize: width/4-2,
                            icon: new Image.asset("assets/catering3.jpg"),
                            onPressed: () {
                              // Navigator.pushNamed(context, '/myprodigyhexo');
                            }),
                        Text("Low Ivy", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        IconButton(
                            iconSize: width/4-2,
                            icon: new Image.asset("assets/catering4.jpg"),
                            onPressed: () {
                              // Navigator.pushNamed(context, '/myprodigyhexo');
                            }),
                        Text("Oregano", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),

                ],),]
          ),
        )
    );
  }


}
