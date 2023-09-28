import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';
import 'package:islamy/home/hadeth/item_hadeth_details.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details-screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
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
          title: Text('${args.title}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Container(
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
          child: ListView.builder(
              itemBuilder: ((context, index) {
                return ItemHadethDetails(content: args.content[index]);
              }),
              itemCount: args.content.length),
        ),
      ),
    ]);
  }
}
