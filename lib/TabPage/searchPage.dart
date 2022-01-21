import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search keyword...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
        ],
      ),
    );
  }
}
