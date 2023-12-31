class MeditationModel {
  MeditationModel({
    required this.meditation,
  });
  late final List<Meditation> meditation;

  MeditationModel.fromJson(Map<String, dynamic> json) {
    meditation = List.from(json['meditation'])
        .map((e) => Meditation.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meditation'] = meditation.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Meditation {
  Meditation({
    required this.id,
    required this.title,
    required this.file,
  });
  late final int id;
  late final String title;
  late final String file;

  Meditation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['file'] = file;
    return _data;
  }
}
