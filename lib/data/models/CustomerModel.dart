class CustomerModel {
  String id;
  String description;
  String caption;
  double sellingPrice;
  String category;
  bool available;
  String image;
  CustomerModel(
      {this.id,
      this.description = "",
      this.category = "",
      this.caption = "",
      this.available = true,
      this.sellingPrice = 0,
      this.image = ""}) {
    print(id);
  }

  CustomerModel.fromJson(Map map)
      : id = map['_id'],
        description = map['description'],
        caption = map['caption'],
        sellingPrice = map['"sellingPrice'],
        category = map['category'],
        available = map['available'],
        image = map['image'];
}

class CustomerListModel {
  List<CustomerModel> items = List<CustomerModel>();
  CustomerListModel(List convertedList) {
    convertedList.forEach((node) {
      var product = node['item'];
      this.items.add(CustomerModel.fromJson(product));
    });
  }
}
