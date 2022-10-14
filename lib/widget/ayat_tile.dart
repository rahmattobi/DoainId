import 'package:flutter/material.dart';
import 'package:quranku/theme.dart';

// ignore: must_be_immutable
class AyatTile extends StatelessWidget {
  String? nama;
  String? ayat;
  int? jumlah;
  String? nomor;

  AyatTile({super.key, this.nama, this.ayat, this.jumlah, this.nomor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 15,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border(
          bottom: BorderSide(
            color: subtitleColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/nomor.png'),
                  ),
                ),
                child: Center(
                  child: Text(
                    nomor.toString(),
                    style: subtitleTextStyle.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      nama.toString(),
                      style: titleTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      nama.toString(),
                      style: titleTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
