import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:intl/intl.dart';
import 'package:store_catalog_apps/TabPage/favoritePage.dart';

class eachProductPg extends StatefulWidget {
  const eachProductPg({Key? key}) : super(key: key);

  @override
  _eachProductPgState createState() => _eachProductPgState();
}

class _eachProductPgState extends State<eachProductPg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int selectedColor = 0;
    int amount = 0;
    
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: buildAppBar(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text(
                      'Price Per Pcs',
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Icon(CupertinoIcons.add),
                            onTap: () {
                              setState(() {
                                amount++;
                              });
                            },
                          ),
                          Text(
                            '$amount',
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                            child: Icon(CupertinoIcons.minus),
                            onTap: () {
                              setState(() {
                                if(amount != 0)
                                  amount--;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  child: Container(
                    child: Center(
                      child: Text(
                        '  Add To\nYour Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    height: 70,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height/1.25,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height/4),
                    height: size.height,
                    padding: EdgeInsets.only(top: size.height/4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Bor Listrik',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 30,),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 2.5,
                                              color: Colors.blueGrey,
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.transparent,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  Text(
                                    'IDR',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    NumberFormat.compactCurrency(locale: 'id', symbol: '', decimalDigits: 0).format(256000),
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(CupertinoIcons.star_fill, color: Colors.black,),
                          ],
                        ),
                        Text(
                          '(99+ Reviews)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                            child: ExpandableText(
                              'Lengkap dengan kotak. Berisi mata bor 12 buah, kabel, dan alat bor.',
                              expandText: 'More...',
                              collapseText: 'Less...',
                              maxLines: 1,
                              linkColor: Colors.blueAccent,
                            ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          child: Image.asset('asset/product/bor.png',),
                        ),
                      )
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
      backgroundColor: Colors.redAccent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(CupertinoIcons.back, color: Colors.black,),
        onPressed: (){
          Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const favpage()));
        }
      ),
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.heart, color: Colors.black,),
          onPressed: () {},
        ),
      ],
    );
  }
}

