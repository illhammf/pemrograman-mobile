import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pengguna {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;

  const Pengguna({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Pengguna',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const PenggunaPage(),
    );
  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengguna'),
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
              child: Text(
                'Terjadi kesalahan:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          final data = snapshot.data ?? [];

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
                title: Text(pengguna.name),
                subtitle: Text(pengguna.email),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPenggunaPage(
                        pengguna: pengguna,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPenggunaPage extends StatelessWidget {
  final Pengguna pengguna;

  const DetailPenggunaPage({
    super.key,
    required this.pengguna,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pengguna.name),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(pengguna.email),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(pengguna.phone),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(pengguna.website),
          ),
        ],
      ),
    );
  }
}