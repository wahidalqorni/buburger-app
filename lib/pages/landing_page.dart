import 'package:buburger_app/themes/themes.dart';
import 'package:buburger_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 22,
        ),
        child: ListView(
          children: [
            // kolom search
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Cari burger favoritmu...",
                hintStyle: greyTextstyle,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // banner
            Stack(
              children: [
                Image.asset(
                  "assets/Rectangle6.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.only(left: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 29,
                      ),
                      Text(
                        "KHUSUS PENGGUNA BARU!",
                        style: secodaryTextstyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Dapetin 1 Burger\nbayar dengan COD!",
                        style: blackTextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: secondaryColor),
                        onPressed: null,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: 19,
                            right: 19,
                          ),
                          child: Text(
                            "Beli Sekarang!",
                            style: whiteTextstyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            // text
            Text(
              "Mungkin kamu suka!",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // list product
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                childAspectRatio: 5 / 7,
                mainAxisSpacing: 12,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProductWidget(
                    nama: "Beef Burger",
                    imageUrl: "assets/burger1.png",
                    harga: "IDR 20.000",
                  ),
                  ProductWidget(
                    nama: "Steak Burger",
                    imageUrl: "assets/burger2.png",
                    harga: "IDR 15.000",
                  ),
                  ProductWidget(
                    nama: "Union Burger",
                    imageUrl: "assets/burger3.png",
                    harga: "IDR 10.000",
                  ),
                  ProductWidget(
                    nama: "Regular Burger",
                    imageUrl: "assets/burger4.png",
                    harga: "IDR 5.000",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
