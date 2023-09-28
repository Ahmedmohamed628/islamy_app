import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                : getUnelectedItemWidget(
                    AppLocalizations.of(context)!.english)),
        InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                : getUnelectedItemWidget(AppLocalizations.of(context)!.arabic)),
      ],
    );
  }

// 3mlt function a7dd beha el lo8a elly h5tarha w yt3mlha select
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
                .copyWith(color: Theme.of(context).primaryColor)));
  }
}

// Padding(padding: const EdgeInsets.all(8.0), child:
//           Text(AppLocalizations.of(context)!.arabic, style: Theme.of(context).textTheme.titleMedium)),

//Padding(padding: const EdgeInsets.all(8.0), child:
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(AppLocalizations.of(context)!.english, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor)),
//               Icon(Icons.check_box_rounded, color: Theme.of(context).primaryColor)
//             ],
//           )),
