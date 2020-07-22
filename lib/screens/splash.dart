import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription<ConnectivityResult> subscription;
  bool isConnectedToInternet = false;
  bool executeFuture = true;
  @override
  initState() {
    super.initState();
    check();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('result: ' + result.toString());
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        setState(() {
          isConnectedToInternet = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('connectivityResult' + connectivityResult.toString());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        isConnectedToInternet = true;
      });
    } else {
      setState(() {
        isConnectedToInternet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isConnectedToInternet) {
      Future.delayed(Duration(seconds: 5), () {
        if (executeFuture) {
          setState(() {
            executeFuture = false;
            Navigator.pushNamed(context, '/home');
            //some method calling
          });
        }
      });
      // Timer(Duration(seconds: 5), () {
      //   Navigator.pushNamed(context, '/home');
      // });
    }
    return new Scaffold(
        body: Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to GreenApp',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          isConnectedToInternet != null
              ? !isConnectedToInternet
                  ? Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 4,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        'No Internet Connection available...!!!!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )))
                  : Container()
              : Container()
        ],
      ),
    ));
  }
}
