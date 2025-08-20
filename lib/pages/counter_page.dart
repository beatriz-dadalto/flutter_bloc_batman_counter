import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_made_simple/bloc/counter_bloc.dart';
import 'package:flutter_bloc_made_simple/bloc/counter_event.dart';
import 'package:flutter_bloc_made_simple/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Batman Counter'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                for (int index = 0; index < state.count; index++)
                  Positioned(
                    left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(400).toDouble(),
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset('images/batman-logo.png'),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterResetPressed());
            },
            child: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
