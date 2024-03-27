import 'package:flutter/material.dart';
import 'login.dart';
import '../widgets/CustomButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2 Provis',
      debugShowCheckedModeBanner: false,
      home: const Profil(), // Ganti MyHomePage menjadi Profil
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFC1F4FF), Colors.white],
              ),
            ),
          ),
          Container(
            width: 415, // Lebar persegi panjang
            height: 195, // Tinggi persegi panjang
            color: const Color(0xFF0D0A92), // Warna persegi panjang
          ),
          Positioned(
            top: 85, // Atur jarak dari atas untuk "Profil Circle"
            left: 25, // Atur jarak dari kiri untuk "Profil Circle"
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profil Saya',
                  style: TextStyle(
                    fontSize: 24, // Ukuran teks
                    fontWeight: FontWeight.bold, // Ketebalan teks
                    color: Colors.white, // Warna teks
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xFFD9D9D9),
                      child: Icon(
                        Icons.person, // Icon yang ingin ditampilkan
                        size: 65, // Ukuran ikon
                        color: Colors.black, // Warna ikon
                      ),
                    ),
                    SizedBox(
                        width: 20), // Atur jarak antara "CircleAvatar" dan "Hi"
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi!', // Teks "Hi"
                          style: TextStyle(
                            fontSize: 20, // Ukuran teks
                            fontWeight: FontWeight.bold, // Ketebalan teks
                            color: Colors.white, // Warna teks
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          '',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25), // Atur jarak antara "Hi" dan tombol
                CustomButton(
                  text: 'Login',
                  iconData: Icons.login,
                  onPressed: () {
                    // Fungsi yang akan dijalankan ketika tombol ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
                const SizedBox(height: 15), // Atur jarak antara "Hi" dan tombol
                CustomButton(
                  text: 'Pusat Bantuan',
                  iconData: Icons.live_help,
                  onPressed: () {
                    // Fungsi yang akan dijalankan ketika tombol ditekan
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
