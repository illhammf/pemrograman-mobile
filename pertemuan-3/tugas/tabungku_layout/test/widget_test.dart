
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tabungku_layout/main.dart';

void main() {
  testWidgets('Halaman Ringkasan Tabungan berhasil ditampilkan',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RingkasanPage(),
      ),
    );

    // Memastikan halaman utama berhasil ditampilkan.
    expect(find.byType(RingkasanPage), findsOneWidget);

    // Memastikan halaman memiliki Scaffold dan AppBar.
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });
}
