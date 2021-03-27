class BlogDetail {
  String id;
  String createdAt;
  String title;
  String imageUrl;

  BlogDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdAt = json['createdAt'],
        title = json['title'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'createdAt': this.createdAt,
        'title': this.title,
        'imageUrl': this.imageUrl,
      };
}
