import 'package:buburger_app/themes/themes.dart';
import 'package:buburger_app/widgets/cart_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 39,
        ),
        child: ListView(
          children: [
            Text(
              "Keranjang",
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),

            // widget cart
            CartWidget(
              nama: "Beef Burger",
              harga: "IDR 20.000",
              imageUrl: "assets/burger1.png",
              qty: "1",
            ),
            CartWidget(
              nama: "Onion Burger",
              harga: "IDR 23.000",
              imageUrl: "assets/burger3.png",
              qty: "1",
            ),
            CartWidget(
              nama: "Steak Burger",
              harga: "IDR 20.000",
              imageUrl: "assets/burger2.png",
              qty: "1",
            ),
          ],
        ),
      ),
    );
  }
}
