class Continent {
  late String continent;
  late List<String> countries;

  Continent({required this.continent, required this.countries});

  Continent.fromJson(Map<String, dynamic> json) {
    continent = json['continent'];
    countries = json['countries'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['continent'] = this.continent;
    data['countries'] = this.countries;
    return data;
  }
}
