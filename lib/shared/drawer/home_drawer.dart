
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import 'menu_item.dart';
import 'menu_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  MyMenuItem currentItem = MenuItems.homepage;

  @override
  Widget build(BuildContext context) => BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
    builder: (context, state) {
      var cubit = PharmacyCubit.get(context);
      return ZoomDrawer(
        menuBackgroundColor: HexColor("#04914F"),
        isRtl: true,
        menuScreen: Builder(
          builder: (context) => MenuScreen(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              }),
        ),
        mainScreen: cubit.getScreen(currentItem),
        style: DrawerStyle.defaultStyle,
        borderRadius: 5,
        angle: 0,
        slideWidth: MediaQuery.of(context).size.width * 0.90,
      );
    },
  );
}
