import "dart:convert";

import "package:flutter/material.dart";

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

abstract class GenericList extends StatelessWidget {
  final RESTActions action;
  final String filter;

  Widget bucketItemsBuilder(List<dynamic> items);

  GenericList({this.action, this.filter});

  Future<List<dynamic>> dataLoadeer() async {
    String rawBucketResponse = await action.getBucketItems();
    List<dynamic> convertedRawToList = json.decode(rawBucketResponse);
    return convertedRawToList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: dataLoadeer(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                color: Colors.blueGrey,
                child: bucketItemsBuilder(snapshot.data),
              );
              break;
          }
          return null;
        });
  }
}
