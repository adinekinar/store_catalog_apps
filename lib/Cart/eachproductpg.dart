import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:easycartanimation/easycartanimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:intl/intl.dart';
import 'package:store_catalog_apps/Data/allData.dart';
import 'package:store_catalog_apps/Data/heartanim.dart';

import 'cart.dart';

class eachProductPg extends StatefulWidget {
  const eachProductPg({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _eachProductPgState createState() => _eachProductPgState();
}

class _eachProductPgState extends State<eachProductPg> {

  GlobalKey keys = GlobalKey();
  late Offset endofoffset;

  int amount = 0;
  bool isLiked = false;
  bool selectedColor = false;
  int colorIndex = 0;

  void increment() {
    setState(() {
      amount++;
    });
  }

  void decrement() {
    setState(() {
      if (amount != 0)
        amount--;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      endofoffset = (keys.currentContext!.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: widget.product.pcolor[colorIndex],
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
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Icon(CupertinoIcons.add, size: 20,),
                              onTap: increment,
                            ),
                            Text(
                              '${amount}',
                              style: TextStyle(fontSize: 18),
                            ),
                            GestureDetector(
                              child: Icon(CupertinoIcons.minus, size: 20,),
                              onTap: decrement,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Builder(
                    builder: (context) {
                      return MaterialButton(
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
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          var overlayenter = OverlayEntry(builder: (c) {
                            RenderBox boxes = context.findRenderObject() as RenderBox;
                            var offset = boxes.localToGlobal(Offset.zero);
                            return EasyCartAnimation(
                              startPosition: offset,
                              endPosition: endofoffset,
                              height: 20,
                              width: 20,
                              color: Colors.yellowAccent,
                              dxCurveAnimation: 250,
                              dyCurveAnimation: 50,
                              opacity: 0.5,
                            );
                          });
                          Overlay.of(context)!.insert(overlayenter);
                          Future.delayed(Duration(milliseconds: 800), () {
                            overlayenter.remove();
                            //overlayenter = null;
                          });
                        },
                      );
                    },
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
                                        widget.product.pname,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                      ),
                                      margin: EdgeInsets.symmetric(horizontal: 30),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 30,),
                                        for(var i = 0; i < widget.product.pcolor.length; i++)
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedColor = !selectedColor;
                                                colorIndex = i;
                                              });
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              margin: EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  color: widget.product.pcolor[i],
                                                  borderRadius: BorderRadius.circular(5),
                                              ),
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
                                      NumberFormat.compactCurrency(locale: 'id', symbol: '', decimalDigits: 0).format(widget.product.prize),
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
                                widget.product.pdesc,
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
                        Hero(
                          tag: widget.product,
                          child: Expanded(
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  child: child,
                                  scale: animation,
                                );
                              },
                              child: Container(
                                key: Key(colorIndex.toString()),
                                height: 300,
                                child: Image.asset(widget.product.pURL[colorIndex]),
                              ),
                            ),
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

    final icon = isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    final colorIcon = isLiked ? Colors.redAccent : Colors.black;

    return AppBar(
      backgroundColor: widget.product.pcolor[colorIndex],
      elevation: 0,
      leading: BackButton(
        color: Colors.black,
      ),
      actions: [
        likeAnimationWidget(
          isAnimating: isLiked,
          alwaysAnimate: true,
          child: IconButton(
            icon: Icon(icon, color: colorIcon,),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
        ),
        IconButton(
          key: keys,
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
    );
  }

}

