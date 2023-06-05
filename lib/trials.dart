// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:roqqu_test/screens/home/home.controller.dart';
// import 'package:roqqu_test/styles/theme.controller.dart';

// class TScreen extends StatelessWidget {
//   TScreen({super.key});

//   final controller = Get.put<HomeController>(HomeController());
//   final themeController = Get.put<ThemeController>(ThemeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: RadioListTile(
//             //     title: Text('System'),
//             //     activeColor: Theme.of(context).primaryColor,
//             //     value: ThemeMode.system,
//             //     groupValue: themeController.themeMode,
//             //     onChanged: (ThemeMode? value) {
//             //       themeController.setThemeMode(value!);
//             //     },
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: RadioListTile(
//                 title: Text('Light'),
//                 activeColor: Theme.of(context).primaryColor,
//                 value: ThemeMode.light,
//                 groupValue: themeController.themeMode,
//                 onChanged: (ThemeMode? value) {
//                   themeController.setThemeMode(value!);
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: RadioListTile(
//                 title: Text('Dark'),
//                 activeColor: Theme.of(context).primaryColor,
//                 value: ThemeMode.dark,
//                 groupValue: themeController.themeMode,
//                 onChanged: (ThemeMode? value) {
//                   themeController.setThemeMode(value!);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
