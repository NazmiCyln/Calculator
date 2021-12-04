import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HesapMakinesiButtonu extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  //Button Taslak Parametreleri
  final String metin;
  final int dolguRengi;
  final int metinRengi;
  final double metinBoyutu;
  final Function tiklama;

  const HesapMakinesiButtonu(
      {Key? key,
      required this.metin,
      required this.dolguRengi,
      required this.metinRengi,
      required this.metinBoyutu,
      required this.tiklama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: SizedBox(
        width: 79,
        height: 70,
        child: FlatButton(
          onPressed: () {
            //Butona tıklandığında metin alınacak
            tiklama(metin);
          },
          color: Color(dolguRengi),
          textColor: Color(metinRengi),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            metin,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: metinBoyutu,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
