import 'package:buburger_app/controllers/auth_controller.dart';
import 'package:buburger_app/pages/daftar_page.dart';
import 'package:buburger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // buat variabel utk memanggil auth_controller yg sdh dibuat
    final authC = Get.put(AuthController());

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height * 0.10),
        child: ListView(
          children: [
            Text(
              "Masuk",
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Masuk dengan akun yang terdaftar",
              style: greyTextstyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: authC.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Masukkan Email",
                hintStyle: greyTextstyle,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: authC.password,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.visibility),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Masukkan Password",
                hintStyle: greyTextstyle,
              ),
            ),

            // lupa password?
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Lupa Password?",
                style: secodaryTextstyle,
              ),
            ),
            SizedBox(
              height: 60,
            ),

            // button
            Obx(() => Container(
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      authC.login();
                    },
                    child: authC.isLoading == true ? CircularProgressIndicator(
                      color: whiteColor,
                    ) :  Text(
                      "Masuk",
                      style: blackTextstyle,
                    ),
                  ),
                )),

            // belum punya akun? ....
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum punya akun?",
                  style: blackTextstyle,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaftarPage()));
                    },
                    child: Text(
                      " Daftar",
                      style: secodaryTextstyle,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
