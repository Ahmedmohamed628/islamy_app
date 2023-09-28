import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';
import 'package:islamy/home/quran/quran_tab.dart';
import 'package:islamy/home/radio/radio_tab.dart';
import 'package:islamy/home/sebha/sebha_tab.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:islamy/settings/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset('assets/images/main_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill)
            : Image.asset('assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
        Scaffold(
          // hna 3shan el scaffold my8teesh 3la el background elly wrah
          // h3mlha comment 3shan 3ml class ysm3 f kol el screens bdl ma akrr
          //////backgroundColor: Colors.transparent,
          appBar: AppBar(
            // hna 3shan el appBar lono yro7 5als 3shan tban el background elly wrah
            //////backgroundColor: Colors.transparent,
            // el elevation 3shan el shadow bta3 el appBar y5tfy
            //////elevation: 0,
            title: Text(AppLocalizations.of(context)!.app_title,

                /// hna fe [theme.of(context)] ana gebt el theme bta3 el app kolo..
                /// lw sh8al light mode haygeeb el light , lw sh8al dark mode haygeeb el dark
                style: Theme.of(context).textTheme.titleLarge),
          ),

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(

                    /// bst5dmha lma yb2a 3ndy image w 3ayz a7otha icon f el screen
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(

                    /// bst5dmha lma yb2a 3ndy image w 3ayz a7otha icon f el screen
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(

                    /// bst5dmha lma yb2a 3ndy image w 3ayz a7otha icon f el screen
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    ),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(

                    /// bst5dmha lma yb2a 3ndy image w 3ayz a7otha icon f el screen
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(

                    /// bst5dmha lma yb2a 3ndy image w 3ayz a7otha icon f el screen
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),

          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
}
