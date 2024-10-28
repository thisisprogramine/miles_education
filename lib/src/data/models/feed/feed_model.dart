
import 'dart:developer';

import 'package:miles_education/src/domain/entities/feed/feed_entity.dart';

class FeedModel extends FeedEntity{
  final List<Data>? data;

  FeedModel({
    this.data,
  }) : super(feedData: data);

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data extends FeedData{
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
  final List<Post>? posts;

  Data({
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
  }) : super(
    id: id,
    blockType: blockType,
    name: name,
    heading: heading,
    position: position,
    count: count,
    active: active,
    createdAt: createdAt,
    updatedAt: updatedAt,
    vertical: vertical,
    createdBy: createdBy,
    modifiedBy: modifiedBy,
    posts: posts,
  );

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      blockType: json["block_type"],
      name: json["name"],
      heading: json["heading"],
      position: json["position"],
      count: json["count"],
      active: json["active"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      vertical: json["vertical"],
      createdBy: json["created_by"],
      modifiedBy: json["modified_by"],
      posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "block_type": blockType,
    "name": name,
    "heading": heading,
    "position": position,
    "count": count,
    "active": active,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "vertical": vertical,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class Post extends PostData{
  final String? id;
  final List<FileElement>? files;
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

  Post({
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
  }) : super(
    id: id,
    files: files,
    likedByMe: likedByMe,
    title: title,
    postType: postType,
    description: description,
    metadata: metadata,
    fullVideoUrl: fullVideoUrl,
    blogUrl: blogUrl,
    active: active,
    featured: featured,
    priority: priority,
    likes: likes,
    createdAt: createdAt,
    updatedAt: updatedAt,
    createdBy: createdBy,
    layout: layout,
    persona: persona,
    modifiedBy: modifiedBy,
  );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
    likedByMe: json["liked_by_me"],
    title: json["title"],
    postType: json["post_type"],
    description: json["description"],
    metadata: json["metadata"],
    fullVideoUrl: json["full_video_url"],
    blogUrl: json["blog_url"],
    active: json["active"],
    featured: json["featured"],
    priority: json["priority"],
    likes: json["likes"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    createdBy: json["created_by"],
    layout: json["layout"],
    persona: json["persona"],
    modifiedBy: json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
    "liked_by_me": likedByMe,
    "title": title,
    "post_type": postType,
    "description": description,
    "metadata": metadata,
    "full_video_url": fullVideoUrl,
    "blog_url": blogUrl,
    "active": active,
    "featured": featured,
    "priority": priority,
    "likes": likes,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "created_by": createdBy,
    "layout": layout,
    "persona": persona,
    "modified_by": modifiedBy,
  };
}

class FileElement extends FileElementData{
  final String? id;
  final String? mediaType;
  final String? videoUrl;
  final String? thumbnail;
  final String? imagePath;
  final int? mediaOrder;
  final dynamic ratio;
  final bool? active;
  final String? post;

  FileElement({
    this.id,
    this.mediaType,
    this.videoUrl,
    this.thumbnail,
    this.imagePath,
    this.mediaOrder,
    this.ratio,
    this.active,
    this.post,
  }) : super(
    id: id,
    mediaType: mediaType,
    videoUrl: videoUrl,
    thumbnail: thumbnail,
    imagePath: imagePath,
    mediaOrder: mediaOrder,
    ratio: ratio,
    active: active,
    post: post,
  );

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    id: json["id"],
    mediaType: json["media_type"],
    videoUrl: json["video_url"],
    thumbnail: json["thumbnail"],
    imagePath: json["image_path"],
    mediaOrder: json["media_order"],
    ratio: json["ratio"],
    active: json["active"],
    post: json["post"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaType,
    "video_url": videoUrl,
    "thumbnail": thumbnail,
    "image_path": imagePath,
    "media_order": mediaOrder,
    "ratio": ratio,
    "active": active,
    "post": post,
  };
}

