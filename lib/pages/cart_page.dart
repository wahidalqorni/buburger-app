import 'package:buburger_app/config/config.dart';
import 'package:buburger_app/models/Cart_model.dart';
import 'package:buburger_app/services/cart_services.dart';
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
            FutureBuilder<List<CartModel>>(
              future: CartServices.getCartList(),
              builder: (context, snapshot) {
                // saat loading...
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // tampilkan widget CircularProgressIndicator
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                      ...snapshot.data!.map((data) {
                        return CartWidget(
                          dataCart: data,
                        );
                      })
                    ],
                  );
                }

                // defautl agar future builder bisa berfungsi
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
