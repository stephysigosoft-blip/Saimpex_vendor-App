import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/controller/home_controller.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/home/vendor_home_screen.dart';
import 'package:saimpex_vendor/view/restaurant/vendor_restaurant_screen.dart';
import 'package:saimpex_vendor/view/settings/settings.dart';
import 'package:saimpex_vendor/view/chat/ChatListing.dart';
import 'package:saimpex_vendor/controller/profile_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.isGuest = false, this.initialIndex});
  final bool isGuest;

  final int? initialIndex;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeController homescreenController;
  final FlutterLocalization localization = FlutterLocalization.instance;
  final List<Widget> _screens = [
    const VendorHomeScreen(),
    const VendorRestaurantScreen(),
    const ChatListing(),
    const Settings(),
  ];

  @override
  void initState() {
    super.initState();
    homescreenController = Get.put(HomeController());
    Get.put(ProfileController());
    homescreenController.selectedcurrentIndex = widget.initialIndex ?? 0;
    homescreenController.update();
  }

  Future<bool> _onWillPop() async {
    if (homescreenController.selectedcurrentIndex != 0) {
      setState(() {
        homescreenController.selectedcurrentIndex = 0;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Directionality(
            textDirection:
                localization.currentLocale!.languageCode.toString() == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SafeArea(
              top: false,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: const Color(0xFFFDFDFD),
                body: IndexedStack(
                  index: controller.selectedcurrentIndex,
                  children: _screens,
                ),
                bottomNavigationBar: Container(
                  height:
                      kBottomNavigationBarHeight +
                      MediaQuery.of(context).padding.bottom,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Material(
                      elevation: 6,
                      shadowColor: Colors.black26,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: BottomNavigationBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        selectedIconTheme: const IconThemeData(size: 17),
                        unselectedIconTheme: const IconThemeData(size: 17),
                        showUnselectedLabels: true,
                        showSelectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: controller.selectedcurrentIndex,
                        selectedLabelStyle: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        unselectedLabelStyle: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        selectedItemColor: colorPrimary,
                        unselectedItemColor: const Color(0xFF94A3B8),
                        onTap: (index) async {
                          homescreenController.onTabTapped(index, context);
                        },
                        items: [
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              "lib/assets/images/Home.png",
                              height: 24,
                              color: const Color(0xFF94A3B8),
                            ),
                            activeIcon: Image.asset(
                              "lib/assets/images/Home.png",
                              height: 24,
                              color: colorPrimary,
                            ),
                            label: S.of(context).home,
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              "lib/assets/images/Restaurant.png",
                              height: 24,
                              color: const Color(0xFF94A3B8),
                            ),
                            activeIcon: Image.asset(
                              "lib/assets/images/Restaurant.png",
                              height: 24,
                              color: colorPrimary,
                            ),
                            label: S.of(context).myRestaurant,
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              "lib/assets/images/Chat vendor.png",
                              height: 24,
                              color: const Color(0xFF94A3B8),
                            ),
                            activeIcon: Image.asset(
                              "lib/assets/images/Chat vendor.png",
                              height: 24,
                              color: colorPrimary,
                            ),
                            label: S.of(context).chat,
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              "lib/assets/images/Settings vendor.png",
                              height: 24,
                              color: const Color(0xFF94A3B8),
                            ),
                            activeIcon: Image.asset(
                              "lib/assets/images/Settings vendor.png",
                              height: 24,
                              color: colorPrimary,
                            ),
                            label: S.of(context).settings,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
