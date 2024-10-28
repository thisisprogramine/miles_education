
import '../../../domain/entities/testimonials/testimonials_entity.dart';

class TestimonialsModel extends TestimonialsEntity{
  final String? message;
  final List<Data>? data;

  TestimonialsModel({
    this.message,
    this.data,
  }) : super(
    message: message,
    testimonialsdata: data
  );

  factory TestimonialsModel.fromJson(Map<String, dynamic> json) => TestimonialsModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data extends TestimonialsData{
  final String? id;
  final bool? likedByMe;
  final String? firstName;
  final String? lastName;
  final String? description;
  final String? imageUrl;
  final String? videoUrl;
  final dynamic fullVideoUrl;
  final int? likes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;
  final String? modifiedBy;
  final bool? watched;

  Data({
    this.id,
    this.likedByMe,
    this.firstName,
    this.lastName,
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.fullVideoUrl,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.modifiedBy,
    this.watched,
  }) : super(
    id: id,
    likedByMe: likedByMe,
    firstName: firstName,
    lastName: lastName,
    description: description,
    imageUrl: imageUrl,
    videoUrl: videoUrl,
    fullVideoUrl: fullVideoUrl,
    likes: likes,
    createdAt: createdAt,
    updatedAt: updatedAt,
    createdBy: createdBy,
    modifiedBy: modifiedBy,
    watched: watched,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    likedByMe: json["liked_by_me"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    description: json["description"],
    imageUrl: json["image_url"],
    videoUrl: json["video_url"],
    fullVideoUrl: json["full_video_url"],
    likes: json["likes"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    modifiedBy: json["modified_by"],
    watched: json["watched"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "liked_by_me": likedByMe,
    "first_name": firstName,
    "last_name": lastName,
    "description": description,
    "image_url": imageUrl,
    "video_url": videoUrl,
    "full_video_url": fullVideoUrl,
    "likes": likes,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "watched": watched,
  };
}
