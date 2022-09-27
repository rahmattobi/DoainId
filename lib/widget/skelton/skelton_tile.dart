import 'package:flutter/material.dart';
import 'package:quranku/widget/skelton/skelton.dart';

class SkeltonTile extends StatelessWidget {
  const SkeltonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.only(
        top: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Skelton(
                width: 36,
                height: 36,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Skelton(
                      width: 150,
                      height: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      width: 120,
                      height: 15,
                    ),
                  ],
                ),
              ),
              const Skelton(
                width: 120,
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
