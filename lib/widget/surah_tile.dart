import 'package:flutter/material.dart';
import 'package:quranku/theme.dart';

// ignore: must_be_immutable
class SurahTile extends StatelessWidget {
  String? nama;
  String? ayat;
  int? jumlah;
  String? nomor;

  SurahTile({super.key, this.nama, this.ayat, this.jumlah, this.nomor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
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
                width: 36,
                height: 36,
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
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama.toString(),
                      style: titleTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${jumlah.toString()} ayat',
                      style: subtitleTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                ayat.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
