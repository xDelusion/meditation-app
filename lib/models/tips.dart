class TipsModel {
  TipsModel({
    required this.data,
  });
  late final List<MyTips> data;

  TipsModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => MyTips.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MyTips {
  int id;
  String text;
  String author;
  List<dynamic> upvotes;
  List<dynamic> downvotes;
  late final List<MyTips> data;
  MyTips(
      {required this.id,
      required this.text,
      required this.author,
      required this.upvotes,
      required this.downvotes});

  factory MyTips.fromJson(Map<String, dynamic> json) {
    return MyTips(
        id: json['id'] as int,
        text: json['text'] as String,
        author: json['author'] as String,
        upvotes: List<dynamic>.from(json['upvotes'] as List<dynamic>),
        downvotes: List<dynamic>.from(json['downvotes'] as List<dynamic>));
  }

  get createdAt => null;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['text'] = text;
    _data['author'] = author;
    _data['upvotes'] = upvotes;
    _data['downvotes'] = downvotes;
    return _data;
  }

  MyTips.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        author = map['author'],
        upvotes = List<dynamic>.from(map['upvotes']),
        downvotes = List<dynamic>.from(map['downvotes']);

  // Method to handle upvoting
  void upvoteTip() {
    upvotes.add(1);
  }
}
