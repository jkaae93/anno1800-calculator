import 'package:anno_calc/controller/init_controller.dart';
import 'package:anno_calc/firebase_options.dart';
import 'package:anno_calc/i18n/i18n.dart';
import 'package:anno_calc/models/trade_route.dart';
import 'package:anno_calc/utils/anno_database.dart';
import 'package:anno_calc/views/trade_routes_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:get/get.dart';

import 'views/pages/dashboard_page.dart';
import 'views/pages/islands_info_page.dart';
import 'views/pages/resident_demands_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp((GetMaterialApp(
    translations: I18n(),
    locale: Get.deviceLocale,
    fallbackLocale: const Locale('en', 'US'),
    home: const Home(),
  )));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final InitController _init = Get.put(InitController());
  int _idx = 3;
  String test = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(AnnoDatabase.instance);
      String id = AnnoDatabase.instance.getId();
      if (id.isEmpty) {
        print('A new user');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: FlexThemeData.light(
          scheme: FlexScheme.mallardGreen,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarOpacity: 0.95,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.mallardGreen,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarOpacity: 0.90,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
        ),
        themeMode: ThemeMode.system,
        home: Material(
          child: Row(
            children: [
              SideNavView(
                index: _idx,
                onTap: (idx) {
                  setState(() {
                    _idx = idx;
                  });
                },
              ),
              Expanded(child: StatefulBuilder(builder: (BuildContext context, setState) {
                switch (_idx) {
                  case 0:
                    return const DashboardPage();
                  case 1:
                    return ResidentDemandsPage();
                  case 2:
                    return IslandsInfoPage();
                  case 3:
                    return TradeRoutesPage();
                  default:
                    return Container();
                }
              }))
            ],
          ),
        ));
  }
}

class SideNavView extends StatefulWidget {
  final Function(int) onTap;
  final int index;
  SideNavView({
    Key? key,
    this.index = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SideNavView> createState() => _SideNavViewState();
}

class _SideNavViewState extends State<SideNavView> {
  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
      theme: SideNavigationBarTheme(
        dividerTheme: SideNavigationBarDividerTheme(
          showFooterDivider: true,
          showHeaderDivider: true,
          showMainDivider: true,
          mainDividerColor: context.theme.dividerColor,
          footerDividerColor: context.theme.dividerColor,
          headerDividerColor: context.theme.dividerColor,
        ),
        itemTheme: SideNavigationBarItemTheme(
          selectedItemColor: context.theme.primaryColorDark,
          unselectedItemColor: context.theme.disabledColor,
          iconSize: 30,
          labelTextStyle: context.theme.bottomNavigationBarTheme.selectedLabelStyle,
        ),
        togglerTheme: SideNavigationBarTogglerTheme(
          expandIconColor: context.theme.toggleButtonsTheme.disabledColor,
          shrinkIconColor: context.theme.toggleButtonsTheme.color,
        ),
      ),
      header: SideNavigationBarHeader(
        image: Container(
          padding: const EdgeInsets.all(20),
          width: 50,
          child: const Icon(Icons.tour),
        ),
        title: Container(
          alignment: Alignment.center,
          child: AutoSizeText('anno_1800'.tr),
        ),
        subtitle: Container(
          alignment: Alignment.center,
          child: AutoSizeText('calculator'.tr),
        ),
      ),
      selectedIndex: widget.index,
      items: [
        SideNavigationBarItem(
          icon: Icons.dashboard,
          label: 'dashboard'.tr,
        ),
        SideNavigationBarItem(
          icon: Icons.person,
          label: 'resident_demands'.tr,
        ),
        SideNavigationBarItem(
          icon: Icons.language,
          label: 'islands'.tr,
        ),
        SideNavigationBarItem(
          icon: Icons.alt_route,
          label: 'routes'.tr,
        ),
      ],
      onTap: (index) {
        widget.onTap(index);
      },
      footer: SideNavigationBarFooter(
          label: Column(
        children: [
          InkWell(
              onTap: () {
                Get.defaultDialog(
                  middleText: 'All clear right?',
                  onConfirm: () {
                    AnnoDatabase.instance.clearUserData();
                    Get.back();
                  },
                );
              },
              child: AutoSizeText('clear_all'.tr)),
        ],
      )),
    );
  }
}
