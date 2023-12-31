import 'package:flutter/material.dart';
import 'package:islamic_demo/home/Hadeth/hadeth_tab.dart';
import 'package:islamic_demo/home/Quran/quran_tab.dart';
import 'package:islamic_demo/home/Radio_tab/Radio_Tab.dart';
import 'package:islamic_demo/home/sebha_Tab/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_demo/home/settings_Tab/settings_tab.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = '';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
     return Stack(
        children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.headline1),
        ),
        bottomNavigationBar:
        Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png'),
                  ),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png'),
                  ),
                  label: AppLocalizations.of(context)!.sebha),

              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png'),
                  ),
                  label:AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'settings'),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    ]);
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(),RadioTab(),SettingsTab() ];
}
