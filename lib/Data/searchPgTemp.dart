import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import 'allData.dart';

class searchTempPg extends StatefulWidget {
  const searchTempPg({Key? key}) : super(key: key);

  @override
  _searchTempPgState createState() => _searchTempPgState();
}

class _searchTempPgState extends State<searchTempPg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFEBEAEF),
        elevation: 0,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search, color: Colors.black),
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
                  builder: (product) => gridSearchTemp(product: product),
                ),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final Product product = products[index];
                return gridSearchTemp(product: products[index],);
              },
              childCount: products.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size.width/2,
                mainAxisExtent: size.height/3.1,
                mainAxisSpacing: 10
            ),
          ),
        ],
      ),
    );
  }
}

class gridSearchTemp extends StatelessWidget {
  const gridSearchTemp({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: size.height/5,
                    child: Image.asset(product.pURL[0]),
                  ),
                ),
                onTap: () {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.pname,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    child: Text(
                      product.storename,
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
