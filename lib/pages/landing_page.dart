import 'package:buburger_app/models/Product_model.dart';
import 'package:buburger_app/pages/search_page.dart';
import 'package:buburger_app/services/product_services.dart';
import 'package:buburger_app/themes/themes.dart';
import 'package:buburger_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController keyword = TextEditingController();

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
              controller: keyword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    Get.to(SearchPage(keyword: keyword.text));
                  },
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

            // loading data menggunakan widget FutureBuilder
            FutureBuilder<List<ProductModel>>(
              // untuk memanggil data
              future: ProductServices.getProductList(),
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
                }
                // setelah data didapatkan
                else if (snapshot.hasData) {
                  return // list product
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
                        ...snapshot.data!.map((data) { 
                          return ProductWidget(dataProduct: data);
                        })
                      ],
                    ),
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
