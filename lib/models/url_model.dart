class UrlModel {
  final String id;
  final String title;
  final String channelUrl;

  const UrlModel({
    this.id,
    this.title,
    this.channelUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'channelUrl': channelUrl,
    };
  }

  factory UrlModel.fromMap(Map<String, dynamic> map) {
    return UrlModel(
      id: map['id'],
      title: map['title'],
      channelUrl: map['channelUrl'],
    );
  }
}
