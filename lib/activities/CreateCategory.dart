import 'package:flutter/material.dart';

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

class CreateCategoryWidget extends MaterialPageRoute {
  CreateCategoryWidget()
      : super(builder: (BuildContext build) {
          return NewCategory();
        });
}

class NewCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewProductState();
  }
}

class _NewProductState extends State<NewCategory> {
  String _id;
  bool _isNew;
  bool generic;
  bool sendingRequest = false;

  void _save() async {
    CategoryActions categoryActions = new CategoryActions();

    Map map = {
      "title": "title",
      "caption": "caption",
      "description": "description",
      "image": "image"
    };

    if (this._isNew) {
      await categoryActions.putInBucket(this._id, map);
    } else {
      await categoryActions.postToBucket(map);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Category"),
        actions: <Widget>[
          Icon(Icons.save),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Basic Details",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        AppPlainInputWidget(
                          hint: "Label",
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        AppPlainInputWidget(hint: "Caption"),
                        SizedBox(
                          height: 12,
                        ),
                        AppPlainInputWidget(
                          hint: "Description",
                        ),
                      ],
                    ))),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: AppImageUploaderButton(),
          ),
          SizedBox(
            height: 16,
          ),
          AppActionCard(
              context,
              Container(
                child: PopupMenuButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text("Select me"),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Container(
                            color: Colors.brown,
                          ),
                        )
                      ];
                    }),
              )),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
