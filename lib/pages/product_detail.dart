import 'package:buburger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.nama, required this.imageUrl, required this.harga });

  String nama, imageUrl, harga;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Burger",
          style: blackTextstyle,
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Image.asset(
              widget.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style: blackTextstyle,
                    ),
                    Text(
                      widget.harga,
                      style: greyTextstyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/ic-kurang.png",
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("1"),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/ic-tambah.png",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
            // Detail

            // Komposisi
          ],
        ),
      ),
      // BottomNavigation
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // keranjang
            Container(
              width: 150,
              height: 42,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 19,
                    right: 19,
                  ),
                  child: Text(
                    "+ Keranjang",
                    style: blackTextstyle,
                  ),
                ),
              ),
            ),

            // Pesan Sekarang
            Container(
              width: 150,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: redColor, width: 2 ),
              ),
              child: Center(child: Text("Pesan Sekarang", style: secodaryTextstyle,)),
            ),
          ],
        ),
      ),
    );
  }
}
