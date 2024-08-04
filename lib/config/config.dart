import 'package:intl/intl.dart';

class Config {

  // sediakan variabel penampung alamat url web service
  static String urlAPI = "https://syntop.poltekbangplg.ac.id/api";
  // sedaiakan variabel penampung alamat url main website (digunakan untuk ambil path file/gambar dr backend)
  static String urlMain = "https://syntop.poltekbangplg.ac.id/";

  String movieUrl = "https://api.themoviedb.org/3/discover/movie?api_key=8b5d575fbdb689dd6874a773130696b4&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate";

  // variabel end point yg akan dipakai
  // login, register, logout
  String urlLogin = "$urlAPI/login";
  String urlRegister = "$urlAPI/register";
  String urlLogout = "$urlAPI/logout";

  // product (burger)
  String urlProdRekomen = "$urlAPI/product-rekomendasi";
  String urlProdAll = "$urlAPI/product-list";
  String urlProdNew = "$urlAPI/product-new";
  String urlProdSearch = "$urlAPI/product-search?keyword=";

  // keranjang
  String urlKeranjangPost = "$urlAPI/keranjang-post";
  String urlKeranjangList = "$urlAPI/keranjang-list?user_id=";
  String urlKeranjangDelete = "$urlAPI/keranjang-delete";

  // checkout
  String urlCheckoutPost = "$urlAPI/checkout-post";
  String urlCheckoutPostById = "$urlAPI/checkout-post-by-id";
  String urlCheckoutListAll = "$urlAPI/checkout-list-all?user_id=";
  String urlCheckoutListBaru = "$urlAPI/checkout-list-baru?user_id=";
  String urlCheckoutListProses = "$urlAPI/checkout-list-proses?user_id=";
  String urlCheckoutListSelesai = "$urlAPI/checkout-list-selesai?user_id=";

  // upload bukti bayar
  String uploadBuktiBayar = "$urlAPI/upload-bukti-bayar";

  // membuat fungsi currency
  static String convertToIdr(dynamic nominal, int decimalDigit) {
    
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: decimalDigit,
    );

    return currencyFormatter.format(nominal);
  }

}