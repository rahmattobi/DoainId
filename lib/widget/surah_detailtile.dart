import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:quranku/theme.dart';

// ignore: must_be_immutable
class SurahTileDetail extends StatefulWidget {
  String? nama;
  String? arti;
  String? surah;
  String? type;
  String? jumlah;
  SurahTileDetail({
    super.key,
    this.nama,
    this.arti,
    this.surah,
    this.type,
    this.jumlah,
  });

  @override
  State<SurahTileDetail> createState() => _SurahTileDetailState();
}

class _SurahTileDetailState extends State<SurahTileDetail> {
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;

  Duration position = const Duration();

  int audioDuration = 0;
  int timeProgress = 0;

  void getAudio() async {
    if (isPlaying) {
      setState(() {
        audioPlayer.pause();
        isPlaying = false;
      });
    } else {
      setState(() {
        audioPlayer.play(UrlSource(widget.surah!));
        isPlaying = true;
      });
    }
  }

  void newDuration(int sec) {
    Duration newPosition = Duration(seconds: sec);
    audioPlayer.seek(newPosition);
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inMilliseconds;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primaryColor,
            const Color.fromARGB(255, 12, 88, 88),
          ],
        ),
        color: primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/bismillah.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.nama.toString(),
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.arti.toString(),
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 60, 60, 68).withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(10, 5),
                    blurRadius: 10,
                    color: titleColor.withOpacity(0.3),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      getAudio();
                    },
                    child: Icon(
                      isPlaying == false ? Icons.play_arrow : Icons.pause,
                      color: primaryColor,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      min: 0,
                      max: (audioDuration / 1000).floorToDouble(),
                      value: (timeProgress / 1000).floorToDouble(),
                      activeColor: primaryColor,
                      onChanged: (value) {
                        setState(() {
                          newDuration(value.toInt());
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.type!,
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
                Text(
                  '${widget.jumlah.toString()} ayat',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
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
