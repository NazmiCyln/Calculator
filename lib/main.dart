import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesap_makinesi/widgets/buttontasarimi.dart';

void main() {
  runApp(HesapMakinesi());
}

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  _HState createState() => _HState();
}

class _HState extends State<HesapMakinesi> {
  //Tutucular
  late int sayi1;
  late int sayi2;
  String gosterilecekSayi = "";
  String islemGecmisi = "";
  late String sonuc;
  late String islemTutucu;

  //Buton tıklama olayı
  void btnTiklama(String buttonDegeriTutucu) {
    print(buttonDegeriTutucu);

    if (buttonDegeriTutucu == "AC") {
      //All Clear
      gosterilecekSayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
      islemGecmisi = "";
      islemTutucu = "";
    }
    else if (buttonDegeriTutucu == "C") {
      //Clear
      gosterilecekSayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
    }
    else if (buttonDegeriTutucu == "BACK") {
      //Back
      //gosterilecek sayının uzunluğunu birer birer azalat
      sonuc = gosterilecekSayi.substring(0, gosterilecekSayi.length-1);
    }
    else if (buttonDegeriTutucu == "/") {
      //Gösterilen sayıyı sayı 1'e aktar
      //yazılan sayıyı integer'a çevirip sayı1 'e aktar, sonuc kısmını temizle, /'yı "islemTutucu" değişkeninde tut
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "X") {
      //Gösterilen sayıyı sayı 1'e aktar
      //yazılan sayıyı integer'a çevirip sayı1 'e aktar, sonuc kısmını temizle, X'yı "islemTutucu" değişkeninde tut
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "-") {
      //Gösterilen sayıyı sayı 1'e aktar
      //yazılan sayıyı integer'a çevirip sayı1 'e aktar, sonuc kısmını temizle, -'yi "islemTutucu" değişkeninde tut
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "+") {
      //Gösterilen sayıyı sayı 1'e aktar
      //yazılan sayıyı integer'a çevirip sayı1 'e aktar, sonuc kısmını temizle, +'yı "islemTutucu" değişkeninde tut
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    }
    else if (buttonDegeriTutucu == "=") {
      //sayı2 yi ata hangi işlemse yaptır
      sayi2 = int.parse(gosterilecekSayi);

      //basılan işleme göre işlemi seç
      //Toplama yap
      if (islemTutucu == "+") {
        sonuc = (sayi1 + sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
      //Çıkartma yap
      else if (islemTutucu == "-") {
        sonuc = (sayi1 - sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
      //Çarpma yap
      else if (islemTutucu == "X") {
        sonuc = (sayi1 * sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
      //Bölme yap
      else if (islemTutucu == "/") {
        sonuc = (sayi1 / sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
    }
    else if (buttonDegeriTutucu == "+/-") {
      //pozitifse negetif yap, negatifse pozitif yap
      if (gosterilecekSayi[0] != "-")
        {
          //Başında eksi yoksa
          sonuc = "-"+gosterilecekSayi;
        }
      else {
        sonuc = gosterilecekSayi.substring(1);
      }

    }
    //Rakamlara tıklandığında yapılacak
    else {
      sonuc = int.parse(gosterilecekSayi + buttonDegeriTutucu).toString();
    }

    //Durum yenileme işlemi
    setState(() {
      gosterilecekSayi = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //sağ üstte duran debug kırmızı şeriti kaldırıyoruz
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          title: const Text(
            "Hesap Makinesi",
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                child: Text(
                  islemGecmisi,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 26,
                      color: Color(0xff767676),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                child: Text(
                  gosterilecekSayi,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButtonu(
                  metin: "AC",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "C",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 28.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "BACK",
                  dolguRengi: 0xFF949706,
                  metinRengi: 0xFFFFFFFF,
                  metinBoyutu: 18.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "/",
                  dolguRengi: 0xFF949706,
                  metinRengi: 0xFFFFFFFF,
                  metinBoyutu: 28.0,
                  tiklama: btnTiklama,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButtonu(
                  metin: "7",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "8",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "9",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "X",
                  dolguRengi: 0xFF949706,
                  metinRengi: 0xFFFFFFFF,
                  metinBoyutu: 28.0,
                  tiklama: btnTiklama,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButtonu(
                  metin: "4",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "5",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "6",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "-",
                  dolguRengi: 0xFF949706,
                  metinRengi: 0xFFFFFFFF,
                  metinBoyutu: 35.0,
                  tiklama: btnTiklama,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButtonu(
                  metin: "1",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "2",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "3",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "+",
                  dolguRengi: 0xFF949706,
                  metinRengi: 0xFFFFFFFF,
                  metinBoyutu: 32.0,
                  tiklama: btnTiklama,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapMakinesiButtonu(
                  metin: "+/-",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 27.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "0",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 28.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "00",
                  dolguRengi: 0xFF16BFAC,
                  metinRengi: 0xFF000000,
                  metinBoyutu: 28.0,
                  tiklama: btnTiklama,
                ),
                HesapMakinesiButtonu(
                  metin: "=",
                  dolguRengi: 0xFF949706,
                  metinRengi: 0xFFFFFFFF,
                  metinBoyutu: 32.0,
                  tiklama: btnTiklama,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
