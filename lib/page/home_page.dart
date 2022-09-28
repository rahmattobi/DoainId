import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quranku/model/surah_model.dart';
import 'package:quranku/service/surah_service.dart';
import 'package:quranku/theme.dart';
import 'package:quranku/widget/skelton/skelton_card.dart';
import 'package:quranku/widget/skelton/skelton_tile.dart';
import '../widget/surah_card.dart';
import '../widget/surah_detailtile.dart';
import '../widget/surah_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Surah>? _surah;
  bool? _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    SurahService.getSurah().then((surah) {
      setState(() {
        _surah = surah;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double myheight = height * 0.90;
    TabController tabController = TabController(length: 2, vsync: this);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qur\'an ku',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Welcome, Rahmattobi',
              style: subtitleTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
            Container(
                height: 140,
                margin: EdgeInsets.only(
                  top: defaultMargin,
                ),
                child: _loading!
                    ? ListView.builder(
                        itemCount: null,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const SkeltonCard(),
                      )
                    : ListView.builder(
                        itemCount: null == _surah ? 0 : _surah!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Surah surah = _surah![index];
                          return SurahCard(
                            nama: surah.nama,
                            arti: surah.arti,
                          );
                        },
                      )),
          ],
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelColor: primaryColor,
                indicatorColor: primaryColor,
                unselectedLabelColor: subtitleColor,
                labelStyle: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const Tab(text: 'Makkiyah'),
                  const Tab(text: 'Madaniyah'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            width: double.infinity,
            height: 500,
            child: TabBarView(
              controller: tabController,
              children: [
                _loading!
                    ? ListView.builder(
                        itemCount: null,
                        itemBuilder: (context, index) => const SkeltonTile(),
                      )
                    : ListView.builder(
                        itemCount: null == _surah ? 0 : _surah!.length,
                        itemBuilder: (context, index) {
                          Surah surah = _surah![index];
                          return GestureDetector(
                            onTap: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) => SafeArea(
                                  child: Container(
                                    height: myheight,
                                    margin: EdgeInsets.only(
                                      left: defaultMargin,
                                      right: defaultMargin,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SurahTileDetail(
                                            nama: surah.nama,
                                            arti: surah.arti,
                                            surah: surah.audio,
                                            type: surah.type.toString(),
                                            jumlah: surah.ayat.toString(),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            surah.keterangan!,
                                            style: subtitleTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: medium,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: surah.type == 'mekah'
                                ? SurahTile(
                                    nama: surah.nama,
                                    jumlah: surah.ayat,
                                    nomor: surah.nomor,
                                    ayat: surah.asma,
                                  )
                                : Container(),
                          );
                        },
                      ),
                _loading!
                    ? ListView.builder(
                        itemCount: null,
                        itemBuilder: (context, index) => const SkeltonTile(),
                      )
                    : ListView.builder(
                        itemCount: null == _surah ? 0 : _surah!.length,
                        itemBuilder: (context, index) {
                          Surah surah = _surah![index];
                          return GestureDetector(
                            onTap: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) => Container(
                                  height: height,
                                  margin: EdgeInsets.only(
                                    top: defaultMargin,
                                    left: defaultMargin,
                                    right: defaultMargin,
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 30,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SurahTileDetail(
                                          nama: surah.nama,
                                          arti: surah.arti,
                                          surah: surah.audio,
                                          type: surah.type.toString(),
                                          jumlah: surah.ayat.toString(),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          surah.keterangan!,
                                          style: subtitleTextStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: medium,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: surah.type == 'madinah'
                                ? SurahTile(
                                    nama: surah.nama,
                                    jumlah: surah.ayat,
                                    nomor: surah.nomor,
                                    ayat: surah.asma,
                                  )
                                : Container(),
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
