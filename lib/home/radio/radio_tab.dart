import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../provider/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Image.asset('assets/images/radio_image.png'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text('اذاعة القرأن الكريم',
                  style: provider.isDarkMode()
                      ? Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: MyTheme.whiteColor)
                      : Theme.of(context).textTheme.titleMedium)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.skip_previous,
                        color: provider.isDarkMode()
                            ? MyTheme.yellowColor
                            : Theme.of(context).primaryColor,
                        size: 40)),
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.play_arrow,
                        color: provider.isDarkMode()
                            ? MyTheme.yellowColor
                            : Theme.of(context).primaryColor,
                        size: 50)),
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.skip_next,
                        color: provider.isDarkMode()
                            ? MyTheme.yellowColor
                            : Theme.of(context).primaryColor,
                        size: 40))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
