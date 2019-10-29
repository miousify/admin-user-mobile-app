class TransactionModel {
  String id;
  String description;
  String caption;
  double sellingPrice;
  String category;
  bool available;
  String image;

  TransactionModel(
      {this.id,
      this.description = "",
      this.category = "",
      this.caption = "",
      this.available = true,
      this.sellingPrice = 0,
      this.image = ""}) {
    print(id);
  }

  TransactionModel.fromJson(Map map)
      : id = map['_id'],
        description = map['description'],
        caption = map['caption'],
        sellingPrice = map['"sellingPrice'],
        category = map['category'],
        available = map['available'],
        image = map['image'];
}

class TransactionListModel {
  List<TransactionModel> items = List<TransactionModel>();
  TransactionListModel(List convertedList) {
    convertedList.forEach((node) {
      var product = node['item'];
      this.items.add(TransactionModel.fromJson(product));
    });
  }
}
