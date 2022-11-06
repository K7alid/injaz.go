import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/app_localization.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/cubit/locale_cubit.dart';
import 'package:injaz_go/shared/network/local/cache_helper.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              color: primaryColor,
              padding: const EdgeInsets.all(20),
              child: Text(
                'Welcome'.tr(context),
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildListTile('Logout'.tr(context), Icons.logout, () {
              CacheHelper.signOut(context);
            }),
            buildListTile('Language'.tr(context), Icons.language, () {
              BlocProvider.of<LocaleCubit>(context).changeLanguage('ar');
            }),
          ],
        ),
      ),
    );
  }
}

Widget buildListTile(String title, IconData icon, Function tapHandler) {
  return ListTile(
    leading: Icon(
      icon,
      size: 26,
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onTap: () {
      tapHandler();
    },
  );
}
