// import 'package:flutter/material.dart';
// import 'package:flutter_auth/controller/main_controller.dart';
// import 'package:get/get.dart';
//
// class MainScreen extends StatelessWidget {
//   MainScreen({super.key});
//
//   final MainController controller = Get.put(MainController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Obx(() {
//       return Scaffold(
//         backgroundColor: context.theme.colorScheme.background,
//         // appBar: AppBar(
//         //   elevation: 0,
//         //   backgroundColor: Colors.purple,
//         //   leading: Container(),
//         //   actions: [
//         //     // IconButton(
//         //     //     onPressed: () {
//         //     //       Get.isDarkMode
//         //     //           ? Get.changeThemeMode(ThemeMode.light)
//         //     //           : Get.changeThemeMode(ThemeMode.dark);
//         //     //     },
//         //     //     icon: Image.asset("assets/images/shop.png"))
//         //   ],
//         //   centerTitle: true,
//         //   title: Text(controller.title[controller.currentIndex.value]),
//         // ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           items: [
//             BottomNavigationBarItem(
//                 activeIcon: Icon(
//                   Icons.home,
//                   color: Colors.purple,
//                 ),
//                 icon: Icon(
//                   Icons.home,
//                   color: Colors.black,
//                 ),
//                 label: "الدليل الطبى"),
//             BottomNavigationBarItem(
//                 activeIcon: Icon(
//                   Icons.category,
//                   color: Colors.purple,
//                 ),
//                 icon: Icon(
//                   Icons.category,
//                   color: Colors.black,
//                 ),
//                 label: "المُساعد الرقمى"),
//           ],
//           currentIndex: controller.currentIndex.value,
//           type: BottomNavigationBarType.fixed,
//           onTap: (index) {
//             controller.currentIndex.value = index;
//           },
//         ),
//         body: IndexedStack(
//           index: controller.currentIndex.value,
//           children: controller.tabs.value,
//         ),
//       );
//     }));
//   }
// }
