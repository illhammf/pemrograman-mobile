import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 4',
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  // Fungsi untuk menambahkan nilai counter
  void _increment() {
    setState(() {
      _count++;
    });
  }

  // Fungsi untuk mengurangi nilai counter, tetapi tidak boleh negatif
  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  // Fungsi untuk mereset nilai counter ke 0
  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Counter Saya',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          '$_count',
          style: const TextStyle(
            fontSize: 48,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'minus',
            backgroundColor: Colors.deepPurple,
            onPressed: _decrement,
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'reset',
            backgroundColor: Colors.orange,
            onPressed: _reset,
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'plus',
            backgroundColor: Colors.deepPurple,
            onPressed: _increment,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}