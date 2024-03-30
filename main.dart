import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz UI Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz UI Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Nomor Kelompok:  17',
            ),
            const Text(
              'Mhs 1:  [2202680, Mohammad Faridz Fathin]',
            ),
            const Text(
              'Mhs 2:  [2200163, Rifanny Lysara Annastasya]',
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SoalNo1();
                  }));
                },
                child: const Text('   Jawaban No 1   '),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SoalNo2();
                  }));
                },
                child: const Text('   Jawaban No 2   '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoalNo1 extends StatelessWidget {
  const SoalNo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}

class SoalNo2 extends StatelessWidget {
  const SoalNo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShoppingApp();
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:  Color(0xFFF6CD46),
      // ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Color(0xFFF6CD46),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Budi Martami',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/0/0f/IU_posing_for_Marie_Claire_Korea_March_2022_issue_03.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ProfileForm(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  DateTime? _selectedDate;
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ubah Profil',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Nama Depan',
            style: TextStyle(fontSize: 13), //
          ),
          TextFormField(),
          SizedBox(height: 20),
          Text(
            'Nama Belakang',
            style:
                TextStyle(fontSize: 13), // Ganti ukuran font sesuai keinginan
          ),
          TextFormField(),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 2,
                        maxHeight: 50,
                      ),
                      padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButtonFormField(
                        value: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value as String?;
                          });
                        },
                        items: ['Laki-laki', 'Perempuan'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 2),
                              child: Text(
                                value,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: _selectedGender != null &&
                                          _selectedGender == value
                                      ? Colors
                                          .black // mengubah warna teks menjadi abu-abu jika terpilih
                                      : Colors
                                          .grey, // menggunakan warna hitam jika tidak terpilih
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20), // Menambahkan jarak horizontal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedDate != null
                                  ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                  : "DD/MM/YYYY",
                              style: TextStyle(
                                color: _selectedDate != null
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 13, // Ukuran font yang lebih kecil
                              ),
                            ),
                            Icon(Icons.calendar_month_sharp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Alamat',
            style: TextStyle(fontSize: 13), //
          ),
          TextFormField(),
          SizedBox(height: 50),
          SizedBox(
            height: 50,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF6CD46),

                    padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40), // Mengubah padding tombol
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingApp extends StatefulWidget {
  @override
  _ShoppingAppState createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int _selectedIndex = 0;
  TextEditingController searchController =
      TextEditingController(); // Tambahkan TextEditingController

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://picsum.photos/id/1015/300/200',
      'https://picsum.photos/id/1016/300/200',
      'https://picsum.photos/id/1018/300/200',
    ];

    // Fungsi untuk menampilkan tooltip
    void _showTooltip(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back
        toolbarHeight:
            MediaQuery.of(context).size.height * 0.23, // Mengatur tinggi AppBar
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/id/490/300/200'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 40,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[
                                  200], // Mengatur warna latar belakang menjadi putih
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors
                                    .black, // Mengubah warna border menjadi hitam
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.grey.shade700,
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: TextField(
                                    controller: searchController,
                                    onChanged: (value) {
                                      print('Input: $value');
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Cari Barang di Toko',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                        // Penyesuaian padding
                                        contentPadding:
                                            EdgeInsets.only(bottom: 19)),
                                    textAlignVertical: TextAlignVertical
                                        .center, // Teks akan diatur di tengah secara vertikal
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white, // Tetap warna putih
                            ),
                            onPressed: () {
                              _onItemTapped(0);
                            },
                            tooltip: 'Keranjang Belanja', // Menambahkan tooltip
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white, // Tetap warna putih
                            ),
                            onPressed: () {
                              _onItemTapped(1);
                            },
                            tooltip: 'Notifikasi', // Menambahkan tooltip
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.white, // Tetap warna putih
                            ),
                            onPressed: () {
                              _onItemTapped(2);
                            },
                            tooltip: 'Pesan', // Menambahkan tooltip
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Budi!',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[
                                200], // Mengatur warna latar belakang menjadi putih agak ke abu-abu
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.wallet, color: Colors.brown),
                                        SizedBox(
                                            width:
                                                8), // Spasi antara ikon dan teks
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Store',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                            Text('Credit',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                            Text('Rp. 0',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25, // Tinggi dari VerticalDivider
                                width: 1, // Lebar dari VerticalDivider
                                color: Colors.black, // Warna VerticalDivider
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.loyalty,
                                            color: Colors.brown),
                                        SizedBox(
                                            width:
                                                8), // Spasi antara ikon dan teks
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Reward',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                            Text('Point',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                            Text('100 Point',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25, // Tinggi dari VerticalDivider
                                width: 1, // Lebar dari VerticalDivider
                                color: Colors.black, // Warna VerticalDivider
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.confirmation_number,
                                            color: Colors.brown),
                                        SizedBox(
                                            width:
                                                8), // Spasi antara ikon dan teks
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Kupon',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                            Text('Saya',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                            Text('11 Kupon',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _onItemTapped(0);
                            },
                            onLongPress: () {
                              _showTooltip(
                                  'Official Store'); // Menampilkan tooltip saat ditekan lama
                            },
                            child: Column(
                              children: [
                                Icon(Icons.storefront,
                                    size:
                                        36), // Mengatur ukuran ikon menjadi 36
                                SizedBox(height: 7.0),
                                Text(
                                  'Official Store',
                                  style: TextStyle(fontSize: 10),
                                ), // Menambah teks di bawah ikon
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _onItemTapped(1);
                            },
                            onLongPress: () {
                              _showTooltip(
                                  'Hot Deal'); // Menampilkan tooltip saat ditekan lama
                            },
                            child: Column(
                              children: [
                                Icon(Icons.local_fire_department,
                                    size: 36,
                                    color: Colors.red), // Beri warna merah
                                SizedBox(height: 7.0),

                                Text(
                                  'Hot Deal',
                                  style: TextStyle(fontSize: 10),
                                ), // Menambah teks di bawah ikon
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _onItemTapped(2);
                            },
                            onLongPress: () {
                              _showTooltip(
                                  'Fashion'); // Menampilkan tooltip saat ditekan lama
                            },
                            child: Column(
                              children: [
                                Icon(Icons.checkroom_sharp,
                                    size:
                                        36), // Mengatur ukuran ikon menjadi 36
                                SizedBox(height: 7.0),

                                Text(
                                  'Fashion',
                                  style: TextStyle(fontSize: 10),
                                ), // Menambah teks di bawah ikon
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _onItemTapped(3);
                            },
                            onLongPress: () {
                              _showTooltip(
                                  'Kosmetik'); // Menampilkan tooltip saat ditekan lama
                            },
                            child: Column(
                              children: [
                                Icon(Icons.face_retouching_natural,
                                    size:
                                        36), // Mengatur ukuran ikon menjadi 36
                                SizedBox(height: 7.0),

                                Text(
                                  'Kosmetik',
                                  style: TextStyle(fontSize: 10),
                                ), // Menambah teks di bawah ikon
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imageUrls.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.grey[200], // Mengatur background navbar menjadi abu-abu muda
        type: BottomNavigationBarType.fixed, // Menampilkan label di bawah ikon
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Tooltip(
                message: 'Beranda', // Pesan yang akan ditampilkan saat hover
                child: InkWell(
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Mengatur bentuk lonjong
                      color: _selectedIndex == 0
                          ? Colors.amber
                          : Colors.transparent, // Warna kuning jika dipilih
                    ),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Icon(Icons.home),
                  ),
                ),
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Tooltip(
                message: 'Kategori', // Pesan yang akan ditampilkan saat hover
                child: InkWell(
                  onTap: () {
                    _onItemTapped(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Mengatur bentuk lonjong
                      color: _selectedIndex == 1
                          ? Colors.amber
                          : Colors.transparent, // Warna kuning jika dipilih
                    ),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Icon(Icons.category),
                  ),
                ),
              ),
            ),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Tooltip(
                message: 'Scan', // Pesan yang akan ditampilkan saat hover
                child: InkWell(
                  onTap: () {
                    _onItemTapped(2);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Mengatur bentuk lonjong
                      color: _selectedIndex == 2
                          ? Colors.amber
                          : Colors.transparent, // Warna kuning jika dipilih
                    ),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Icon(Icons.qr_code),
                  ),
                ),
              ),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Tooltip(
                message:
                    'List Belanja', // Pesan yang akan ditampilkan saat hover
                child: InkWell(
                  onTap: () {
                    _onItemTapped(3);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Mengatur bentuk lonjong
                      color: _selectedIndex == 3
                          ? Colors.amber
                          : Colors.transparent, // Warna kuning jika dipilih
                    ),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Icon(Icons.shopping_basket),
                  ),
                ),
              ),
            ),
            label: 'List Belanja',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Tooltip(
                message: 'Akun', // Pesan yang akan ditampilkan saat hover
                child: InkWell(
                  onTap: () {
                    _onItemTapped(4);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Mengatur bentuk lonjong
                      color: _selectedIndex == 4
                          ? Colors.amber
                          : Colors.transparent, // Warna kuning jika dipilih
                    ),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Icon(Icons.account_circle),
                  ),
                ),
              ),
            ),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Warna hitam saat dipilih
        unselectedItemColor:
            Colors.grey.shade800, // Warna abu-abu untuk yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}
