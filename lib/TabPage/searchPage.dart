import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_catalog_apps/Cart/eachproductpg.dart';
import 'package:store_catalog_apps/Data/allData.dart';

class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {

  final searchcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final searchProduct = products.where((sp) => sp.pname.toLowerCase().contains(searchcont.toString())).toList();

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
            icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextFormField(
              controller: searchcont,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search keyword...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                height: 300,
                color: Colors.yellow,
              );
            },
            itemCount: products.length,
          ),
        ],
      ),
    );
  }
}
