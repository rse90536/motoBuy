import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motobuy/bloc/login_bloc/login_bloc.dart';

import 'login_form.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                Container(
                  width: mediaQuerySize.width,
                  height: mediaQuerySize.height,
                  child: Image.asset(
                    "assets/login99.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: mediaQuerySize.width,
                  height: mediaQuerySize.height,
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                ),
                Positioned(
                  top: mediaQuerySize.height/2.5,
                  left: 0,
                  width: mediaQuerySize.width-10,
                  child: LoginForm(),
                ),
//            CurvedWidget(
//              child: Container(
//                padding: const EdgeInsets.only(top: 100, left: 50),
//                width: double.infinity,
//                height: 300,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Colors.black, Colors.black.withOpacity(0.4)],
//                  ),
//                ),
//                child: Text(
//                  'Moto 交易平台',
//                  style: TextStyle(
//                      fontSize: 40,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w700
//                  ),
//                ),
//              ),
//            ),

              ],
            ),
          )),
    );
    //   GestureDetector(
    //   behavior: HitTestBehavior.translucent,
    //   onTap: () {
    //     FocusScope.of(context).requestFocus(FocusNode());
    //   },
    //   child: CurvedWidget(
    //     child: Container(
    //       padding: const EdgeInsets.only(top: 100, left: 50),
    //       width: double.infinity,
    //       height: 300,
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           colors: [Colors.black, Colors.black.withOpacity(0.4)],
    //         ),
    //       ),
    //       child: Text(
    //         'Moto 交易平台',
    //         style: TextStyle(
    //           fontSize: 40,
    //           color: Colors.white,
    //           fontWeight: FontWeight.w700
    //         ),
    //       ),
    //     ),
    //   ),
    //
    // );
  }

//  Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Container(
//           height: 50,
//           padding: const EdgeInsets.all(5),
//           child: TextField(
//             onSubmitted: (text) {
//               FocusScope.of(context).requestFocus(_focusNode);
//             },
//             style: TextStyle(fontSize: 20.0, color: Colors.white),
//             controller: _accountController,
//             textAlign: TextAlign.start,
//             decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 icon: Icon(
//                   Icons.perm_identity,
//                   color: Colors.white,
//                 ),
//                 labelText: "帳號",
//                 labelStyle: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.grey, width: 1.0),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 )),
//           ),
//         ),
//         Container(
//           height: 50,
//           padding: const EdgeInsets.all(5),
//           child: TextField(
//             onSubmitted: (text) {
//               FocusScope.of(context).requestFocus(_focusNode);
//             },
//             obscureText: true,
//             style: TextStyle(fontSize: 20.0, color: Colors.black),
//             controller: _passwordController,
//             textAlign: TextAlign.start,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               icon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               labelText: "密碼",
//               labelStyle: TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//               enabledBorder: const OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Colors.grey,
//                       width: 1.0,
//                       style: BorderStyle.solid)),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//             ),
//           ),
//         ),
//         RaisedButton(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//               side: BorderSide(color: Colors.blueAccent)),
//           color: Colors.white,
//           highlightColor: Colors.blueAccent,
//           child: Text("登入"),
//           onPressed: () {
//             // _getToken();
//           },
//         ),
//       ],
//     )
}
