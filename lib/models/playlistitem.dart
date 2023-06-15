class Items {
  List<Playlist>? playlist;

  Items({this.playlist});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['playlist'] != null) {
      playlist = <Playlist>[];
      json['playlist'].forEach((v) {
        playlist!.add(new Playlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlist != null) {
      data['playlist'] = this.playlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  String? id;
  String? title;
  double? danceability;
  double? energy;
  int? mode;
  double? acousticness;
  double? tempo;
  int? durationMs;
  int? numSections;
  int? numSegments;
  int? index;

  Playlist(
      {this.id,
      this.title,
      this.danceability,
      this.energy,
      this.mode,
      this.acousticness,
      this.tempo,
      this.durationMs,
      this.numSections,
      this.numSegments,
      this.index});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    danceability = json['danceability'];
    energy = json['energy'];
    mode = json['mode'];
    acousticness = json['acousticness'];
    tempo = json['tempo'];
    durationMs = json['duration_ms'];
    numSections = json['num_sections'];
    numSegments = json['num_segments'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['danceability'] = this.danceability;
    data['energy'] = this.energy;
    data['mode'] = this.mode;
    data['acousticness'] = this.acousticness;
    data['tempo'] = this.tempo;
    data['duration_ms'] = this.durationMs;
    data['num_sections'] = this.numSections;
    data['num_segments'] = this.numSegments;
    data['index'] = this.index;
    return data;
  }
}
