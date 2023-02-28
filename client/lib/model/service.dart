class Service {
  late int workId;
  late String workName;
  late String description;
  late String category;
  late int initialPrice;
  late int intermediatePrice;
  late int advancedPrice;
  late String addedTime;

  Service(
      {required this.workId,
      required this.workName,
      required this.description,
      required this.category,
      required this.initialPrice,
      required this.intermediatePrice,
      required this.advancedPrice,
      required this.addedTime});

  Service.fromJson(Map<String, dynamic> json) {
    workId = json['workId'];
    workName = json['workName'];
    description = json['description'];
    category = json['category'];
    initialPrice = json['initialPrice'];
    intermediatePrice = json['intermediatePrice'];
    advancedPrice = json['advancedPrice'];
    addedTime = json['addedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workId'] = workId;
    data['workName'] = workName;
    data['description'] = description;
    data['category'] = category;
    data['initialPrice'] = initialPrice;
    data['intermediatePrice'] = intermediatePrice;
    data['advancedPrice'] = advancedPrice;
    data['addedTime'] = addedTime;
    return data;
  }
}