import 'package:tddcleanarch_project_training/domains/entities/account_entity.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel(this.accessToken);

  factory RemoteAccountModel.fromjson(Map json) =>
      RemoteAccountModel(json['accessToken']);

  AccountEntity toEntity() => AccountEntity(accessToken);
}
