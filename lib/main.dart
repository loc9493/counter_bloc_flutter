import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/bloc/bloc.dart';

import 'bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        builder: (context) {
          return CounterBloc();
        },
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc blocData = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Otakusan"),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            print(state.counter.toString());
            return Center(child: Text("Counter: ${state.counter.toString()}", style: TextStyle(fontSize: 45),));
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                blocData.dispatch(Increase());
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                blocData.dispatch(Decrease());
              },
            )
          ],
        ),
      ),
    );
  }
}
