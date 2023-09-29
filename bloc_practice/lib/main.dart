import 'package:bloc_practice/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BlocProvider<CounterCubit>(
    create: (context) => CounterCubit(),
    child: const MaterialApp(
      home: BlocPractice(),
    ),
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
        backgroundColor: const Color.fromARGB(255, 59, 76, 85),
        title: Text('Jackson\'s Counter App',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueGrey, Colors.white]),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<CounterCubit>(context).reset();
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                    width: 2.0, color: const Color.fromARGB(255, 56, 73, 82)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {
                      if (state.wasIncremented == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Incremented'),
                          duration: Duration(
                            milliseconds: 300,
                          ),
                        ));
                      } else if (state.wasIncremented == false) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Decremented'),
                          duration: Duration(
                            milliseconds: 300,
                          ),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        state.counterValue.toString(),
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      );
                    },
                  ),
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
