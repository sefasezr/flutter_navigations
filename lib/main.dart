import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        //home: HomePage(),
        initialRoute: HomePage.routeName,
        //routes: {
        //  HomePage.routeName: (context) => HomePage(),
        //  RoutePink.routeName: (context) => RoutePink(),
        //  RouteGreen.routeName: (context) => RouteGreen(),
        //  RouteGrey.routeName: (context) => RouteGrey(),
        //},
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(builder: (context) => HomePage());
            case RoutePink.routeName:
              final kullanici = settings.arguments as Kullanici;
              return MaterialPageRoute(
                  builder: (context) => RoutePink(kullanici));
            case RouteGreen.routeName:
              return MaterialPageRoute(builder: (context) => RouteGreen());
            case RouteGrey.routeName:
              return MaterialPageRoute(builder: (context) => RouteGrey());
            default:
              return MaterialPageRoute(builder: (context) => RouteGrey());
          }
        });
  }
}

class Kullanici {
  String? ad;
  int? yas;
  String? adres;

  Kullanici({this.ad, this.yas, this.adres});
}

class HomePage extends StatelessWidget {
  final Kullanici kullanici_1 =
      Kullanici(ad: 'Sefa', adres: 'Galatasaray', yas: 40);

  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('HomePage'),
        ElevatedButton(
            child: Text('Git -> Route Pink'),
            onPressed: () {
              Navigator.pushNamed(context, RoutePink.routeName,
                  arguments: kullanici_1);
            })
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  static const String routeName = '/routePink';
  final Kullanici yerelKullanici;

  RoutePink(this.yerelKullanici);

  //Kullanici yerelKullanici = ModalRoute.of(context).settings.arguments;

  @override
  Widget build(BuildContext context) {
    //Kullanici? yerelKullanici;
    //var route = ModalRoute.of(context);
    //if (route != null && route.settings.arguments != null) {
    //  yerelKullanici = route.settings.arguments as Kullanici;
    //}

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('kullanıcı adı: ${yerelKullanici?.ad}'),
        ElevatedButton(
            child: Text('Git -> Route Green'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGreen.routeName);
            }),
        ElevatedButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  static const String routeName = '/routeGreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGreen en üstte'),
        ElevatedButton(
            child: Text('Git -> Route Grey'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGrey.routeName);
            }),
        ElevatedButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  static const String routeName = '/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGrey en üstte'),
        ElevatedButton(child: Text('Git -> ....'), onPressed: () {}),
        ElevatedButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}
