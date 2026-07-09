// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_dao.dart';

// ignore_for_file: type=lint
mixin _$UserAccountDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserAccountTableTable get userAccountTable =>
      attachedDatabase.userAccountTable;
  UserAccountDaoManager get managers => UserAccountDaoManager(this);
}

class UserAccountDaoManager {
  final _$UserAccountDaoMixin _db;
  UserAccountDaoManager(this._db);
  $$UserAccountTableTableTableManager get userAccountTable =>
      $$UserAccountTableTableTableManager(
        _db.attachedDatabase,
        _db.userAccountTable,
      );
}
