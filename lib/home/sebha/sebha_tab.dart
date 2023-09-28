import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../provider/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      // padding: EdgeInsets.all(80),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Transform.rotate(
                angle: 50,
                // alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: InkWell(
                    onTap: () {},
                    child: provider.isDarkMode()
                        ? Image.asset('assets/images/sebha_body_dark.png')
                        : Image.asset('assets/images/sebha_body.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 120, left: 110),
                child: provider.isDarkMode()
                    ? Image.asset('assets/images/sebha_head_dark.png')
                    : Image.asset('assets/images/sebha_head.png'),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 120, left: 110),
              //   child: Image.asset('assets/images/sebha_head.png'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 75),
              //   child: Image.asset('assets/images/sebha_body.png'),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(AppLocalizations.of(context)!.number_of_tasbeh,
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleSmall),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.primarydark
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: Text('30',
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.blackColor)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text('سبحان الله',
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.blackColor)
                    : Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)),
          ),
        ],
      ),
    );
  }
}

//   double _rotation = 0;
//
//   void _onPressed() {
//     setState(() {
//       _rotation = _rotation + (pi / 4 + new Random().nextInt(100));
//     });
//   }
// }

//Transform.rotate(
//                   angle: _rotation,
//                 child: Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/sebha_body.png')))
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _onPressed,
//                 child: Text("Rotate"),
//               ),
//===================================================================
// Transform.rotate(
//   angle: Math.pi / 180 * 45,
//   alignment: Alignment.center,
//   child: Container(
//     height: MediaQuery.of(context).size.height - 130,
//     alignment: Alignment.center,
//     child:   Image.asset('assets/images/sebha_body.png'),
//   ),
// ),
