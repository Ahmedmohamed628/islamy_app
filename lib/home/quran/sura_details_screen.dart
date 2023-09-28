import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/quran/item_sura_details.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'Sura-details-screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    // 3mlt el if 3shan myfdlsh y3m build 3la el fady.. lw el list fadya ynady 3la el function LoadFile
    if (verses.isEmpty) {
      LoadFile(args.index);
    }
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset('assets/images/main_background_dark.png',
              width: double.infinity, height: double.infinity, fit: BoxFit.fill)
          : Image.asset('assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
      Scaffold(
        appBar: AppBar(
          title: Text('${args.name}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: // ha7ot hna conditional operator
            verses.length == 0
                ?
                // hna m3naha lw el list fadia n3rdlo el loading
                Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor))
                :
                // lw msh FADIA HY3RD EL ListView
                Container(
                    // 3shan a5ly el margin y3ml fit 3la ay screen : mediaQuery
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.06,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: provider.isDarkMode()
                            ? MyTheme.primarydark
                            : MyTheme.whiteColor,
                        borderRadius: BorderRadius.circular(24)),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                            color: provider.isDarkMode()
                                ? MyTheme.whiteColor
                                : Theme.of(context).primaryColor,
                            thickness: 3);
                      },
                      itemBuilder: ((context, index) {
                        return ItemSuraDetails(
                            content: verses[index], index: index);
                      }),
                      itemCount: verses.length,
                    ),
                  ),
      ),
    ]);
  }

  void LoadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
