import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_details_screen.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'hadeth_tab.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(hadeth.title,
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.whiteColor)
              : Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center),
    );
  }
}
