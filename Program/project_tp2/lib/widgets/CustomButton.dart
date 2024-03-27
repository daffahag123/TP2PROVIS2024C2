import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_scale),
        child: Container(
          width: 350, // Lebar kontainer tombol
          height: 55, // Tinggi kontainer tombol
          decoration: BoxDecoration(
            color: Colors.white, // Warna latar belakang kontainer tombol
            borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // Warna bayangan
                spreadRadius: 2, // Radius penyebaran bayangan
                blurRadius: 3, // Radius blur bayangan
                offset: Offset(3, 3), // Posisi offset bayangan (x, y)
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 15),
              Icon(
                widget.iconData, // Icon di sisi kiri
                color: Colors.black, // Warna ikon
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  widget.text, // Teks di tengah
                  style: TextStyle(
                    fontSize: 16, // Ukuran teks
                    color: Colors.black, // Warna teks
                    fontWeight: FontWeight.bold, // Ketebalan teks
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios, // Icon panah ke kanan di sisi kanan
                color: Colors.black, // Warna ikon
              ),
              SizedBox(width: 15), // Atur jarak antara teks dan panah
            ],
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }
}
