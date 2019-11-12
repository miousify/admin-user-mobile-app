import "dart:convert";

import "package:http/http.dart" as http;

import "./AppStorage.dart";
/*
* Is responsible for getting store buckets e.g products, categories and the rest
 */

String AUTHORITY = "api-dot-lubi-ep.appspot.com";

abstract class AppHTTPFactory {
  static String STORE_PATH = "/api/store";
  static String AUTHORITY = "api-dot-lubi-ep.appspot.com";
}

class RESTActions extends AppHTTPFactory {
  static String STORE_PATH = "/api/store";
  static String AUTHORITY = "api-dot-lubi-ep.appspot.com";
  final String bucketName;

  String internal_store_id;

  RESTActions(this.bucketName) {}

  Future<String> getBucketItems({Map<String, dynamic> filter}) async {
    if (internal_store_id == null) {
      await this.loadInternalId();
    }
    String response = await http.read(Uri.http(AUTHORITY,
        STORE_PATH + "/" + internal_store_id + "/" + this.bucketName));
    // try to return list model of items
    return response;
  }

  Future<String> getBucketItem(String itemID) async {
    print("before gettng items");
    if (internal_store_id == null) {
      await this.loadInternalId();
    }

    print("loaded internal store_id");
    String path = STORE_PATH +
        "/" +
        internal_store_id +
        "/" +
        this.bucketName +
        "/" +
        itemID;

    String response;
    try {
      response = await http.read(Uri.http(AUTHORITY, path));
      return response;
    } catch (error) {
      print(error);
    }
  }

  Future<bool> loadInternalId() async {
    Map token = await AppStorage().getStoreAuth();
    String __internal_id = token['internal_id'];
    internal_store_id = __internal_id;
    return true;
  }

  Future<dynamic> postToBucket(Map item) async {
    if (internal_store_id == null) {
      await this.loadInternalId();
    }
    Uri uri = Uri.http(AUTHORITY,
        STORE_PATH + "/" + internal_store_id + "/" + this.bucketName);

    print("started creating");

    // removel all keys with null as value
    item.removeWhere((key, value) {
      if (value == null) {
        return true;
      } else {
        return false;
      }
    });
    print(item);

    http.Response response = await http.post(uri, body: item);
    switch (response.statusCode) {
      case 200:
        String body = response.body;
        print("Successfully created an item");
        return body;
        break;
      case 500:
        print("Error creating an item");
        return null;
        break;
      default:
        //unknown error occured notify client and server;
        null;
    }
  }

  Future<bool> putInBucket(String itemID, Map item) async {
    if (internal_store_id == null) {
      await this.loadInternalId();
    }
    Uri uri = Uri.http(
        AUTHORITY,
        STORE_PATH +
            "/" +
            internal_store_id +
            "/" +
            this.bucketName +
            "/" +
            itemID);
    // removel all keys with null as value
    item.removeWhere((key, value) {
      if (value == null) {
        return true;
      } else {
        return false;
      }
    });

    print("before-p " + item.toString());

    http.Response response;
    try {
      response = await http.put(uri, body: item);
      print("after receiving response");
      print(response);
      switch (response.statusCode) {
        case 200:
          String body = response.body;
          // return true
          print(body);
          print("updated bucket item successful");
          return true;
          break;
        case 500:
          null;
          print("updated bucket item failed");
          return false;
          // return false
          break;
        default:
          print("executing default " + response.statusCode.toString());
          return null;
      }
    } catch (error) {
      print(error);
      print("error occured");
    }
  }

  Future<dynamic> deleteItemInBucket(String itemID) async {
    String path = this.bucketName + "/" + itemID.toString();
    Uri uri = Uri.http(AUTHORITY, path);
    http.Response response = await http.delete(uri);

    switch (response.statusCode) {
      case 200:
        String body = response.body;
        break;
      case 500:
        null;
        break;
      default:
        null;
    }
  }
}

class ProductActions extends RESTActions {
  ProductActions() : super("product");
}

class StoreRestAction extends AppHTTPFactory {
  getStore() {}
  Future<Map<String, dynamic>> loginStore(Map data) async {
    http.Response response = await http
        .post("http://api-dot-lubi-ep.appspot.com/api/store/login", body: data);
    switch (response.statusCode) {
      // change 400 to 200 when it is changed on the server
      case 400:
        print("OK login");
        Map<String, dynamic> convertedRes = json.decode(response.body);
        return convertedRes;
        break;
      case 500:
        print("failed login");
        return {"token": false};
      default:
        return {"token": false};
    }
  }

  updateStore() {}
}

class CategoryActions extends RESTActions {
  CategoryActions() : super("category");
}

class TransactionActions extends RESTActions {
  TransactionActions() : super("transaction");
}

class CustomerActions extends RESTActions {
  CustomerActions() : super("customer");
}

class UploadActions extends RESTActions {
  UploadActions() : super("customer");
}
