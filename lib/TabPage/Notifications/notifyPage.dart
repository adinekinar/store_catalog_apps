import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notifpage extends StatefulWidget {
  const notifpage({Key? key}) : super(key: key);

  @override
  _notifpageState createState() => _notifpageState();
}

class _notifpageState extends State<notifpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: buildAppBarNotif(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/1.3,
          width: MediaQuery.of(context).size.width/1.125,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    for (var i = 0; i < 10; i++)
                      ListNotify(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarNotif() {
    return AppBar(
      title: Text(
          'Notification',
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
          icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black,),
          onPressed: () {},
        ),
      ],
    );
  }
}

class ListNotify extends StatelessWidget {
  const ListNotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width/1.125,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 100, width: 100,
                child: Icon(CupertinoIcons.cart_badge_plus, color: Color(0xFF5284E3), size: 60,)
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perkutut confirm your order',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    Text('Will send to your home before 30 Mei 2022')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}