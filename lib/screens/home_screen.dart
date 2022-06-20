// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../generated/l10n.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decreaseCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).AppTitle),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('${S.of(context).language}: '),
//                 DropdownButton<String>(
//                   value: Intl.getCurrentLocale(),
//                   items: [
//                     DropdownMenuItem(
//                       value: 'en',
//                       child: Text(
//                         S.of(context).english,
//                       ),
//                     ),
//                     DropdownMenuItem(
//                       value: 'ru_RU',
//                       child: Text(
//                         S.of(context).russian,
//                       ),
//                     ),
//                   ],
//                   onChanged: (value) async {
//                     if (value == 'ru_RU') {
//                       await S.load(
//                         const Locale('ru', 'RU'),
//                       );
//                       setState(() {});
//                     } else if (value == 'en') {
//                       await S.load(
//                         const Locale('en'),
//                       );
//                       setState(() {});
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   S.of(context).counterValue,
//                 ),
//                 Text(
//                   '$_counter',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   width: 80,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: IconButton(
//                     onPressed: _incrementCounter,
//                     icon: const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                       size: 15,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 80,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: IconButton(
//                     onPressed: _decreaseCounter,
//                     icon: const Icon(
//                       Icons.remove,
//                       color: Colors.white,
//                       size: 15,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
