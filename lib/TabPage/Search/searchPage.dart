import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_catalog_apps/Data/allData.dart';

class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  Widget appBarTitle = Text(
    "Search",
    style: TextStyle(color: Colors.black),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.black,
  );
  List<Product>? product;
  List<Product>? searchProd = [];

  final key = GlobalKey<ScaffoldState>();
  final TextEditingController searchcont = TextEditingController();
  bool isSearching = false;
  String query = '';

  SearchListState() {
    searchcont.addListener(() {
      if (searchcont.text.isEmpty) {
        setState(() {
          isSearching = false;
          query = '';
          buildSearchList();
        });
      } else {
        setState(() {
          isSearching = true;
          query = searchcont.text;
          buildSearchList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isSearching = false;
    init();
  }

  void init() {
    //products = [];
    searchProd = product;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final searchProduct = products.where((sp) => sp.pname.toLowerCase().contains(searchcont.toString())).toList();

    void onChange (String query) {
      final prod = products.where((prd) {
        final titlelower = prd.pname.toLowerCase();
        final storeLower = prd.storename.toLowerCase();
        final searchLow = query.toLowerCase();

        return titlelower.contains(searchLow) ||
            storeLower.contains(searchLow);
      }).toList();

      setState(() {
        this.query = query;
        this.product = product;
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      key: key,
      appBar: buildAppBar(),
      body: GridView.builder(
        itemCount: searchProd!.length,
        itemBuilder: (context, index) {
          return gridSearch(product: product![index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
      ),
    );
  }

  List<Product>? buildList() {
    return product;
  }

  List<Product>? buildSearchList() {
    if (query.isEmpty) {
      return searchProd =
          product;
    } else {
      searchProd = product!.where((element) =>
      element.pname.toLowerCase().contains(query.toLowerCase()) ||
          element.storename.toLowerCase().contains(query.toLowerCase()))
          .toList();
      print('${searchProd!.length}');
      return searchProd;
    }
  }

  AppBar buildAppBar() {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.orange,
                  );
                  this.appBarTitle = TextField(
                    controller: searchcont,
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                    decoration: InputDecoration(
                        hintText: "Search here..",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }
  void _handleSearchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.orange,
      );
      this.appBarTitle = Text(
        "My Properties",
        style: TextStyle(color: Colors.white),
      );
      isSearching = false;
      searchcont.clear();
    });
  }
}

class gridSearch extends StatelessWidget {
  const gridSearch({Key? key, required this.product}) : super(key: key);

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
