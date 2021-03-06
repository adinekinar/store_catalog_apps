import 'package:easycartanimation/easycartanimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_catalog_apps/Cart/eachproductpg.dart';
import 'package:store_catalog_apps/Data/allData.dart';
import 'package:store_catalog_apps/Data/heartanim.dart';
import 'cart.dart';

class eachMarketPg extends StatefulWidget {
  const eachMarketPg({Key? key, required this.storename, required this.productamount}) : super(key: key);

  final String storename;
  final int productamount;

  @override
  _eachMarketPgState createState() => _eachMarketPgState();
}

class _eachMarketPgState extends State<eachMarketPg> {

  GlobalKey keys = GlobalKey();
  late Offset endofoffset;

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
    final storeProduct = products.where((s) => s.storename == widget.storename).toList();

    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFEBEAEF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.storename,
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            key: keys,
            icon: Icon(CupertinoIcons.cart, color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
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
                              child: Hero(
                                tag: storeProduct[index],
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: size.height/5,
                                  child: Image.asset(storeProduct[index].pURL[0].toString()),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => eachProductPg(product: storeProduct[index])));
                            },
                          ),
                          Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    storeProduct[index].pname,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  Container(
                                    child: Text(
                                      NumberFormat.compactCurrency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(storeProduct[index].prize),
                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: size.height/25, left: size.width/4),
                                child: Builder(
                                  builder: (context) {
                                    return ElevatedButton(
                                      child: Icon(CupertinoIcons.cart_badge_plus),
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
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        primary: Color(0xFF5284E3),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              childCount: widget.productamount,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size.width/2,
              mainAxisExtent: size.height/2.75,
              mainAxisSpacing: 10
            ),
          ),
        ],
      ),
    );
  }
}
