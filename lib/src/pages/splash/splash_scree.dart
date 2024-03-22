import 'package:flutter/material.dart';
import 'package:git_search/common_setting.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      size: 100.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Build with Aurora',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),

              // show the app flavor bottom center
              Positioned(
                bottom: 30.0,
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: Text(
                    GlobalSettings.appFlavor.name,
                    style: const TextStyle(
                      letterSpacing: 1.2,
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
