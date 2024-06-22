import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    this.obscure = false,
    this.hint = "",
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.bold = false,
  });

  final TextEditingController controller;
  final bool obscure;
  final String hint;
  final Color color;
  final Color textColor;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        style: GoogleFonts.lato(
          color: textColor,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.lato(
            color: textColor,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
          ),
          fillColor: color,
          filled: true,
        ),
      ),
    );
  }
}

class CircularDesign extends StatelessWidget {
  final double x;
  final double y;
  final double z;
  final double radius;
  final double opacity;
  final Color color;
  const CircularDesign({
    super.key,
    required this.radius,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.opacity = 0.1,
    this.color = MyColors.Navy2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      transform: Matrix4.translationValues(x, y, z),
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class BannerType extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h - 100);
    path.quadraticBezierTo(w / 2, h + 80, w, h - 100);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
    this.size = 25,
  });
  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: BannerType(),
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.Rosewood,
            ),
            height: 150,
            width: double.infinity,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "${title}",
                style: GoogleFonts.aBeeZee(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
            transform: Matrix4.translationValues(
                -MediaQuery.of(context).size.width / 2 + 35, -45, 0),
            child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
            print("pressed");
          },
          icon: const Icon(
            Icons.menu,
            color: MyColors.Peach,
            size: 30,
          ),
        )),
      ],
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    super.key,
    required this.width,
    this.color = Colors.black,
  });

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        transform: Matrix4.translationValues(-width / 2 + 30, -60, 0),
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(
            Icons.menu,
            size: 30,
            color: color,
          ),
        ),
      );
    });
  }
}
