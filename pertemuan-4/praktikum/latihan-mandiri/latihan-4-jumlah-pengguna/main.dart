import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 4',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const PenggunaPage(),
    );
  }
}

class Pengguna {
  final int id;
  final String name;
  final String email;

  const Pengguna({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}

Future<List<Pengguna>> ambilPengguna() async {
  final uri = Uri.parse(
    'https://jsonplaceholder.typicode.com/users',
  );

  final response = await http
      .get(uri)
      .timeout(const Duration(seconds: 10));

  if (response.statusCode != 200) {
    throw Exception(
      'Gagal memuat data (kode ${response.statusCode})',
    );
  }

  final List<dynamic> data = jsonDecode(response.body);

  return data
      .map(
        (item) => Pengguna.fromJson(
          item as Map<String, dynamic>,
        ),
      )
      .toList();
}

class PenggunaPage extends StatefulWidget {
  const PenggunaPage({super.key});

  @override
  State<PenggunaPage> createState() => _PenggunaPageState();
}

class _PenggunaPageState extends State<PenggunaPage> {
  late Future<List<Pengguna>> _future;

  @override
  void initState() {
    super.initState();
    _future = ambilPengguna();
  }

  void _muatUlang() {
    setState(() {
      _future = ambilPengguna();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<List<Pengguna>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Daftar Pengguna (${snapshot.data!.length})',
              );
            }

            return const Text(
              'Daftar Pengguna',
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: _muatUlang,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Pengguna>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 50,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _muatUlang,
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final pengguna = data[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    pengguna.name[0],
                  ),
                ),
                title: Text(
                  pengguna.name,
                ),
                subtitle: Text(
                  pengguna.email,
                ),
              );
            },
          );
        },
      ),
    );
  }
}