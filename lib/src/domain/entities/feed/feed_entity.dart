
class FeedEntity {
  final List<FeedData>? feedData;

  FeedEntity({
    this.feedData,
  });
}

class FeedData {
  final String? id;
  final String? blockType;
  final String? name;
  final String? heading;
  final int? position;
  final int? count;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final String? vertical;
  final String? createdBy;
  final String? modifiedBy;
  final List<PostData>? posts;

  FeedData({
    this.id,
    this.blockType,
    this.name,
    this.heading,
    this.position,
    this.count,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.vertical,
    this.createdBy,
    this.modifiedBy,
    this.posts,
  });
}

class PostData {
  final String? id;
  final List<FileElementData>? files;
  final bool? likedByMe;
  final String? title;
  final String? postType;
  final String? description;
  final String? metadata;
  final String? fullVideoUrl;
  final String? blogUrl;
  final bool? active;
  final bool? featured;
  final int? priority;
  final int? likes;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;
  final String? layout;
  final dynamic persona;
  final String? modifiedBy;

  PostData({
    this.id,
    this.files,
    this.likedByMe,
    this.title,
    this.postType,
    this.description,
    this.metadata,
    this.fullVideoUrl,
    this.blogUrl,
    this.active,
    this.featured,
    this.priority,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.layout,
    this.persona,
    this.modifiedBy,
  });
}

class FileElementData {
  final String? id;
  final String? mediaType;
  final String? videoUrl;
  final String? thumbnail;
  final String? imagePath;
  final int? mediaOrder;
  final dynamic ratio;
  final bool? active;
  final String? post;

  FileElementData({
    this.id,
    this.mediaType,
    this.videoUrl,
    this.thumbnail,
    this.imagePath,
    this.mediaOrder,
    this.ratio,
    this.active,
    this.post,
  });
}
