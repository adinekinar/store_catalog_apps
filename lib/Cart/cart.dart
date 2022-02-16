import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_catalog_apps/Data/allData.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int points = 40;
    int total = 0;
    bool _value = false;
    for(var i = 0; i< carts.length; i++)
       total += (carts[i].prize*carts[i].amount);

    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: buildAppBar(context),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: size.height/3.25,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEF0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Apply Coupon',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Apply'),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Use Your Points : ${points} P',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    CupertinoSwitch(
                      value: _value,
                      activeColor: Colors.blueAccent,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Sub Total : \n'+
                              NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(total),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: MaterialButton(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Check Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Center(
                    child: Dismissible(
                      key: Key(carts[index].pid),
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(CupertinoIcons.trash, color: Colors.redAccent,)
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          carts.removeAt(index);
                        });
                      },
                      child: buildCart(cart: carts[index]),
                    ),
                  );
                },
              childCount: carts.length,
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFFEBEAEF),
      elevation: 0,
      leading: BackButton(
        color: Colors.black,
      ),
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${carts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

class buildCart extends StatelessWidget {
  final Cart cart;
  const buildCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size.width/1.125,
      height: size.height/6.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 70, width: 100,
              child: Image.asset(cart.pURL)
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cart.pname,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(cart.prize),
                    style: TextStyle(color: Color(0xFF5284E3)),
                  ),
                  Text( cart.amount.toString() +' total items')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
