import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_catalog_apps/Cart/cart.dart';
import 'package:store_catalog_apps/Cart/eachmarketpg.dart';
import 'package:store_catalog_apps/Cart/eachproductpg.dart';
import 'package:store_catalog_apps/Data/allData.dart';
import 'package:store_catalog_apps/Data/heartanim.dart';

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
        body: buildBody(context),
      ),
    );
  }

  //Body
  Column buildBody(BuildContext context) {

    return Column(
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
                      delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final storenme = products.where((e) => e.storename == storename[index]).toList();
                            return ListFavoriteMP(
                              stores: storenme.length,
                              index: index,
                            );
                          },
                        childCount: storename.length
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  }

  //Appbar
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

//Each Container of product
class ListFavoriteProd extends StatefulWidget {
  const ListFavoriteProd({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _ListFavoriteProdState createState() => _ListFavoriteProdState();
}

class _ListFavoriteProdState extends State<ListFavoriteProd> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final icon = isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    final colorIcon = isLiked ? Colors.redAccent : Color(0xFF5284E3);

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
                child: Image.asset(widget.product.pURL[0]),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.pname,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(widget.product.storename)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: likeAnimationWidget(
                isAnimating: isLiked,
                alwaysAnimate: true,
                child: IconButton(
                  icon: Icon(icon, color: colorIcon, size: 38,),
                  //iconSize: 38,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => eachProductPg(product: widget.product,)),
        );
      },
    );
  }
}

//Each Container of market
class ListFavoriteMP extends StatefulWidget {
  const ListFavoriteMP({Key? key, required this.stores, required this.index}) : super(key: key);
  final int stores;
  final int index;

  @override
  _ListFavoriteMPState createState() => _ListFavoriteMPState();
}

class _ListFavoriteMPState extends State<ListFavoriteMP> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final icon = isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    final colorIcon = isLiked ? Colors.redAccent : Color(0xFF5284E3);
    String sname;

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
                child: Image.asset('asset/product/store.png')
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     sname = storename[widget.index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text('${widget.stores} product')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: likeAnimationWidget(
                isAnimating: isLiked,
                alwaysAnimate: true,
                child: IconButton(
                  icon: Icon(icon, color: colorIcon,),
                  iconSize: 38,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => eachMarketPg(storename: sname, productamount: widget.stores,))
        );
      },
    );
  }
}