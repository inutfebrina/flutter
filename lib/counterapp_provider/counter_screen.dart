import 'package:flutter/material.dart';
import 'package:flutter_day1/counterapp_provider/counter_provider.dart';
import 'package:provider/provider.dart';

class PageCounterScreen extends StatelessWidget {
  const PageCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tombol ditekan sebanyak :'),
            Text(
              '${count.value}',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().decrement();
              },
              child: Text('Descrement'),
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
