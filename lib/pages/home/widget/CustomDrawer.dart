import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/config/constants.dart';
import '../../../core/config/pages_route_name.dart';
import '../../../main.dart';

class CustomDrawer extends StatelessWidget {
  Function onDrawerClicked;

  CustomDrawer({
    super.key,
    required this.onDrawerClicked,
  });

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Container(
      width: Constant.mediaQuery.size.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constant.mediaQuery.size.width * 0.8,
            color: Constant.theme.primaryColor,
            height: 170,
            child: Text(
              lang!.newsapp,
              style: Constant.theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 25),
          InkWell(
            onTap: () {
              onDrawerClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    Constant.lang!.categories,
                    style: Constant.theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigatorKey.currentState!.pushNamed(PagesRouteName.settingsView);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    Constant.lang!.settings,
                    style: Constant.theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}