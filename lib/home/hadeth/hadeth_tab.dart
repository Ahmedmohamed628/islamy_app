import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/home/hadeth/item_hadeth_name.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : Theme.of(context).primaryColor,
            thickness: 3),
        Text(AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.titleMedium),
        Divider(
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : Theme.of(context).primaryColor,
            thickness: 3),
        ahadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor))
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                        color: provider.isDarkMode()
                            ? MyTheme.yellowColor
                            : Theme.of(context).primaryColor,
                        thickness: 3);
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeth: ahadethList[index]);
                  },
                  itemCount: ahadethList.length,
                ),
              )
      ],
    );
  }

  // m7ttsh parameter 3shan 3ndy file 1 bs 3ks el quran
  void loadHadethFile() async {
    String ahadethContenet =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    // el \r btsheel el space elmawgoda lma ams7 #
    // hna kda ana b2a 3nde el 50 hadeth kol hadeth lwa7do
    List<String> hadethList = ahadethContenet.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      //jna 5leet kol satr lw7do
      List<String> hadethLines = hadethList[i].split('\n');
      // hna m3nah en awl satr daymn el title
      String title = hadethLines[0];
      //hna ms7t el index 0 3shan yfdl bta3 el title
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
