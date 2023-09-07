import 'package:flutter/material.dart';
import 'package:flutter_multistore_user_app_windys/pages/dashboard/dashboard_page.dart';

import '../../data/datasources/auth_local_datasource.dart';
import '../../utils/color_resources.dart';
import '../../utils/images.dart';
import '../auth/auth_page.dart';
import 'widgets/splash_painter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ColorResources.getPrimary(context),
              child: CustomPaint(
                painter: SplashPainter(),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Images.splashLogo,
                    height: 250.0,
                    fit: BoxFit.scaleDown,
                    width: 250.0,
                  ),
                ],
              ),
            ),
            // masuk ke dashboard dengan kondisi sudah login atau belum login
            // Positioned(
            //   bottom: 50,
            //   left: 0,
            //   right: 0,
            //   child: InkWell(
            //     // create a condition that if you have logged in then go straight to the dashboard if you have not entered the AuthPage

            //     onTap: () {
            //       AuthLocalDatasource().isLogin().then((value) {
            //         if (value) {
            //           Navigator.pushAndRemoveUntil(context,
            //               MaterialPageRoute(builder: (context) {
            //             return const DashboardPage();
            //           }), (route) => false);
            //         } else {
            //           Navigator.pushAndRemoveUntil(context,
            //               MaterialPageRoute(builder: (context) {
            //             return const AuthPage();
            //           }), (route) => false);
            //         }
            //       });
            //       // FutureBuilder<bool>(
            //       //   future: AuthLocalDatasource().isLogin(),
            //       //   builder: (context, snapshot) {
            //       //     if (snapshot.hasData) {
            //       //       if (snapshot.data!) {
            //       //         return const DashboardPage();
            //       //       } else {
            //       //         return const AuthPage();
            //       //       }
            //       //     } else {
            //       //       return const Scaffold(
            //       //         body: Center(
            //       //           child: CircularProgressIndicator(),
            //       //         ),
            //       //       );
            //       //     }
            //       //   },
            //       // );
            //     },
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: ColorResources.getPrimary(context),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           'Get Started',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
