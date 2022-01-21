import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_catalog_apps/Cart/cart.dart';
import 'package:store_catalog_apps/Cart/eachproductpg.dart';
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
        appBar: buildAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
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
                        delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ListFavoriteProd(product: products[index]);
                            },
                            childCount: products.length,
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          products.map((e) => ListFavoriteMP(
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

  AppBar buildAppBar() {
    return AppBar(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      );
  }
}

class ProdDetailArguments {
  final Product product;

  ProdDetailArguments({required this.product});
}

class ListFavoriteProd extends StatelessWidget {
  const ListFavoriteProd({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 100, width: 100,
                child: Image.asset(product.pURL[0]),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.pname,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(product.storename)
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
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => eachProductPg(product: product,)),
        );
      },
    );
  }
}

class ListFavoriteMP extends StatelessWidget {
  const ListFavoriteMP({Key? key, required this.title, required this.storename, required this.urlproduct}) : super(key: key);
  final String title;
  final String storename;
  final String urlproduct;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
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
      ),
      onPressed: () {},
    );
  }
}