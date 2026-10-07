import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/komentar.dart';
import '../models/post.dart';

class ApiService {
  static const String baseUrl =
      'https://jsonplaceholder.typicode.com';

  Future<List<Post>> ambilPosts() async {
    final uri = Uri.parse('$baseUrl/posts');

    final response = await http
        .get(uri)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal memuat postingan '
        '(kode ${response.statusCode})',
      );
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data
        .map(
          (item) => Post.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<List<Komentar>> ambilKomentar(
    int postId,
  ) async {
    final uri = Uri.parse(
      '$baseUrl/posts/$postId/comments',
    );

    final response = await http
        .get(uri)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal memuat komentar '
        '(kode ${response.statusCode})',
      );
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data
        .map(
          (item) => Komentar.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}