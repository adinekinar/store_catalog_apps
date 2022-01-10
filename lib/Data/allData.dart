//Data User
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
  final String pURL;
  final String pcolor;

  const Product({
    required this.pname,
    required this.pdesc,
    required this.storename,
    required this.pURL,
    required this.pcolor,
  });
}

List<Product> products = [
  Product(
    pname: 'Bor',
    pdesc: 'Lengkap dengan kotak. Berisi mata bor 12 buah, kabel, dan alat bor.',
    storename: 'Perkutut',
    pcolor: '0xFFBB1616',
    pURL: 'bor.png',
  ),
  Product(
    pname: 'Gergaji Tangan',
    pdesc: 'Gergaji Tangan 2 Mata / Gergaji Belah, ukurannya 18 INCH.',
    storename: 'Perkakas Gagah',
    pcolor: '0xFFBB1616',
    pURL: 'gergaji.png',
  ),
  Product(
    pname: 'Gergaji Fiber',
    pdesc: 'Gergaji tangan 2 Mata / Gergaji Belah, ukurannya 18 INCH. Dengan gagang fiber.',
    storename: 'Solid Media',
    pcolor: '0xFFBB1616',
    pURL: 'gergaji fiber.png',
  ),
  Product(
    pname: 'Gergaji Lipat',
    pdesc: 'Gergaji Lipat dapat dibawa-bawa dengan mudah kemana saja.',
    storename: 'EdiaLhur',
    pcolor: '0xFFBB1616',
    pURL: 'gergaji lipat.png',
  ),
  Product(
    pname: 'Gergaji Listrik',
    pdesc: 'Gergaji Listrik lengkap dengan box. Terdiri atas kabel dan alat utamanya. Bertengangan 5 Volt.',
    storename: 'Perkakas Gagah',
    pcolor: '0xFFBB1616',
    pURL: 'gergaji listrik.png',
  ),
  Product(
    pname: 'Gergaji Tipis',
    pdesc: 'Gergaji Tipis, dapat diugunakan untuk memotong yang lebih spesifik/rumit. Ukurannya 18 INCH.',
    storename: 'FM store',
    pcolor: '0xFFBB1616',
    pURL: 'gergaji tipis.png',
  ),
  Product(
    pname: 'Kacamata Las',
    pdesc: 'Teknologi terbaru, gagang tebal dan kuat. Tahan juga terhadap sinar UV.',
    storename: 'Solid Media',
    pcolor: '0xFFBB1616',
    pURL: 'kacamata las.png',
  ),
  Product(
    pname: 'Obeng',
    pdesc: 'Obeng +. Dilengkapi magnet untuk menempelnya sekrup. Ukuran compact 7 Inch.',
    storename: 'FM store',
    pcolor: '0xFFBB1616',
    pURL: 'obeng.png',
  ),
  Product(
    pname: 'Obeng Fiber',
    pdesc: 'Obeng tangan + plus, - minus, ukurannya 7 INCH. Dengan gagang fiber.',
    storename: 'EdiaLhur',
    pcolor: '0xFFBB1616',
    pURL: 'obeng fiber.png',
  ),
  Product(
    pname: 'Obeng Listrik',
    pdesc: 'Obeng Listrik lengkap dengan box. Terdiri atas kabel dan alat utamanya. Bertengangan 5 Volt.',
    storename: 'Perkutut',
    pcolor: '0xFFBB1616',
    pURL: 'obeng listrik.png',
  ),
  Product(
    pname: 'Obeng T',
    pdesc: 'Obeng berbentuk huruf T, lengkap dengan matanya 12 buah.',
    storename: 'Perkakas Gagah',
    pcolor: '0xFFBB1616',
    pURL: 'obeng T.png',
  ),
  Product(
    pname: 'Tang Fiber',
    pdesc: 'Tang tangan, ukurannya 5 INCH. Dengan gagang fiber.',
    storename: 'Solid Media',
    pcolor: '0xFFBB1616',
    pURL: 'tang.png',
  ),
  Product(
    pname: 'Tang Las',
    pdesc: 'Tang untuk las, ukuran 6 inch. Gagang fiber, dengan tegangan 12 Volt.',
    storename: 'FM store',
    pcolor: '0xFFBB1616',
    pURL: 'tang las.png',
  ),
];