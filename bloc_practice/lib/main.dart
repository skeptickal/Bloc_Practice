import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: BlocPractice(),
  ));
}

class BlocPractice extends StatefulWidget {
  const BlocPractice({super.key});

  @override
  State<BlocPractice> createState() => _BlocPracticeState();
}

class _BlocPracticeState extends State<BlocPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('bloc practice app',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(width: 2.0, color: Colors.blueGrey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              Text(
                'Blocs!',
                style: GoogleFonts.montserrat(
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
