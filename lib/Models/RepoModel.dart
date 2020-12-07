import 'package:json_annotation/json_annotation.dart';
part 'RepoModel.g.dart';
/// class [RepoModel] class hold repos data

@JsonSerializable()
class RepoModel{
  final String _repoUrl, _title, _description, _owner, _avatarUrl, _language;
  final int _watchers;
  /// @constructor RepoModel
  /// 1. @params [repoUrl] Private String hold repo url in github.com
  /// 2. @params [title] Private String hold title of the repo
  /// 3. @params [description] Private String hold description of the repo
  /// 4. @params [owner] Private String hold owner of the repo
  /// 5. @params [avatarUrl] Private String hold owner's image of the repo
  /// 6. @params [language] Private String hold which language the repo use
  /// 7. @params [watchers] Private int hold number of watchers for the repo
  RepoModel(this._repoUrl, this._title, this._description, this._owner,this._avatarUrl,
      this._language,this._watchers);

  /// The language that owner's use in the repo
  String get language => _language;

  /// The owner name
  String get owner => _owner;

  /// The repo description
  String get description => _description;

  /// The repo title
  String get title => _title;

  /// The repo url
  String get repoUrl => _repoUrl;

  /// The owner avatar
  get avatarUrl => _avatarUrl;

  /// Number of repo's watchers
  int get watchers => _watchers;

  /// [fromJson] function change json api data to [RepoModel] object
  factory RepoModel.fromJson(Map<String, dynamic> json) => _$RepoModelFromJson(json);

  @override
  String toString() {
    return 'RepoModel{_repoUrl: $_repoUrl, _title: $_title, _description: $_description, _owner: $_owner, _avatarUrl: $_avatarUrl, _language: $_language, _watchers: $_watchers}';
  }
}