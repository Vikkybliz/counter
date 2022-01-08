import 'package:bloc_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(BlocProvider(
      create: (context) => CounterCubit(),
      child: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter bloc example'),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text('Increment'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  }),
              const SizedBox(height: 10),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(state.count.toString(), style: const TextStyle(fontSize: 30));
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  child: const Text('Decrement'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  }),
            ],
          ))),
    );
  }
}
