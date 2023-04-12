class UserProfileModel {
  int? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  String? createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;
  List<String>? authorities;

  UserProfileModel(
      {this.id,
      this.login,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.imageUrl,
      this.activated,
      this.langKey,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.authorities});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    activated = json['activated'];
    langKey = json['langKey'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
    authorities = json['authorities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    mapData['id'] = id;
    mapData['login'] = login;
    mapData['firstName'] = firstName;
    mapData['lastName'] = lastName;
    mapData['email'] = email;
    mapData['phone'] = phone;
    mapData['imageUrl'] = imageUrl;
    mapData['activated'] = activated;
    mapData['langKey'] = langKey;
    mapData['createdBy'] = createdBy;
    mapData['createdDate'] = createdDate;
    mapData['lastModifiedBy'] = lastModifiedBy;
    mapData['lastModifiedDate'] = lastModifiedDate;
    mapData['authorities'] = authorities;
    return mapData;
  }
}
