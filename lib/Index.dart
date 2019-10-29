import "package:flutter/material.dart";

import "./widgets/Containers.dart";
import "./widgets/CustomWidgets.dart";
import "./widgets/IndexWidgets.dart";

class IndexPage extends StatelessWidget {
  BuildContext context;

  IndexPage(this.context) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void _settingsView() {
      Navigator.pushNamed(context, "/settings", arguments: {"isNew": true});
    }

    void _createProduct() {
      Navigator.pushNamed(context, "/create-product",
          arguments: {"isNew": true});
    }

    void _loadProducts() {
      Navigator.pushNamed(context, "/products", arguments: {"isNew": true});
    }

    void _loadTransactions() {
      Navigator.pushNamed(context, "/transactions", arguments: {"isNew": true});
    }

    void _loadCategories() {
      Navigator.pushNamed(context, "/categories", arguments: {"isNew": true});
    }

    void _loadCustomers() {
      Navigator.pushNamed(context, "/customers", arguments: {"isNew": true});
    }

    void _createCategory() {
      Navigator.pushNamed(context, "/create-category",
          arguments: {"isNew": true});
    }

    void _createBrand() {
      Navigator.pushNamed(context, "/create-brand", arguments: {"isNew": true});
    }

    void _bottomOnNavigationItemTap(int index) {
      switch (index) {
        case 0:
          null;
          break;
        case 1:
          _loadProducts();
          break;
        case 2:
          _loadCategories();
          break;
        case 3:
          _loadCustomers();
          break;
        case 4:
          _loadTransactions();
          break;
      }
    }

    Widget MainAppbar() {
      return AppBar(
        elevation: 0,
        leading: Icon(Icons.threesixty, color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(Icons.person, color: Colors.black),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: _settingsView,
            child: Icon(Icons.settings, color: Colors.black),
          ),
          PopupMenuButton(
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
                entries.add(PopupMenuItem(child: Text("Logout")));
                return entries;
              })
        ],
        title: Text(
          "Admin",
          style: TextStyle(color: Colors.blue),
        ),
      );
    }

    return Scaffold(
      appBar: MainAppbar(),
      body: ListView(
        children: <Widget>[
          InfoBox(
            loadCustomers: _loadCustomers,
            loadTransactions: _loadTransactions,
          ),
          Row(children: [
            Expanded(
                child: AppFlatActionCard(
                    AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "50",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.blue),
                              ),
                              Text(
                                "Product",
                                style: Theme.of(context).textTheme.body2,
                              )
                            ],
                          ),
                        )),
                    onTap: _loadProducts)), // Loading produCts
            Expanded(
                child: AppFlatActionCard(
                    AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "10",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.blue),
                              ),
                              Text(
                                "Product",
                                style: Theme.of(context).textTheme.body2,
                              )
                            ],
                          ),
                        )),
                    onTap: _loadCategories)),
            Expanded(
                child: AppFlatActionCard(
                    AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.blue),
                              ),
                              Text(
                                "Brands",
                                style: Theme.of(context).textTheme.body2,
                              )
                            ],
                          ),
                        )),
                    onTap: _loadCategories))
          ]),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(children: [
              SizedBox(
                height: 16,
              ),
              BeatifulHomeActionButton(
                onTap: _createProduct,
                title: "Create product",
                caption: "Caption",
              ),
              SizedBox(
                height: 16,
              ),
              BeatifulHomeActionButton(
                onTap: _createProduct,
                title: "Create category",
                caption: "Caption",
                isIconLeft: false,
              ),
              SizedBox(
                height: 16,
              ),
              BeatifulHomeActionButton(
                onTap: _createProduct,
                title: "Create brand",
                caption: "Caption",
              ),
              SizedBox(
                height: 16,
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _bottomOnNavigationItemTap,
          currentIndex: 2,
          showSelectedLabels: true,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.green),
                title: Text(
                  "Products",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.category, color: Colors.blue),
                title: Text(
                  "Catgeory",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle, color: Colors.green),
                title: Text(
                  "Customers",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on, color: Colors.black),
                title: Text(
                  "Transactions",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ))
          ]),
    );
  }
}
