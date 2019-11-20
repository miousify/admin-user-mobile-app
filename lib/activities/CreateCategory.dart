import 'package:flutter/material.dart';

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

class CreateCategoryWidget extends MaterialPageRoute {
  final String id;

  CreateCategoryWidget({this.id})
      : super(builder: (BuildContext build) {
          return NewCategory(id: id);
        });
}

class NewCategory extends StatefulWidget {
  final String id;

  NewCategory({this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewProductState(id: id);
  }
}

class _NewProductState extends State<NewCategory> {
  String id;

  String title;
  String description;
  String caption;
  String logo;
  String image;
  bool sendingRequest = false;

  _NewProductState({this.id});

  void save() async {
    Map map = {"title": "", "description": "", "caption": ""};
    if (id == null) {
      setState(() {
        sendingRequest = true;
      });
      String response = await CategoryActions().postToBucket(map);
      setState(() {
        sendingRequest = false;
      });
      if (response == null) {
        // something went wrong.
        return null;
      }
    } else {
      map.addAll({"_id": id});
      setState(() {
        sendingRequest = true;
      });
      bool check = await CategoryActions().putInBucket(id, map);
      setState(() {
        sendingRequest = false;
      });
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
    return AppPrimaryScaffold(
      title: "Category",
      actions: <Widget>[
        RawMaterialButton(
          onPressed: () async {
            // showModalBottomSheet(context: null, builder: null);
            await save();
          },
          child: sendingRequest == true
              ? Align(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                )
              : Icon(
                  Icons.save,
                  color: Colors.black,
                ),
        )
      ],
      body: ListView(
        children: <Widget>[
          AppPlainFormWidget(
            formLabel: "Category Details",
            inputElemtents: <Widget>[
              AppPlainInputWidget(
                hint: "Label",
              ),
              AppPlainInputWidget(hint: "Caption"),
              AppPlainInputWidget(hint: "Description"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppImageUploaderButton(),
          ),
        ],
      ),
    );
  }
}
