import 'package:flutter/material.dart';
import 'package:quranku/widget/skelton/skelton.dart';
import 'package:quranku/theme.dart';

class SkeltonCard extends StatelessWidget {
  const SkeltonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 131,
        width: 326,
        margin: const EdgeInsets.only(
          right: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: defaultMargin,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Skelton(
                          width: 150,
                          height: 20,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Skelton(
                      width: 130,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Spacer(),
                    const Skelton(
                      width: 120,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 15,
              ),
              child: const Skelton(
                width: 120,
                height: 120,
              ),
            ),
          ],
        ));
  }
}
