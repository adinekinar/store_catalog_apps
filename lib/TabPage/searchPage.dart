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
  List<Product>? product;
  final searchcont = TextEditingController();
  String query = '';

  @override
  void initState() {
    product = products;
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
            icon: Icon(CupertinoIcons.search_circle, color: Colors.black,),
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
                      borderSide: BorderSide(color: Colors.black)),
                suffixIcon: query.isNotEmpty
                  ? GestureDetector(
                    child: Icon(Icons.close,),
                    onTap: () {
                      searchcont.clear();
                      onChange('');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                ) : null,
              ),
              onChanged: onChange,
            ),
          ),
          Flexible(
            child: CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return gridSearch(product: products[index],);
                    },
                    childCount: products.length,
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width/2,
                      mainAxisExtent: size.height/3,
                      mainAxisSpacing: 10
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
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
