//Data User
import 'package:flutter/cupertino.dart';

List<String> storename = ['Perkutut', 'Perkakas Gagah', 'Solid Media', 'EdiaLhur', 'FM Store'];

class User {
  final String username;
  final String email;
  final String password;

  const User({
    required this.username,
    required this.email,
    required this.password,
  });
}

List<User> users = [
  User(
    username: 'mainadmin',
    email: 'admin01',
    password: 'admin'
  )
];

//Data Product
class Product {
  final String pname;
  final String pdesc;
  final String storename;
  final List pURL;
  final List pcolor;
  final int prize;

  const Product({
    required this.pname,
    required this.pdesc,
    required this.storename,
    required this.pURL,
    required this.pcolor,
    required this.prize,
  });
}

List<Product> products = [
  Product(
    pname: 'Bor',
    pdesc: 'Lengkap dengan kotak. Berisi mata bor 12 buah, kabel, dan alat bor.',
    storename: storename[0],
    pcolor: [Color(0xFFBB1616)],
    pURL: ['asset/product/bor.png'],
    prize: 480000
  ),
  Product(
    pname: 'Gergaji Tangan',
    pdesc: 'Gergaji Tangan 2 Mata / Gergaji Belah, ukurannya 18 INCH.',
    storename: storename[1],
    pcolor: [Color(0xFFA47853)],
    pURL: ['asset/product/gergaji.png'],
    prize: 37000
  ),
  Product(
    pname: 'Gergaji Fiber',
    pdesc: 'Gergaji tangan 2 Mata / Gergaji Belah, ukurannya 18 INCH. Dengan gagang fiber.',
    storename: storename[2],
    pcolor: [Color(0xFF9AEA02)],
    pURL: ['asset/product/gergaji fiber.png'],
    prize: 57000
  ),
  Product(
    pname: 'Gergaji Lipat',
    pdesc: 'Gergaji Lipat dapat dibawa-bawa dengan mudah kemana saja.',
    storename: storename[3],
    pcolor: [Color(0xFFF77503)],
    pURL: ['asset/product/gergaji lipat.png'],
    prize: 50000
  ),
  Product(
    pname: 'Gergaji Listrik',
    pdesc: 'Gergaji Listrik lengkap dengan box. Terdiri atas kabel dan alat utamanya. Bertengangan 5 Volt.',
    storename: storename[1],
    pcolor: [Color(0xFF44444C)],
    pURL: ['asset/product/gergaji listrik.png'],
    prize: 255000
  ),
  Product(
    pname: 'Gergaji Tipis',
    pdesc: 'Gergaji Tipis, dapat diugunakan untuk memotong yang lebih spesifik/rumit. Ukurannya 18 INCH.',
    storename: storename[4],
    pcolor: [Color(0xFFF4A471)],
    pURL: ['asset/product/gergaji tipis.png'],
    prize: 46000
  ),
  Product(
    pname: 'Kacamata Las',
    pdesc: 'Teknologi terbaru, gagang tebal dan kuat. Tahan juga terhadap sinar UV.',
    storename: storename[2],
    pcolor: [Color(0xFFE09DD2)],
    pURL: ['asset/product/kacamata las.png'],
    prize: 44600
  ),
  Product(
    pname: 'Obeng',
    pdesc: 'Obeng +. Dilengkapi magnet untuk menempelnya sekrup. Ukuran compact 7 Inch.',
    storename: storename[4],
    pcolor: [Color(0xFF951402)],
    pURL: ['asset/product/obeng.png'],
    prize: 35000
  ),
  Product(
    pname: 'Obeng Fiber',
    pdesc: 'Obeng tangan + plus, - minus, ukurannya 7 INCH. Dengan gagang fiber.',
    storename: storename[3],
    pcolor: [Color(0xFF9ECE57), Color(0xFFCB3753)],
    pURL: ['asset/product/obeng fiber.png', 'asset/product/obeng fiber2.png'],
    prize: 67100
  ),
  Product(
    pname: 'Obeng Listrik',
    pdesc: 'Obeng Listrik lengkap dengan box. Terdiri atas kabel dan alat utamanya. Bertengangan 5 Volt.',
    storename: storename[0],
    pcolor: [Color(0xFFDD363C)],
    pURL: ['asset/product/obeng listrik.png'],
    prize: 293000
  ),
  Product(
    pname: 'Obeng T',
    pdesc: 'Obeng berbentuk huruf T, lengkap dengan matanya 12 buah.',
    storename: storename[1],
    pcolor: [Color(0xFFEBC502), Color(0xFFED0404)],
    pURL: ['asset/product/obeng T.png', 'asset/product/obeng T2.png'],
    prize: 18000
  ),
  Product(
    pname: 'Tang Fiber',
    pdesc: 'Tang tangan, ukurannya 5 INCH. Dengan gagang fiber.',
    storename: storename[2],
    pcolor: [Color(0xFFFDE50C)],
    pURL: ['asset/product/tang.png'],
    prize: 44800
  ),
  Product(
    pname: 'Tang Las',
    pdesc: 'Tang untuk las, ukuran 6 inch. Gagang fiber, dengan tegangan 12 Volt.',
    storename: storename[4],
    pcolor: [Color(0xFFFB8C52)],
    pURL: ['asset/product/tang las.png'],
    prize: 62500
  ),
];

//Data Cart
class Cart {
  final String pid;
  final String pname;
  final String pURL;
  final int prize;
  final int amount;

  const Cart ({
    required this.pid,
    required this.pname,
    required this.pURL,
    required this.prize,
    required this.amount,
  });
}

List<Cart> carts = [
  Cart(
    pid: '1',
    pname: 'Obeng Listrik',
    pURL: 'asset/product/obeng listrik.png',
    amount: 1,
    prize: 293000
  ),
  Cart(
    pid: '2',
    pname: 'Kacamata Las',
    pURL: 'asset/product/kacamata las.png',
    amount: 2,
    prize: 44600
  ),
  Cart(
    pid: '3',
    pname: 'Gergaji Lipat',
    pURL: 'asset/product/gergaji lipat.png',
    amount: 2,
    prize: 50000
  ),
];