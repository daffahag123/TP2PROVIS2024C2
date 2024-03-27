import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/GreenButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneNumberController = TextEditingController();
  late FlCountryCodePicker countryPicker;
  CountryCode? countryCode;

  @override
  void initState() {
    final favoritCountries = ['ID', 'SG', 'US', 'MY'];
    countryPicker = FlCountryCodePicker(
        favorites: favoritCountries,
        favoritesIcon: Icon(
          Icons.star,
          color: Colors.amber,
        ));
    super.initState();
  }

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
            width: double.infinity, // Lebar penuh
            height: 195, // Tinggi persegi panjang
            color: const Color(0xFF0D0A92), // Warna persegi panjang
          ),
          Positioned(
            top: 70,
            left: 25,
            child: GestureDetector(
              onTap: () {
                // Kembali ke halaman sebelumnya
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukkan nomor',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'telepon anda',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 220,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk dengan nomor telepon atau daftar baru jika',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'Anda belum memiliki akun',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nomor Ponsel',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF818181),
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Positioned(
            top: 285,
            left: 5,
            right: 30, // Lebar penuh
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: null, // Mengatur label ke null agar tidak muncul
                    hintText:
                        'Nomor Ponsel Anda', // Gunakan hintText sebagai placeholder
                    border: InputBorder.none,
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final code = await countryPicker.showPicker(
                                  context: context);
                              setState(() {
                                countryCode = code;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  child: countryCode != null
                                      ? countryCode!.flagImage()
                                      : null,
                                  padding: EdgeInsets.only(
                                      left: countryCode != null ? 6 : 0),
                                ),
                                SizedBox(width: countryCode != null ? 10 : 0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    countryCode?.dialCode ?? "+",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black, // Sesuaikan warna dengan kebutuhan
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 380,
            left:
                20, // Sesuaikan dengan posisi horizontal yang diinginkan dari kiri
            right:
                20, // Sesuaikan dengan posisi horizontal yang diinginkan dari kanan
            child: GreenButton(
              onTap: () {
                // Fungsi yang akan dijalankan ketika tombol ditekan
                if (phoneNumberController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Nomor Ponsel tidak boleh kosong"))
                  );
                } else {
                  if (countryCode != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "${countryCode!.dialCode}-${phoneNumberController.text.trim()}")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Silahkan Pilih Kode Negara")));
                  }
                }
              },
              text: 'LANJUT',
            ),
          ),
        ],
      ),
    );
  }
}
