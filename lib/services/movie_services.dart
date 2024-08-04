import 'dart:convert';

import 'package:buburger_app/models/Movie_model.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class MovieService {
  // function menampilkan keranjang
  Future<List<MovieModel>> listMovie() async {
    // siapkan variabel untuk menyimpan list prooduct
    List<MovieModel> listMovie = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get(Uri.parse(Config().movieUrl));

      // jika hasil output pd request status codenya adalah 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listMovieResponse = responseBody['results'];
        // isikan variabel listMovie di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listMovieResponse yg sudah menerima response dr web service
        listMovieResponse.forEach((data) {
          listMovie.add(MovieModel.fromJson(data));
        });
      } else {
        listMovie = [];
      }
    } catch (e) {
      print(e);
    }
    return listMovie;
  }
}