import 'dart:convert';
import 'package:isar/isar.dart';

part 'note_model.g.dart';

@Collection()
class NoteModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  String text = "";
  String title = "";
  late DateTime creationDate;
  late DateTime lastUpdated;

  bool isFavorite = false;

  NoteModel({
    this.text = "",
    this.title = "",
    required this.creationDate,
    required this.lastUpdated,
    required this.uuid,
    this.isFavorite = false,
  });

  NoteModel copyWith({
    String? text,
    String? title,
    DateTime? creationDate,
    DateTime? lastUpdated,
    String? uuid,
    bool? isFavorite,
  }) {
    return NoteModel(
      text: text ?? this.text,
      title: title ?? this.title,
      creationDate: creationDate ?? this.creationDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      uuid: uuid ?? this.uuid,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});
    result.addAll({'title': title});
    result.addAll({'creationDate': creationDate.millisecondsSinceEpoch});
    result.addAll({'lastUpdated': lastUpdated.millisecondsSinceEpoch});
    result.addAll({'uuid': uuid});
    result.addAll({'isFavorite': isFavorite});

    return result;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      text: map['text'] ?? '',
      title: map['title'] ?? '',
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creationDate']),
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated']),
      uuid: map['uuid'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
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
        other.uuid == uuid &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        title.hashCode ^
        creationDate.hashCode ^
        lastUpdated.hashCode ^
        uuid.hashCode ^
        isFavorite.hashCode;
  }

  @override
  String toString() {
    return 'NoteModel(text: $text, title: $title, creationDate: $creationDate, lastUpdated: $lastUpdated, uuid: $uuid, isFavorite: $isFavorite)';
  }
}
