
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'menu_item.dart';

class MenuItems {
  static const homepage = MyMenuItem('الصفحة الرئيسية', Icons.home);
  static const profile = MyMenuItem('البروفايل', Icons.person);
  static const contactUs = MyMenuItem('اتصل بنا', Icons.call);  
  static const complients = MyMenuItem('الشكاوى', Icons.note_add);
  static const aboutUs = MyMenuItem('عن الابليكشن', Icons.info);

  static const all = <MyMenuItem>[
    homepage,
    profile,
    contactUs,    
    complients,
    aboutUs,
  ];
}

class MenuScreen extends StatelessWidget {
  final MyMenuItem currentItem;
  final ValueChanged<MyMenuItem> onSelectedItem;

  const MenuScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  Widget buildMenuItem(MyMenuItem item) => ListTileTheme(
    selectedColor: Colors.grey[200],
    child: ListTile(
      selectedColor: Colors.white,
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () => onSelectedItem(item),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: HexColor("#04914F"),
              body: SafeArea(
                  child: Column(
                    children: [
                      const Spacer(),
                      ...MenuItems.all.map(buildMenuItem).toList(),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  )
                /*Scaffold(
                    backgroundColor: HexColor("#04914F"),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          DrawerHeader(
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  maxRadius: 32,
                                  backgroundImage:
                                  AssetImage("assets/images/menu/profile.png"),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, PharmaciesScreen());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      'الصفحة الرئيسية',
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, Points());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      "النقاط",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, AllOrders());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      "الطلبات",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, ContactUsScreen());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      "اتصل بنا",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, const AboutUsScreen());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      'عن الابليكشن',
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  print("dddddddddddddddddddddd");
                                  navigateTo(context, const ProfileScreen());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      'البروفايل',
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, ComplaintsScreen());
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      'الشكاوى',
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(23),
                              child: InkWell(
                                onTap: (){
                                  cubit.logOut(context);
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.aspect_ratio, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      'تسجيل الخروج',
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )*/
              ),
            ));
      }
}
