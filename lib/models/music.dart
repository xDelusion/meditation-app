class MusicModel {
  MusicModel({
    required this.music,
  });
  late final List<Music> music;

  MusicModel.fromJson(Map<String, dynamic> json) {
    music = List.from(json['music']).map((e) => Music.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['music'] = music.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Music {
  Music({
    required this.id,
    required this.title,
    required this.file,
  });
  late final int id;
  late final String title;
  late final String file;

  Music.fromJson(Map<String, dynamic> json) {
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
