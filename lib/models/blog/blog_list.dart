class BlogList {
  String id;
  DateTime createdAt;
  String title;
  String imageUrl;

  BlogList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdAt = json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        title = json['title'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'createdAt': this.createdAt,
        'title': this.title,
        'imageUrl': this.imageUrl,
      };
}
