class Country {
  late String country;
  late CountryInfo countryInfo;
  late int cases;
  late int deaths;
  late int recovered;
  late int active;
  late String continent;

  Country(
      {required this.country,
      required this.countryInfo,
      required this.cases,
      required this.deaths,
      required this.recovered,
      required this.active,
      required this.continent});

  Country.fromJson(Map<dynamic, dynamic> json) {
    country = json['country'];
    countryInfo = (json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null)!;
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['active'];
    continent = json['continent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo.toJson();
    }
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    data['continent'] = this.continent;
    return data;
  }
}

class CountryInfo {
  late String flag;

  CountryInfo({required this.flag});

  CountryInfo.fromJson(Map<dynamic, dynamic> json) {
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    return data;
  }
}
