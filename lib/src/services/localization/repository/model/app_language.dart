import 'dart:convert';

class AppLanguage {
  final String? imageUrl;
  final String languageName;
  final String languageCode;
  final String countryCode;

  const AppLanguage({
    this.imageUrl,
    required this.languageName,
    required this.languageCode,
    required this.countryCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'languageName': languageName,
      'languageCode': languageCode,
      'countryCode': countryCode,
    };
  }

  factory AppLanguage.fromMap(Map<String, dynamic> map) {
    return AppLanguage(
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      languageName: map['languageName'] as String,
      languageCode: map['languageCode'] as String,
      countryCode: map['countryCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppLanguage.fromJson(String source) =>
      AppLanguage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppLanguage(imageUrl: $imageUrl,\n languageName: $languageName,\n languageCode: $languageCode,\n countryCode: $countryCode,\n)';
  }

  @override
  bool operator ==(covariant AppLanguage other) {
    if (identical(this, other)) return true;

    return other.imageUrl == imageUrl &&
        other.languageName == languageName &&
        other.languageCode == languageCode &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        languageName.hashCode ^
        languageCode.hashCode ^
        countryCode.hashCode;
  }
}
