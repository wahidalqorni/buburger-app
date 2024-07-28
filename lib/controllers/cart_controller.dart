import 'dart:convert';

import 'package:buburger_app/models/Product_model.dart';
import 'package:buburger_app/pages/order_now_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../config/config.dart';
import '../themes/themes.dart';

class CartController extends GetxController {


  // fungsi untuk proses input product ke dalam keranjang
  Future postCart(String productId, String jumlah) async {
    var url = Uri.parse(Config().urlKeranjangPost);

    try {

      final response = await http.post(url, body: {
        'product_id':
            productId, //=> 'product_id' sesuai dengan paramater inputan seperti di postman
        'user_id': SpUtil.getInt("id_user")
            .toString(), //=> 'user_id' sesuai dengan paramater inputan seperti di postman
        'jumlah':
            jumlah, //=> 'jumlah' sesuai dengan paramater inputan seperti di postman
      });

      // print(response.body);

      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {

        // tampilkan snackbar produk berhasil dimasukkan dalam keranjang
        Get.snackbar(
          "Success",
          responseDecode["message"],
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: greenColor,
          colorText: whiteColor,
          showProgressIndicator: true,
          margin: EdgeInsets.only(bottom: 10, top: 10, right: 10, left: 10),
        );
      } else {

        // tampilkan pesan error
        Get.snackbar(
          "Error",
          responseDecode["message"],
          snackPosition: SnackPosition.TOP,
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
      
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: primaryColor,
        colorText: whiteColor,
      );
    }
  }

  // function Saat Pesan sekarang ditap
  Future postCartNow(
      String productId, ProductModel dataProduct, String jumlah) async {
    // siapkan url utk request API pada endpoint https://syntop.poltekbangplg.ac.id/api/keranjang-post
    var url = Uri.parse(Config().urlKeranjangPost);

    try {
      final response = await http.post(url, body: {
        'product_id': productId,
        'user_id': SpUtil.getInt("id_user").toString(),
        'jumlah': jumlah
      });

      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        // ambil bbrp data field/parameter dari response web service
        var idCart = responseDecode["data"]["id"];
        var jumlahBeli = responseDecode["data"]["jumlah"];
        var totHarga = responseDecode["data"]["totalharga"];

        // tampilkan snackbar
        Get.snackbar("Success", responseDecode["message"]);

        // arahkan ke halaman OrderNowPage
        Get.to(OrderNowPage(dataProduct: dataProduct, idCart: idCart, totalharga: totHarga, jumlahBeli: jumlahBeli));
      } else {
        // tampilkan snackbar error
        Get.snackbar(
          "Failed",
          responseDecode["message"],
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
       Get.snackbar(
          "Failed",
          e.toString(),
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );
    }
  }
}
