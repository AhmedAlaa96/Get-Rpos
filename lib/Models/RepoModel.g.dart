part of 'RepoModel.dart';

/// [RepoModelFromJson] function used to map from json object from [ApiManager] to [RepoModel] object
/// @Params [json] Map<String,dynamic> hold json response from [ApiManager]
RepoModel _$RepoModelFromJson(Map<String, dynamic> json){
  return RepoModel(
      json['html_url'] as String,
      json['name'] as String,
      json['description'] as String,
      json['owner']['login'] as String,
      json['owner']['avatar_url'] as String,
      json['language'] as String,
      json['watchers'] as int);
}
