import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Program TPM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'admin' &&
        passwordController.text == 'admin') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login berhasil!'),
          backgroundColor: Colors.green, // Warna hijau untuk sukses
          duration: Duration(seconds: 2), // Tampilkan selama 2 detik
        ),
      );

      // Tunggu sebentar agar SnackBar terlihat sebelum pindah halaman
      Future.delayed(Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen()), // Pastikan HomeScreen sudah ada
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login gagal! Periksa username dan password.'),
          backgroundColor: Colors.red, // Warna merah untuk gagal
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Username', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: usernameController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 176, 73, 73),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Login',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center( // Pusatkan GridView
        child: SizedBox(
          width: 300, // Sesuaikan ukuran sesuai kebutuhan
          child: GridView.builder(
            shrinkWrap: true, // Mencegah GridView memenuhi seluruh layar
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final items = [
                {
                  'title': 'Data Anggota Kelompok',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': MemberListScreen()
                },
                {
                  'title': 'Operasi Matematika ',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': MathOperationsScreen()
                },
                {
                  'title': 'Bilangan Ganjil / Genap',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': EvenOddScreen()
                },
                {
                  'title': 'Jumlah Total Angka',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': TotalSumScreen()
                },
              ];
              return _buildCard(
                context,
                items[index]['title'] as String,
                items[index]['color'] as Color,
                items[index]['page'] as Widget,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, Color color, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class MemberListScreen extends StatefulWidget {
  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  PageController _pageController = PageController();
  List<Map<String, String>> members = [
    {
      'spotify': '---------------- || -----------------',
      'name': 'Muhammad Almas Farros D',
      'nim': '123220133',
      'image': 'assets/images/farros.jpg'
    },
    {
      'spotify': '---------------- || -----------------',
      'name': 'Jeslyn Vicky Hanjaya',
      'nim': '123220150',
      'image': 'assets/images/jeslyn.jpg'
    },
    {
      'spotify': '---------------- || -----------------',
      'name': 'Resti Ramadhani',
      'nim': '123220147',
      'image': 'assets/images/resti.jpg'
    },
  ];
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < members.length - 1) {
      setState(() {
        currentIndex++;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      });
    }
  }

  void prevPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Daftar Anggota'),
      centerTitle: true, // Pusatkan title
    ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: members.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    width: 300, // Ukuran Card
                    height: 500,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 176, 73, 73),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8), // Biar lebih rapi
                          child: Image.asset(
                            members[index]['image']!,
                            width: 300, // Ukuran gambar lebih kecil
                            height: 300, // Biar proporsional
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 40),
                        
                        Text(members[index]['spotify']!,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(members[index]['name']!,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(members[index]['nim']!,
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Tombol sebelah kiri
            Positioned(
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 30),
                onPressed: prevPage,
              ),
            ),
            // Tombol sebelah kanan
            Positioned(
              right: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, size: 30),
                onPressed: nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MathOperationsScreen extends StatefulWidget {
  @override
  _MathOperationsScreenState createState() => _MathOperationsScreenState();
}

class _MathOperationsScreenState extends State<MathOperationsScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0;
  String? errorTextNum1;
  String? errorTextNum2;

  void calculate(String operation) {
    setState(() {
      errorTextNum1 = null;
      errorTextNum2 = null;
    });

    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);

    if (num1 == null) {
      setState(() {
        errorTextNum1 = 'Masukkan angka yang valid!';
      });
    }
    if (num2 == null) {
      setState(() {
        errorTextNum2 = 'Masukkan angka yang valid!';
      });
    }

    if (num1 == null || num2 == null) return;

    setState(() {
      switch (operation) {
        case "add":
          result = num1 + num2;
          break;
        case "subtract":
          result = num1 - num2;
          break;
        case "multiply":
          result = num1 * num2;
          break;
        case "divide":
          result = num2 != 0 ? num1 / num2 : double.infinity;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operasi Matematika'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 73, 73),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka 1',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (errorTextNum1 != null) // Menampilkan error dengan teks putih
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    errorTextNum1!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 10),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka 2',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (errorTextNum2 != null) // Menampilkan error dengan teks putih
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    errorTextNum2!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("add"),
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("subtract"),
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("multiply"),
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("divide"),
                    child: Text('/'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Hasil: ${result.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EvenOddScreen extends StatefulWidget {
  @override
  _EvenOddScreenState createState() => _EvenOddScreenState();
}

class _EvenOddScreenState extends State<EvenOddScreen> {
  final TextEditingController numController = TextEditingController();
  String result = '';

  void checkEvenOdd() {
    BigInt? num = BigInt.tryParse(numController.text);
    setState(() {
      if (num == null) {
        result = 'Angka tidak valid!';
      } else {
        result = (num.isEven) ? 'Genap' : 'Ganjil';
      }
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Cek Bilangan'),
      centerTitle: true, // Pusatkan title
    ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191), // Warna latar belakang
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 73, 73), // Warna Card
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: numController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan angka',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkEvenOdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna tombol
                  foregroundColor: Colors.black, // Warna teks
                ),
                child: Text('Cek'),
              ),
              SizedBox(height: 20),
              Text(
                'Hasil: $result',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalSumScreen extends StatefulWidget {
  @override
  _TotalSumScreenState createState() => _TotalSumScreenState();
}

class _TotalSumScreenState extends State<TotalSumScreen> {
  final TextEditingController numbersController = TextEditingController();
  int total = 0;
  String errorMessage = ''; // Menyimpan pesan error

  void calculateSum() {
    String input = numbersController.text;

    // Validasi: hanya boleh angka, koma, dan spasi
    if (!RegExp(r'^[0-9,\s]+$').hasMatch(input)) {
      setState(() {
        errorMessage = 'Input hanya boleh berisi angka dan koma';
        total = 0; // Reset total jika ada kesalahan input
      });
      return;
    }

    List<int> numbers = input
        .split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0)
        .toList();

    setState(() {
      total = numbers.reduce((a, b) => a + b);
      errorMessage = ''; // Hapus pesan error jika input benar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumlah Total Angka'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 73, 73),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: numbersController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Masukkan angka (pisah dengan koma)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (errorMessage.isNotEmpty) // Jika ada error, tampilkan pesan
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),),
                  ),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: calculateSum,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              Text(
                'Total: $total',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
