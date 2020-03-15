import 'package:contoh/screen/halaman_beranda.dart';
import 'package:contoh/screen/halaman_tambah_edit.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: HalamanBeranda.id,
      routes: {
        HalamanBeranda.id: (context) => HalamanBeranda(),
        HalamanTambahEdit.id: (context) => HalamanTambahEdit()
      },
    );
  }
}
