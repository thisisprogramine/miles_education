import 'package:equatable/equatable.dart';

class FeedParams extends Equatable{
  final String table;
  final String id;
  final String spaceId;
  final String expirationTimestamp;
  final String signature;
  final String downloadName;

  const FeedParams({
    required this.table,
    required this.id,
    required this.spaceId,
    required this.expirationTimestamp,
    required this.signature,
    required this.downloadName,
  });

  Map<String, String> toJson() => {
    "table": table,
    "id": id,
    "spaceId": spaceId,
    "expirationTimestamp": expirationTimestamp,
    "signature": signature,
    "downloadName": downloadName,
  };

  @override
  List<Object?> get props => [table, id, spaceId, expirationTimestamp, signature, downloadName];
}