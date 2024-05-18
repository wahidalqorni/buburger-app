import 'package:buburger_app/pages/login_page.dart';
import 'package:buburger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class DaftarPage extends StatelessWidget {
  const DaftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height * 0.10),
        child: ListView(
          children: [
            Text(
              "Buat Akun",
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Buat Akun untuk mulai pesan",
              style: greyTextstyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              "Nama Lengkap",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Masukkan Nama Lengkap",
                hintStyle: greyTextstyle,
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
              "Nomor Telepon",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Masukkan Nomor Telepon",
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

           
            SizedBox(
              height: 60,
            ),

            // button
            Container(
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: null,
                child: Text(
                  "Buat Akun",
                  style: blackTextstyle,
                ),
              ),
            ),

            // belum punya akun? ....
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: blackTextstyle,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage() ));
                  },
                  child: Text(
                    " Masuk",
                    style: secodaryTextstyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
