// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dao.dart';

// ignore_for_file: type=lint
mixin _$UserProfileDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserAccountTableTable get userAccountTable =>
      attachedDatabase.userAccountTable;
  $UserProfileTableTable get userProfileTable =>
      attachedDatabase.userProfileTable;
  UserProfileDaoManager get managers => UserProfileDaoManager(this);
}

class UserProfileDaoManager {
  final _$UserProfileDaoMixin _db;
  UserProfileDaoManager(this._db);
  $$UserAccountTableTableTableManager get userAccountTable =>
      $$UserAccountTableTableTableManager(
        _db.attachedDatabase,
        _db.userAccountTable,
      );
  $$UserProfileTableTableTableManager get userProfileTable =>
      $$UserProfileTableTableTableManager(
        _db.attachedDatabase,
        _db.userProfileTable,
      );
}
