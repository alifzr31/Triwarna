// To parse this JSON data, do
//
//     final content = contentFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

Content contentFromJson(String str) => Content.fromJson(json.decode(str));

String contentToJson(Content data) => json.encode(data.toJson());

List<Content> listContentFromJson(String str) =>
    List<Content>.from(json.decode(str).map((x) => Content.fromJson(x)));

String listContentToJson(List<Content> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Content extends Equatable {
  final int? id;
  final String? authorId;
  final String? category;
  final String? title;
  final String? slug;
  final String? content;
  final String? featuredImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Content({
    this.id,
    this.authorId,
    this.category,
    this.title,
    this.slug,
    this.content,
    this.featuredImage,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        authorId,
        category,
        title,
        slug,
        content,
        featuredImage,
        createdAt,
        updatedAt,
      ];

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        authorId: json["author_id"],
        category: json["category"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        featuredImage: json["featured_image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": authorId,
        "category": category,
        "title": title,
        "slug": slug,
        "content": content,
        "featured_image": featuredImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
