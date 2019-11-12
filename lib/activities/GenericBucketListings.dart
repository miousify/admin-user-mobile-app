import "dart:convert";

import "package:flutter/material.dart";

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

abstract class GenericList extends StatelessWidget {
  final RESTActions action;
  final String filter;

  Widget bucketItemsBuilder(List<dynamic> items);
  GenericList({this.action, this.filter});
  Future<List<dynamic>> dataLoader() async {
    String rawBucketResponse = await action.getBucketItems();
    print(rawBucketResponse);

    List<dynamic> convertedRawToList = json.decode(rawBucketResponse);

    return convertedRawToList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: dataLoader(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return GenericLoadingWidgetContainer();
              break;
            case ConnectionState.waiting:
              return GenericLoadingWidgetContainer();
              break;
            case ConnectionState.active:
              return GenericLoadingWidgetContainer();
              break;
            case ConnectionState.done:
              return Container(
                color: Color.fromRGBO(0, 30, 0, .9),
                child: bucketItemsBuilder(snapshot.data),
              );
              break;
          }
          return null;
        });
  }
}
