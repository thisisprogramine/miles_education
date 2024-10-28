
class TestimonialsEntity {
  final String? message;
  final List<TestimonialsData>? testimonialsdata;

  TestimonialsEntity({
    this.message,
    this.testimonialsdata,
  });
}

class TestimonialsData {
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

  TestimonialsData({
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
  });
}
