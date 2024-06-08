import 'package:buburger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class OrderNowPage extends StatefulWidget {
  const OrderNowPage(
      {super.key,
      required this.nama,
      required this.imageUrl,
      required this.harga,
      required this.qty});

  final String nama, imageUrl, harga, qty;

  @override
  State<OrderNowPage> createState() => _OrderNowPageState();
}

class _OrderNowPageState extends State<OrderNowPage> {

  // variabel pilihan default metode pembayaran
  String metodePembayaran = "Cash On Delivery (COD)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Pesan Burger",
          style: blackTextstyle,
        ),
        centerTitle: true,
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
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Row(
              children: [
                // image
                Image.asset(
                  widget.imageUrl,
                  width: 105,
                  height: 105,
                ),
                SizedBox(
                  width: 21,
                ),
                // column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style: blackTextstyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.harga,
                      style: greyTextstyle,
                    ),
                    Text(
                      "Qty : ${widget.qty}",
                      style: greyTextstyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Detail Pemesanan", style: blackTextstyle, ),
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
                    "Alamat",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType:TextInputType.multiline,
                    minLines: 6,
                    maxLines: 6,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Alamat",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: whiteColor
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Metode Pembayaran", style: blackTextstyle, ),
                  DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: greyColor,
                          ),
                        ),
                      ),
                      value: metodePembayaran,
                      items: <String>['Cash On Delivery (COD)', 'Transfer Bank']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: blackTextstyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          metodePembayaran = newValue!;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),

    bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Container(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                  "Konfirmasi",
                  style: blackTextstyle,
                ),
              ),
            ),
          ),
        ),
      ),  
    );
  }
}
