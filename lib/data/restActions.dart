import "package:http/http.dart" as http;
/*
* Is responsible for getting store buckets e.g products, categories and the rest
 */

class RESTActions {
  static final STORE_ID = "/api/store/" + "5d91e79a5c79ec2e14b67483" + "/";
  static final String AUTHORITY = "localhost:5000";

  final String bucketName;

  RESTActions(this.bucketName) {}

  Future<String> getBucketItems({Map<String, dynamic> filter}) async {
    String path = this.bucketName;
    String response = await http.read(Uri.http(AUTHORITY, STORE_ID + path));
    print("printing response");
    return response;
  }

  Future<String> getBucketItem(String itemID) async {
    String path = this.bucketName + "/" + itemID;
    String response = await http.read(Uri.http(AUTHORITY, STORE_ID + path));
    print("printing response");
    return response;
  }

  Future<dynamic> postToBucket(Map<String, dynamic> item) async {
    String path = this.bucketName;
    Uri uri = Uri.http(AUTHORITY, STORE_ID + path);
    http.Response response = await http.post(uri, body: item);

    switch (response.statusCode) {
      case 200:
        String body = response.body;
        return body;
        break;
      case 500:
        null;
        break;
      default:
        null;
    }
  }

  Future<dynamic> putInBucket(String itemID, dynamic item) async {
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
//  @override
//  Future<String> getBucketItems({Map<String, dynamic> filter}) async {
//    // TODO: implement getBucketItems
//    var rawString = await super.getBucketItems(filter: filter);
//
//    List<dynamic> decodedList = json.decode(rawString);
//
//    ProductListModel d = ProductListModel(decodedList);
//
//    return rawString;
//  }
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
