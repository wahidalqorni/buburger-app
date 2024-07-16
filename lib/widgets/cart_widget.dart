import 'package:buburger_app/models/Cart_model.dart';
import 'package:buburger_app/themes/themes.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class CartWidget extends StatefulWidget {
  CartWidget({super.key, required this.dataCart, });

  final CartModel dataCart;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
           widget.dataCart.gambar,
            width: 150,
            height: 150,
          ),
          // SizedBox(
          //   width: 20,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.dataCart.namaProduct,
                style: blackTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                Config.convertToIdr(int.parse(widget.dataCart.totalharga),0),
                style: greyTextstyle,
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
                  Text(
                    widget.dataCart.jumlah,
                    style: blackTextstyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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

              // button pesan
              Container(
                width: 84,
                // height: 30,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: null,
                  child: Text("Pesan"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
