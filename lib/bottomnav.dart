import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:store_catalog_apps/Data/allData.dart';

import 'package:store_catalog_apps/TabPage/Favorites/favoritePage.dart';
import 'package:store_catalog_apps/TabPage/Home/homePage.dart';
import 'package:store_catalog_apps/TabPage/Notifications/notifyPage.dart';
import 'package:store_catalog_apps/TabPage/Profile/profilePage.dart';

import 'Cart/eachproductpg.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({Key? key}) : super(key: key);

  @override
  _bottomnavState createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = homepage();

  final List<Widget> screen = [
    homepage(),
    favpage(),
    notifpage(),
    profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5284E3),
        child: ImageIcon(
          NetworkImage("https://i.postimg.cc/q7h16vPh/Group-1.png"),
          color: Color(0xFFEBEAEF),
        ),
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchPage<Product>(
              items: products,
              searchLabel: 'Search product',
              suggestion: Center(
                child: Text('Filter products by name and storename'),
              ),
              failure: Center(
                child: Text('No products found :('),
              ),
              filter: (product) => [
                product.pname,
                product.storename
              ],
              builder: (product) {
                return gridSearchTemp(product: product);
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width) / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = homepage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? Color(0xFF5284E3)
                              : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Main Menu',
                          style: TextStyle(
                              fontSize:
                                  (MediaQuery.of(context).size.width) / 38,
                              color: currentTab == 0
                                  ? Color(0xFF5284E3)
                                  : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width) / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = favpage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.heart_fill,
                          color: currentTab == 1
                              ? Color(0xFF5284E3)
                              : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(
                              fontSize:
                                  (MediaQuery.of(context).size.width) / 38,
                              color: currentTab == 1
                                  ? Color(0xFF5284E3)
                                  : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width) / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = notifpage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.bell_fill,
                          color: currentTab == 2
                              ? Color(0xFF5284E3)
                              : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Notification',
                          style: TextStyle(
                              fontSize:
                                  (MediaQuery.of(context).size.width) / 38,
                              color: currentTab == 2
                                  ? Color(0xFF5284E3)
                                  : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width) / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = profilepage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.profile_circled,
                          color: currentTab == 3
                              ? Color(0xFF5284E3)
                              : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize:
                                  (MediaQuery.of(context).size.width) / 38,
                              color: currentTab == 3
                                  ? Color(0xFF5284E3)
                                  : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ListView Search
class gridSearchTemp extends StatelessWidget {
  const gridSearchTemp({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: size.height/6,
                  child: Image.asset(product.pURL[0]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height/14, horizontal: size.width/12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.pname,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width/21),
                    ),
                    Container(
                      child: Text(
                        product.storename,
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: size.width/23),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => eachProductPg(product: product,)),
            );
          },
        ),
      ),
    );
  }
}