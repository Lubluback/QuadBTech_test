class MovieModel {
  String? name;
  String? summary;
  ImageUrl? image;
  MovieModel({this.name, this.summary, this.image});
  static List<MovieModel> fromApi(json) {
    final List<MovieModel> newlist = [];
    if (json != null && json is List) {
      for (var i in json) {
        newlist.add(MovieModel.fromJson(i["show"]));
      }
    }
    return newlist;
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json['name'] as String,
      summary: json['summary'] as String,
      image: json['image'] ==null?null: ImageUrl.fromJson(json['image']as Map<String,dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'summary': summary,
      'image': image,
    };
  }
}

class ImageUrl {
  String? original;
  ImageUrl({this.original});
  factory ImageUrl.fromJson(Map<String, dynamic> json) {
    return ImageUrl(
      original: json['original'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original,
    };
  }
}
