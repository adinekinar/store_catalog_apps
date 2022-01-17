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
    storename: 'Perkutut',
    pcolor: ['0xFFBB1616'],
    pURL: ['bor.png'],
    prize: 480000
  ),
  Product(
    pname: 'Gergaji Tangan',
    pdesc: 'Gergaji Tangan 2 Mata / Gergaji Belah, ukurannya 18 INCH.',
    storename: 'Perkakas Gagah',
    pcolor: ['0xFFBB1616'],
    pURL: ['gergaji.png'],
    prize: 37000
  ),
  Product(
    pname: 'Gergaji Fiber',
    pdesc: 'Gergaji tangan 2 Mata / Gergaji Belah, ukurannya 18 INCH. Dengan gagang fiber.',
    storename: 'Solid Media',
    pcolor: ['0xFFBB1616'],
    pURL: ['gergaji fiber.png'],
    prize: 57000
  ),
  Product(
    pname: 'Gergaji Lipat',
    pdesc: 'Gergaji Lipat dapat dibawa-bawa dengan mudah kemana saja.',
    storename: 'EdiaLhur',
    pcolor: ['0xFFBB1616'],
    pURL: ['gergaji lipat.png'],
    prize: 50000
  ),
  Product(
    pname: 'Gergaji Listrik',
    pdesc: 'Gergaji Listrik lengkap dengan box. Terdiri atas kabel dan alat utamanya. Bertengangan 5 Volt.',
    storename: 'Perkakas Gagah',
    pcolor: ['0xFFBB1616'],
    pURL: ['gergaji listrik.png'],
    prize: 255000
  ),
  Product(
    pname: 'Gergaji Tipis',
    pdesc: 'Gergaji Tipis, dapat diugunakan untuk memotong yang lebih spesifik/rumit. Ukurannya 18 INCH.',
    storename: 'FM store',
    pcolor: ['0xFFBB1616'],
    pURL: ['gergaji tipis.png'],
    prize: 46000
  ),
  Product(
    pname: 'Kacamata Las',
    pdesc: 'Teknologi terbaru, gagang tebal dan kuat. Tahan juga terhadap sinar UV.',
    storename: 'Solid Media',
    pcolor: ['0xFFBB1616'],
    pURL: ['kacamata las.png'],
    prize: 44600
  ),
  Product(
    pname: 'Obeng',
    pdesc: 'Obeng +. Dilengkapi magnet untuk menempelnya sekrup. Ukuran compact 7 Inch.',
    storename: 'FM store',
    pcolor: ['0xFFBB1616'],
    pURL: ['obeng.png'],
    prize: 35000
  ),
  Product(
    pname: 'Obeng Fiber',
    pdesc: 'Obeng tangan + plus, - minus, ukurannya 7 INCH. Dengan gagang fiber.',
    storename: 'EdiaLhur',
    pcolor: ['0xFFBB1616'],
    pURL: ['obeng fiber.png', 'obeng fiber2.png'],
    prize: 67100
  ),
  Product(
    pname: 'Obeng Listrik',
    pdesc: 'Obeng Listrik lengkap dengan box. Terdiri atas kabel dan alat utamanya. Bertengangan 5 Volt.',
    storename: 'Perkutut',
    pcolor: ['0xFFBB1616'],
    pURL: ['obeng listrik.png'],
    prize: 293000
  ),
  Product(
    pname: 'Obeng T',
    pdesc: 'Obeng berbentuk huruf T, lengkap dengan matanya 12 buah.',
    storename: 'Perkakas Gagah',
    pcolor: ['0xFFBB1616'],
    pURL: ['obeng T.png', 'obeng T2.png'],
    prize: 18000
  ),
  Product(
    pname: 'Tang Fiber',
    pdesc: 'Tang tangan, ukurannya 5 INCH. Dengan gagang fiber.',
    storename: 'Solid Media',
    pcolor: ['0xFFBB1616'],
    pURL: ['tang.png'],
    prize: 44800
  ),
  Product(
    pname: 'Tang Las',
    pdesc: 'Tang untuk las, ukuran 6 inch. Gagang fiber, dengan tegangan 12 Volt.',
    storename: 'FM store',
    pcolor: ['0xFFBB1616'],
    pURL: ['tang las.png'],
    prize: 62500
  ),
];