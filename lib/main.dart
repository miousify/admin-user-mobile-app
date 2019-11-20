import 'package:flutter/material.dart';

import './Index.dart';
import "./activities/Categories.dart";
import "./activities/CreateCategory.dart";
import "./activities/CreateProduct.dart";
import "./activities/Customers.dart";
import "./activities/Login.dart";
import "./activities/Products.dart";
import "./activities/Settings.dart";
import "./activities/Transactions.dart";
import "./activities/ViewCategory.dart";
import "./activities/ViewProduct.dart";
import "./data/AppStorage.dart";
import "./widgets/AppWidgets.dart";
//5d64ffd3081cf32c7db898b9

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainAppState();
  }
}

class MainAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isLoggedIN = true;

  onLoggedIn() {
    setState(() {
      isLoggedIN = true;
    });
    print("finnaly logged in");
  }

  onLoggedout() {
    setState(() {
      isLoggedIN = false;
    });

    print("finnaly logged out");
  }

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      "/settings": (BuildContext context) {
        return SettingsRoute().builder(context);
      },
      "/create-product": (BuildContext context) {
        return CreateProductWidget().builder(context);
      },
      "/products": (BuildContext context) {
        return ProductsViewRoute().builder(context);
      },
      "/product-view": (BuildContext context) {
        return ProductViewRoute().builder(context);
      },
      "/create-category": (BuildContext context) {
        return CreateCategoryWidget().builder(context);
      },
      "/create-brand": (BuildContext context) {
        return CreateCategoryWidget().builder(context);
      },
      "/categories": (BuildContext context) {
        return CategoriesViewRoute().builder(context);
      },
      "/category-view": (BuildContext context) {
        return CategoryViewRoute().builder(context);
      },
      "/transactions": (BuildContext context) {
        return TransactionsViewRoute().builder(context);
      },
      "/transaction-view": (BuildContext context) {
        return TransactionsViewRoute().builder(context);
      },
      "/customers": (BuildContext context) {
        return CustomersViewRoute().builder(context);
      },
      "/customer-view": (BuildContext context) {
        return TransactionsViewRoute().builder(context);
      },
    };

    /*
        await AppStorage().getStoreAuth();
    */

    Future<dynamic> checkAuth() async {
      dynamic auth = await AppStorage().getStoreAuth();
      return auth;
    }

    Widget MainStartingPoint = FutureBuilder(
      future: checkAuth(),
      builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return GenericLoadingWidget();
            break;
          case ConnectionState.waiting:
            return GenericLoadingWidget();
            break;
          case ConnectionState.done:
            return snapshot.data == null
                ? IndexPage(
                    onLogout: this.onLoggedout,
                  )
                : LoginWidget(
                    onLoggedin: this.onLoggedIn,
                  );
            break;
          case ConnectionState.none:
            return GenericLoadingWidget();
            break;
        }

        return new Container();
      },
    );

    return MaterialApp(
        title: 'Flutter Demo',
        routes: routes,
        initialRoute: "",
        theme: ThemeData(
            iconTheme: IconThemeData(color: Colors.black),
            appBarTheme: AppBarTheme(
                color: Colors.white,
                textTheme: TextTheme(
                    title: TextStyle(
                        color: Color.fromRGBO(0, 50, 0, .9),
                        fontWeight: FontWeight.bold)),
                iconTheme: IconThemeData(color: Color.fromRGBO(0, 50, 0, .9))),
            buttonTheme:
                ButtonThemeData(buttonColor: Color.fromRGBO(10, 100, 20, .9))),
        home: MainStartingPoint);
  }
}
