import 'package:flutter/material.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;

  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
        // 3shan a5ly rkm el aya b3d el aya nfsha .. fa hrtbha : right to left
        textDirection: TextDirection.rtl);
  }
}
