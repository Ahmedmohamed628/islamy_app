import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text('$content ${{index + 1}}',
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
        // 3shan a5ly rkm el aya b3d el aya nfsha .. fa hrtbha : right to left
        textDirection: TextDirection.rtl);
  }
}
