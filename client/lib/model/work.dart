
class Work {
    int? workId;
    String? workName;
    String? description;
    String? category;
    int? initialPrice;
    int? intermediatePrice;
    int? advancedPrice;
    String? addedTime;

    Work({this.workId, this.workName, this.description, this.category, this.initialPrice, this.intermediatePrice, this.advancedPrice, this.addedTime});

    Work.fromJson(Map<String, dynamic> json) {
        workId = json["workId"];
        workName = json["workName"];
        description = json["description"];
        category = json["category"];
        initialPrice = json["initialPrice"];
        intermediatePrice = json["intermediatePrice"];
        advancedPrice = json["advancedPrice"];
        addedTime = json["addedTime"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["workId"] = workId;
        _data["workName"] = workName;
        _data["description"] = description;
        _data["category"] = category;
        _data["initialPrice"] = initialPrice;
        _data["intermediatePrice"] = intermediatePrice;
        _data["advancedPrice"] = advancedPrice;
        _data["addedTime"] = addedTime;
        return _data;
    }

    
}