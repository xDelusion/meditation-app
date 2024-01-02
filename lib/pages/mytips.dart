// import 'package:flutter/material.dart';
// import 'package:meditation_app/models/tips.dart';
// import 'package:meditation_app/providers/tips_provider.dart';
// import 'package:provider/provider.dart';

// class MyTipsPage extends StatelessWidget {
//   const MyTipsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Tips"),
//       ),
//     );
//   }
// }
//       body: FutureBuilder(
//         future: context
//             .read<TipsProvider>()
//             .getTips(), //changed this from getMyTips
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Consumer<TipsProvider>(
//             builder: (context, value, child) {
//               return ListView.builder(
//                 itemCount: context.watch<TipsProvider>().myTipsList.length,
//                 itemBuilder: (context, index) {
//                   MyTips currentTip =
//                       context.watch<TipsProvider>().myTipsList[index];

//                   return Padding(
//                     padding: EdgeInsets.only(
//                         top: 15, bottom: 15, right: 115, left: 15),
//                     child: Card(
//                       child: ListTile(
//                         title: Text(currentTip.author),
//                         subtitle: Text(currentTip.text),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

//--------------------------------

// class MyTipsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TipsProvider(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('My Tips'),
//         ),
//         body: Consumer<TipsProvider>(
//           builder: (context, value, child) {
//             return ListView.builder(
//               itemCount: context.watch<TipsProvider>().myTipsList.length,
//               itemBuilder: (context, index) {
//                 MyTips currentTip =
//                     context.watch<TipsProvider>().myTipsList[index];

//                 return Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Card(
//                     child: ListTile(
//                       title: Text(currentTip.author),
//                       subtitle: Text(currentTip.text),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
