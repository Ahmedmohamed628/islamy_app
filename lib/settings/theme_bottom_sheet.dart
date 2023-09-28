import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            //dark
            child: provider.isDarkMode()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnelectedItemWidget(AppLocalizations.of(context)!.dark)),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            //light
            child: provider.isDarkMode()
                ? getUnelectedItemWidget(AppLocalizations.of(context)!.light)
                : getSelectedItemWidget(AppLocalizations.of(context)!.light)),
      ],
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).primaryColorDark)),
            Icon(Icons.check_box_rounded, color: Theme.of(context).primaryColor)
          ],
        ));
  }

  Widget getUnelectedItemWidget(String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.primarydark)));
  }
}

//provider.appTheme == ThemeMode.light ?
//           getSelectedItemWidget(AppLocalizations.of(context)!.light)
//               : getUnelectedItemWidget(AppLocalizations.of(context)!.light)
