class MyTips {
  int id;
  String text;
  String author;
  List<dynamic> upvotes;
  List<dynamic> downvotes;

  MyTips({
    required this.id,
    required this.text,
    required this.author,
    required this.upvotes,
    required this.downvotes,
  });

  factory MyTips.fromJson(Map<String, dynamic> json) {
    return MyTips(
      id: json['id'] as int,
      text: json['text'] as String,
      author: json['author'] as String,
      upvotes: List<dynamic>.from(json['upvotes'] as List<dynamic>),
      downvotes: List<dynamic>.from(json['downvotes'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
      'upvotes': upvotes,
      'downvotes': downvotes,
    };
  }
}
