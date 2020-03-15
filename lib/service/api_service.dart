import 'dart:convert';

import 'package:contoh/model/response_barang_model.dart';
import 'package:contoh/model/response_post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final _host = 'http://192.168.84.146/server_inventory/index.php/api';

  static Future<List<Barang>> getListBarang() async {
    List<Barang> listBarang = [];
    final response = await http.get('$_host/getbarang'); //data json

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      ResponseBarang respBarang = ResponseBarang.fromJson(json);

      respBarang.barang.forEach((item) {
        listBarang.add(item);
      });

      return listBarang;
    } else {
      return [];
    }
  }

  Future<ResponsePost> postBarang(nama, jumlah, gambar) async {

    final response = await http
        .post('$_host/insertbarang', body: {'nama': nama, 'jumlah': jumlah, 'gambar': gambar});

    if (response.statusCode == 200) {
      ResponsePost responseRequest =
          ResponsePost.fromJson(jsonDecode(response.body));

      return responseRequest;
    } else {
      return null;
    }
  }

  Future<ResponsePost> updateBarang(id, nama, jumlah, gambar) async {

    final response = await http.post('$_host/updatebarang',
        body: {"id": id, 'nama': nama, 'jumlah': jumlah, 'gambar': gambar});

    if (response.statusCode == 200) {
      ResponsePost responseRequest =
          ResponsePost.fromJson(jsonDecode(response.body));
      return responseRequest;
    } else {
      return null;
    }
  }

  Future<ResponsePost> delBarang(id) async {

    final response = await http.post('$_host/deletebarang', body: {'id': id});

    if (response.statusCode == 200) {
      ResponsePost responseRequest =
          ResponsePost.fromJson(jsonDecode(response.body));

      return responseRequest;
    } else {
      return null;
    }
  }
}
