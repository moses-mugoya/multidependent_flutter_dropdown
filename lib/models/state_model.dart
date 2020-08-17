class CountyModel {
  String name;
  String capital;
  int code;
  List<String> subCounties;

  CountyModel({this.name, this.capital, this.code, this.subCounties});

  CountyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    capital = json['capital'];
    code = json['code'];
    subCounties = json['sub_counties'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['capital'] = this.capital;
    data['code'] = this.code;
    data['sub_counties'] = this.subCounties;
    return data;
  }
}
