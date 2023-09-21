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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 76, 85),
        title: Text('Jackson\s Counter App',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          FloatingActionButton(onPressed: () {
          setState(() {
            counter--;
            print(counter);
          });
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.remove),),  
        FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            print(counter);
          });
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),],
      ),
      ],
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey, Colors.white])),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                counter = 0;
                print(counter);
              });
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                    width: 2.0, color: Color.fromARGB(255, 56, 73, 82)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(counter.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                    child: Text(
                      'reset',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
