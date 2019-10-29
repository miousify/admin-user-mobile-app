import "package:flutter/material.dart";

class ProductViewRoute extends MaterialPageRoute {
  ProductViewRoute()
      : super(builder: (BuildContext context) {
          return ProductView();
        });
}

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget primaryProductDetails() {
      return Container(
//        color: Color.fromRGBO(90, 90, 170, 9),
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: Icon(
                        Icons.check,
                        size: 30,
                      ),
                    ),
                    Text("AVAILABILITY"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("QUANTITY"),
                    ]),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    Text("Edit"),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    // TODO: implement build
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(),
        //
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 8),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Product name",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  primaryProductDetails(),
                  SizedBox(
                    height: 16,
                  ),
                  for (int i = 0; i <= 5; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "property ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "value of property",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    )
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
