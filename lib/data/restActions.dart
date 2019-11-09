import "dart:convert";

import "package:http/http.dart" as http;

import "./AppStorage.dart";
/*
* Is responsible for getting store buckets e.g products, categories and the rest
 */

abstract class AppHTTPFactory {
  static String STORE_STRING = "/api/store/" + "5d91e79a5c79ec2e14b67483" + "/";
  static String Authority = "localhost:5000";
}

class RESTActions extends AppHTTPFactory {
  static String STORE_PATH = "/api/store";

  static String AUTHORITY = "api-dot-lubi-ep.appspot.com";

  final String bucketName;

  RESTActions(this.bucketName) {}

  Future<String> getBucketItems({Map<String, dynamic> filter}) async {
    Map token = await AppStorage().getStoreAuth();

    String internal_id = token['internal_id'];

    print("printed internal id");
    print(internal_id);

    String path = this.bucketName;
    String response = await http
        .read(Uri.http(AUTHORITY, STORE_PATH + "/" + internal_id + "/" + path));
    print("printing response for +" + path);
    print(response);
    return response;
  }

  Future<String> getBucketItem(String itemID) async {
    String path = this.bucketName + "/" + itemID;
    String response = await http.read(Uri.http(AUTHORITY, STORE_PATH + path));
    return response;
  }

  Future<dynamic> postToBucket(Map item) async {
    String path = this.bucketName;
    Uri uri = Uri.http(AUTHORITY, STORE_PATH + path);
    http.Response response = await http.post(uri, body: item);
    switch (response.statusCode) {
      case 200:
        String body = response.body;
        print("Successfully created an item");
        return body;
        break;
      case 500:
        print("Error creating an item");
        return false;
        break;
      default:
        null;
    }
  }

  Future<dynamic> putInBucket(String itemID, Map item) async {
    String path = this.bucketName + "/" + itemID.toString();
    Uri uri = Uri.http(AUTHORITY, path);
    http.Response response = await http.put(uri, body: item);

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
