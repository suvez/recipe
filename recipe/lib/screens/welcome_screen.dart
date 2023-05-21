// import 'package:flutter/material.dart';

// import 'package:animated_text_kit/animated_text_kit.dart';

// class WelcomeScreen extends StatefulWidget {
//   static const String id = 'welcome_screen';

//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Hero(
//                   tag: 'logo',
//                   child: Container(
//                     child: Image.asset('images/logo.png'),
//                     height: 60.0,
//                   ),
//                 ),
//                 TypewriterAnimatedTextKit(
//                   text: ['YemekBu!'],
//                   textStyle: TextStyle(
//                     fontSize: 45.0,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 48.0,
//             ),

//             //GoogleSignInButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }
