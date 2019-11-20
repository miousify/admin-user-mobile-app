import "package:flutter/material.dart";

import "./data/AppStorage.dart";
import "./widgets/IndexWidgets.dart";

class IndexPage extends StatefulWidget {
  Function onLogout;

  IndexPage({this.onLogout});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexState(onLogout: this.onLogout);
  }
}

class _IndexState extends State<IndexPage> {
  Function onLogout;

  _IndexState({this.onLogout});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.push(context, LoginViewRoute());
    // TODO: implement build

    void _settingsView() {
      Navigator.pushNamed(context, "/settings", arguments: {"isNew": true});
    }

    void _loadProducts() {
      Navigator.pushNamed(context, "/products", arguments: {"isNew": true});
    }

    void _loadCategories() {
      Navigator.pushNamed(context, "/categories", arguments: {"isNew": true});
    }

    void _loadTransactions() {
      Navigator.pushNamed(context, "/transactions", arguments: {"isNew": true});
    }

    void _loadCustomers() {
      Navigator.pushNamed(context, "/customers", arguments: {"isNew": true});
    }

    void _bottomOnNavigationItemTap(int index) {
      switch (index) {
        case 0:
          _loadProducts();
          break;
        case 1:
          _loadCategories();
          break;
        case 2:
          _loadCustomers();
          break;
        case 3:
          _loadTransactions();
          break;
      }
    }

    Widget MainAppbar() {
      return AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromRGBO(0, 50, 0, .9)),
        textTheme:
            TextTheme(title: TextStyle(color: Color.fromRGBO(0, 50, 0, .9))),
        leading: Icon(Icons.vpn_key, color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          RawMaterialButton(
            constraints: BoxConstraints.tightFor(width: 40),
            onPressed: null,
            child: Icon(Icons.person, color: Colors.black),
          ),
          SizedBox(
            width: 16,
          ),
          RawMaterialButton(
            constraints: BoxConstraints.tightFor(width: 40),
            onPressed: _settingsView,
            child: Icon(Icons.settings, color: Colors.black),
          ),
          RawMaterialButton(
            constraints: BoxConstraints.tightFor(width: 40),
            onPressed: () {},
            child: PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                itemBuilder: (BuildContext context) {
                  List<PopupMenuEntry> entries = List();
                  entries.add(PopupMenuItem(child: Text("Data")));
                  entries.add(PopupMenuItem(
                      child: Row(
                    children: <Widget>[Text("Visit Site")],
                  )));
                  entries.add(PopupMenuItem(
                    child: RawMaterialButton(
                      onPressed: () async {
                        await AppStorage().destroySession();
                        this.onLogout();
                      },
                      child: Text("Logout"),
                    ),
                  ));
                  return entries;
                }),
          ),
          SizedBox(
            width: 12,
          )
        ],
        title: Text("Admin"),
      );
    }

    BottomNavigationBarItem bottomNavTemp({IconData icon, title}) {
      return BottomNavigationBarItem(
          icon: Icon(icon, color: Colors.black), title: Text(title));
    }

    return Scaffold(
      appBar: MainAppbar(),
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(color: Color.fromRGBO(220, 225, 220, .9)),
        child: ListView(
          children: <Widget>[InfoBox(), IndexBucketsInfo()],
          //BriefProductList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _bottomOnNavigationItemTap,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.black,
          items: [
            bottomNavTemp(icon: Icons.shopping_cart, title: "Products"),
            bottomNavTemp(icon: Icons.category, title: "Categories"),
            bottomNavTemp(
                icon: Icons.supervised_user_circle, title: "Customers"),
            bottomNavTemp(icon: Icons.monetization_on, title: "Orders"),
          ]),
    );
  }
}
