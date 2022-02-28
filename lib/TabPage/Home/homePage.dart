import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:search_page/search_page.dart';
import 'package:store_catalog_apps/Cart/cart.dart';
import 'package:store_catalog_apps/Cart/eachmarketpg.dart';
import 'package:store_catalog_apps/Cart/eachproductpg.dart';
import 'package:store_catalog_apps/Data/allData.dart';
import 'package:store_catalog_apps/TabPage/Notifications/chatPage.dart';
import 'package:store_catalog_apps/authentication/loginPage.dart';

import '../../bottomnav.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final Product product;

    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFEBEAEF),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.settings,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chat()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tools for work,",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Text("work for dream.",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            Image.network("https://i.postimg.cc/q7h16vPh/Group-1.png", color: Colors.grey, width: 25, height: 25,),
                            SizedBox(width: 10,),
                            Text('Search..', style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                      onTap: () {
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recommended Market",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text("See All",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent)),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i = 0; i < storename.length; i++)
                            ToolsRecommendation(index: i),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recent Seen..",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text("See All",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent)),
                      ],
                    ),
                    Column(
                      children: [
                        for(int i = 0; i < carts.length; i++)
                          RecentSeen(index: i,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Market Recomendation
class ToolsRecommendation extends StatelessWidget {
  const ToolsRecommendation({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          final storenme = products.where((e) => e.storename == storename[index]).toList();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => eachMarketPg(storename: storename[index], productamount: storenme.length)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('asset/product/store.png', height: size.width/6, width: size.width/6,),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  storename[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Surabaya, Jawa Timur"),
                SizedBox(
                  height: 10,
                ),
                Text("Onsite - USD10K/month")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Recent Seen
class RecentSeen extends StatelessWidget {
  const RecentSeen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int indexbaru = 0;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          if(index == 0){
            indexbaru = 9;
          } else if (index == 1){
            indexbaru = 6;
          } else {
            indexbaru = 3;
          }
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => eachProductPg(product: products[indexbaru])));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(carts[index].pURL, height: size.width/4, width: size.height/4,),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  carts[index].pname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(storename[index]),
                SizedBox(
                  height: 10,
                ),
                Text(
                  NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(carts[index].prize),
                  style: TextStyle(color: Color(0xFF5284E3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
