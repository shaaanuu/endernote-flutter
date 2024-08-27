import 'dart:convert';

class NoteModel {
  String text = "";
  String title = "";
  final DateTime creationDate;
  DateTime lastUpdated;
  final String uuid;
  NoteModel({
    this.text = "",
    this.title = "",
    required this.creationDate,
    required this.lastUpdated,
    required this.uuid,
  });

  NoteModel copyWith({
    String? text,
    String? title,
    DateTime? creationDate,
    DateTime? lastUpdated,
    String? uuid,
  }) {
    return NoteModel(
      text: text ?? this.text,
      title: title ?? this.title,
      creationDate: creationDate ?? this.creationDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});
    result.addAll({'title': title});
    result.addAll({'creationDate': creationDate.millisecondsSinceEpoch});
    result.addAll({'lastUpdated': lastUpdated.millisecondsSinceEpoch});
    result.addAll({'uuid': uuid});

    return result;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      text: map['text'] ?? '',
      title: map['title'] ?? '',
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creationDate']),
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated']),
      uuid: map['uuid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.text == text &&
        other.title == title &&
        other.creationDate == creationDate &&
        other.lastUpdated == lastUpdated &&
        other.uuid == uuid;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        title.hashCode ^
        creationDate.hashCode ^
        lastUpdated.hashCode ^
        uuid.hashCode;
  }

  @override
  String toString() {
    return 'NoteModel(text: $text, title: $title, creationDate: $creationDate, lastUpdated: $lastUpdated, uuid: $uuid)';
  }
}
