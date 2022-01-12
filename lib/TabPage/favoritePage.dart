import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_catalog_apps/Data/allData.dart';

class favpage extends StatefulWidget {
  const favpage({Key? key}) : super(key: key);

  @override
  _favpageState createState() => _favpageState();
}

class _favpageState extends State<favpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFEBEAEF),
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFEBEAEF),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(CupertinoIcons.settings, color: Colors.black,),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.cart, color: Colors.black,),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: TabBar(
                  unselectedLabelColor: Color(0xFF5284E3),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: Color(0xFF5284E3),
                    borderRadius: BorderRadius.circular(40)
                  ),
                  tabs: [
                    Tab(text: 'Product'),
                    Tab(text: 'Marketplace',)
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width/1.125,
              child: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          products.map((e) => ListFavorite(
                            title: e.pname,
                            storename: e.storename,
                            urlproduct: e.pURL,
                          )).toList(),
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          products.map((e) => ListFavorite(
                            title: e.storename,
                            storename: 'silver',
                            urlproduct: 'store.png',
                          )).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListFavorite extends StatelessWidget {
  const ListFavorite({Key? key, required this.title, required this.storename, required this.urlproduct}) : super(key: key);
  final String title;
  final String storename;
  final String urlproduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width/1.125,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 100, width: 100,
              child: Image.asset('asset/product/'+urlproduct)
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
                Text(storename)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(CupertinoIcons.heart, color: Color(0xFF5284E3),),
              iconSize: 38,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
