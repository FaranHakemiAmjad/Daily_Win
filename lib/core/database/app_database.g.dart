// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserAccountTableTable extends UserAccountTable
    with TableInfo<$UserAccountTableTable, UserAccountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, email, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_account_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserAccountTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserAccountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAccountTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      ),
    );
  }

  @override
  $UserAccountTableTable createAlias(String alias) {
    return $UserAccountTableTable(attachedDatabase, alias);
  }
}

class UserAccountTableData extends DataClass
    implements Insertable<UserAccountTableData> {
  final String id;
  final String email;
  final DateTime? lastSyncedAt;
  const UserAccountTableData({
    required this.id,
    required this.email,
    this.lastSyncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    return map;
  }

  UserAccountTableCompanion toCompanion(bool nullToAbsent) {
    return UserAccountTableCompanion(
      id: Value(id),
      email: Value(email),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
    );
  }

  factory UserAccountTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAccountTableData(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
    };
  }

  UserAccountTableData copyWith({
    String? id,
    String? email,
    Value<DateTime?> lastSyncedAt = const Value.absent(),
  }) => UserAccountTableData(
    id: id ?? this.id,
    email: email ?? this.email,
    lastSyncedAt: lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
  );
  UserAccountTableData copyWithCompanion(UserAccountTableCompanion data) {
    return UserAccountTableData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAccountTableData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAccountTableData &&
          other.id == this.id &&
          other.email == this.email &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class UserAccountTableCompanion extends UpdateCompanion<UserAccountTableData> {
  final Value<String> id;
  final Value<String> email;
  final Value<DateTime?> lastSyncedAt;
  final Value<int> rowid;
  const UserAccountTableCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAccountTableCompanion.insert({
    required String id,
    required String email,
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       email = Value(email);
  static Insertable<UserAccountTableData> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<DateTime>? lastSyncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAccountTableCompanion copyWith({
    Value<String>? id,
    Value<String>? email,
    Value<DateTime?>? lastSyncedAt,
    Value<int>? rowid,
  }) {
    return UserAccountTableCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAccountTableCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfileTableTable extends UserProfileTable
    with TableInfo<$UserProfileTableTable, UserProfileTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_account_table (id)',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Gender, String> gender =
      GeneratedColumn<String>(
        'gender',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Gender>($UserProfileTableTable.$convertergender);
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _biographyMeta = const VerificationMeta(
    'biography',
  );
  @override
  late final GeneratedColumn<String> biography = GeneratedColumn<String>(
    'biography',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profileImagePathMeta = const VerificationMeta(
    'profileImagePath',
  );
  @override
  late final GeneratedColumn<String> profileImagePath = GeneratedColumn<String>(
    'profile_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    gender,
    dateOfBirth,
    biography,
    profileImagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profile_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('biography')) {
      context.handle(
        _biographyMeta,
        biography.isAcceptableOrUnknown(data['biography']!, _biographyMeta),
      );
    }
    if (data.containsKey('profile_image_path')) {
      context.handle(
        _profileImagePathMeta,
        profileImagePath.isAcceptableOrUnknown(
          data['profile_image_path']!,
          _profileImagePathMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {username};
  @override
  UserProfileTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      gender: $UserProfileTableTable.$convertergender.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gender'],
        )!,
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      )!,
      biography: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}biography'],
      ),
      profileImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_image_path'],
      ),
    );
  }

  @override
  $UserProfileTableTable createAlias(String alias) {
    return $UserProfileTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Gender, String, String> $convertergender =
      const EnumNameConverter<Gender>(Gender.values);
}

class UserProfileTableData extends DataClass
    implements Insertable<UserProfileTableData> {
  final String id;
  final String username;
  final Gender gender;
  final DateTime dateOfBirth;
  final String? biography;
  final String? profileImagePath;
  const UserProfileTableData({
    required this.id,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    this.biography,
    this.profileImagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    {
      map['gender'] = Variable<String>(
        $UserProfileTableTable.$convertergender.toSql(gender),
      );
    }
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    if (!nullToAbsent || biography != null) {
      map['biography'] = Variable<String>(biography);
    }
    if (!nullToAbsent || profileImagePath != null) {
      map['profile_image_path'] = Variable<String>(profileImagePath);
    }
    return map;
  }

  UserProfileTableCompanion toCompanion(bool nullToAbsent) {
    return UserProfileTableCompanion(
      id: Value(id),
      username: Value(username),
      gender: Value(gender),
      dateOfBirth: Value(dateOfBirth),
      biography: biography == null && nullToAbsent
          ? const Value.absent()
          : Value(biography),
      profileImagePath: profileImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImagePath),
    );
  }

  factory UserProfileTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileTableData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      gender: $UserProfileTableTable.$convertergender.fromJson(
        serializer.fromJson<String>(json['gender']),
      ),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      biography: serializer.fromJson<String?>(json['biography']),
      profileImagePath: serializer.fromJson<String?>(json['profileImagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'gender': serializer.toJson<String>(
        $UserProfileTableTable.$convertergender.toJson(gender),
      ),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'biography': serializer.toJson<String?>(biography),
      'profileImagePath': serializer.toJson<String?>(profileImagePath),
    };
  }

  UserProfileTableData copyWith({
    String? id,
    String? username,
    Gender? gender,
    DateTime? dateOfBirth,
    Value<String?> biography = const Value.absent(),
    Value<String?> profileImagePath = const Value.absent(),
  }) => UserProfileTableData(
    id: id ?? this.id,
    username: username ?? this.username,
    gender: gender ?? this.gender,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    biography: biography.present ? biography.value : this.biography,
    profileImagePath: profileImagePath.present
        ? profileImagePath.value
        : this.profileImagePath,
  );
  UserProfileTableData copyWithCompanion(UserProfileTableCompanion data) {
    return UserProfileTableData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      gender: data.gender.present ? data.gender.value : this.gender,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      biography: data.biography.present ? data.biography.value : this.biography,
      profileImagePath: data.profileImagePath.present
          ? data.profileImagePath.value
          : this.profileImagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileTableData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('biography: $biography, ')
          ..write('profileImagePath: $profileImagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    username,
    gender,
    dateOfBirth,
    biography,
    profileImagePath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileTableData &&
          other.id == this.id &&
          other.username == this.username &&
          other.gender == this.gender &&
          other.dateOfBirth == this.dateOfBirth &&
          other.biography == this.biography &&
          other.profileImagePath == this.profileImagePath);
}

class UserProfileTableCompanion extends UpdateCompanion<UserProfileTableData> {
  final Value<String> id;
  final Value<String> username;
  final Value<Gender> gender;
  final Value<DateTime> dateOfBirth;
  final Value<String?> biography;
  final Value<String?> profileImagePath;
  final Value<int> rowid;
  const UserProfileTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.biography = const Value.absent(),
    this.profileImagePath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfileTableCompanion.insert({
    required String id,
    required String username,
    required Gender gender,
    required DateTime dateOfBirth,
    this.biography = const Value.absent(),
    this.profileImagePath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       username = Value(username),
       gender = Value(gender),
       dateOfBirth = Value(dateOfBirth);
  static Insertable<UserProfileTableData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? gender,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? biography,
    Expression<String>? profileImagePath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (gender != null) 'gender': gender,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (biography != null) 'biography': biography,
      if (profileImagePath != null) 'profile_image_path': profileImagePath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfileTableCompanion copyWith({
    Value<String>? id,
    Value<String>? username,
    Value<Gender>? gender,
    Value<DateTime>? dateOfBirth,
    Value<String?>? biography,
    Value<String?>? profileImagePath,
    Value<int>? rowid,
  }) {
    return UserProfileTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      biography: biography ?? this.biography,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(
        $UserProfileTableTable.$convertergender.toSql(gender.value),
      );
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (biography.present) {
      map['biography'] = Variable<String>(biography.value);
    }
    if (profileImagePath.present) {
      map['profile_image_path'] = Variable<String>(profileImagePath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('biography: $biography, ')
          ..write('profileImagePath: $profileImagePath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitTableTable extends HabitTable
    with TableInfo<$HabitTableTable, HabitTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<String> userID = GeneratedColumn<String>(
    'user_i_d',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_account_table (id)',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profile_table (username)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _datasourceMeta = const VerificationMeta(
    'datasource',
  );
  @override
  late final GeneratedColumn<String> datasource = GeneratedColumn<String>(
    'datasource',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreatedMeta = const VerificationMeta(
    'dateCreated',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
    'date_created',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userID,
    username,
    title,
    description,
    category,
    datasource,
    dateCreated,
    color,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_i_d')) {
      context.handle(
        _userIDMeta,
        userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta),
      );
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('datasource')) {
      context.handle(
        _datasourceMeta,
        datasource.isAcceptableOrUnknown(data['datasource']!, _datasourceMeta),
      );
    } else if (isInserting) {
      context.missing(_datasourceMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
        _dateCreatedMeta,
        dateCreated.isAcceptableOrUnknown(
          data['date_created']!,
          _dateCreatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_i_d'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      datasource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}datasource'],
      )!,
      dateCreated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_created'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
    );
  }

  @override
  $HabitTableTable createAlias(String alias) {
    return $HabitTableTable(attachedDatabase, alias);
  }
}

class HabitTableData extends DataClass implements Insertable<HabitTableData> {
  final int id;
  final String userID;
  final String username;
  final String title;
  final String? description;
  final String category;
  final String datasource;
  final DateTime dateCreated;
  final int color;
  const HabitTableData({
    required this.id,
    required this.userID,
    required this.username,
    required this.title,
    this.description,
    required this.category,
    required this.datasource,
    required this.dateCreated,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_i_d'] = Variable<String>(userID);
    map['username'] = Variable<String>(username);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['category'] = Variable<String>(category);
    map['datasource'] = Variable<String>(datasource);
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['color'] = Variable<int>(color);
    return map;
  }

  HabitTableCompanion toCompanion(bool nullToAbsent) {
    return HabitTableCompanion(
      id: Value(id),
      userID: Value(userID),
      username: Value(username),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: Value(category),
      datasource: Value(datasource),
      dateCreated: Value(dateCreated),
      color: Value(color),
    );
  }

  factory HabitTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitTableData(
      id: serializer.fromJson<int>(json['id']),
      userID: serializer.fromJson<String>(json['userID']),
      username: serializer.fromJson<String>(json['username']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      datasource: serializer.fromJson<String>(json['datasource']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userID': serializer.toJson<String>(userID),
      'username': serializer.toJson<String>(username),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String>(category),
      'datasource': serializer.toJson<String>(datasource),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'color': serializer.toJson<int>(color),
    };
  }

  HabitTableData copyWith({
    int? id,
    String? userID,
    String? username,
    String? title,
    Value<String?> description = const Value.absent(),
    String? category,
    String? datasource,
    DateTime? dateCreated,
    int? color,
  }) => HabitTableData(
    id: id ?? this.id,
    userID: userID ?? this.userID,
    username: username ?? this.username,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    category: category ?? this.category,
    datasource: datasource ?? this.datasource,
    dateCreated: dateCreated ?? this.dateCreated,
    color: color ?? this.color,
  );
  HabitTableData copyWithCompanion(HabitTableCompanion data) {
    return HabitTableData(
      id: data.id.present ? data.id.value : this.id,
      userID: data.userID.present ? data.userID.value : this.userID,
      username: data.username.present ? data.username.value : this.username,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      datasource: data.datasource.present
          ? data.datasource.value
          : this.datasource,
      dateCreated: data.dateCreated.present
          ? data.dateCreated.value
          : this.dateCreated,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitTableData(')
          ..write('id: $id, ')
          ..write('userID: $userID, ')
          ..write('username: $username, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('datasource: $datasource, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userID,
    username,
    title,
    description,
    category,
    datasource,
    dateCreated,
    color,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitTableData &&
          other.id == this.id &&
          other.userID == this.userID &&
          other.username == this.username &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.datasource == this.datasource &&
          other.dateCreated == this.dateCreated &&
          other.color == this.color);
}

class HabitTableCompanion extends UpdateCompanion<HabitTableData> {
  final Value<int> id;
  final Value<String> userID;
  final Value<String> username;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> category;
  final Value<String> datasource;
  final Value<DateTime> dateCreated;
  final Value<int> color;
  const HabitTableCompanion({
    this.id = const Value.absent(),
    this.userID = const Value.absent(),
    this.username = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.datasource = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.color = const Value.absent(),
  });
  HabitTableCompanion.insert({
    this.id = const Value.absent(),
    required String userID,
    required String username,
    required String title,
    this.description = const Value.absent(),
    required String category,
    required String datasource,
    required DateTime dateCreated,
    required int color,
  }) : userID = Value(userID),
       username = Value(username),
       title = Value(title),
       category = Value(category),
       datasource = Value(datasource),
       dateCreated = Value(dateCreated),
       color = Value(color);
  static Insertable<HabitTableData> custom({
    Expression<int>? id,
    Expression<String>? userID,
    Expression<String>? username,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? datasource,
    Expression<DateTime>? dateCreated,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userID != null) 'user_i_d': userID,
      if (username != null) 'username': username,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (datasource != null) 'datasource': datasource,
      if (dateCreated != null) 'date_created': dateCreated,
      if (color != null) 'color': color,
    });
  }

  HabitTableCompanion copyWith({
    Value<int>? id,
    Value<String>? userID,
    Value<String>? username,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? category,
    Value<String>? datasource,
    Value<DateTime>? dateCreated,
    Value<int>? color,
  }) {
    return HabitTableCompanion(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      username: username ?? this.username,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      datasource: datasource ?? this.datasource,
      dateCreated: dateCreated ?? this.dateCreated,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<String>(userID.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (datasource.present) {
      map['datasource'] = Variable<String>(datasource.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitTableCompanion(')
          ..write('id: $id, ')
          ..write('userID: $userID, ')
          ..write('username: $username, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('datasource: $datasource, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $HabitTargetTableTable extends HabitTargetTable
    with TableInfo<$HabitTargetTableTable, HabitTargetTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTargetTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habit_table (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, unit, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_target_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitTargetTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HabitTargetTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitTargetTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $HabitTargetTableTable createAlias(String alias) {
    return $HabitTargetTableTable(attachedDatabase, alias);
  }
}

class HabitTargetTableData extends DataClass
    implements Insertable<HabitTargetTableData> {
  final int id;
  final String type;
  final String unit;
  final double value;
  const HabitTargetTableData({
    required this.id,
    required this.type,
    required this.unit,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['unit'] = Variable<String>(unit);
    map['value'] = Variable<double>(value);
    return map;
  }

  HabitTargetTableCompanion toCompanion(bool nullToAbsent) {
    return HabitTargetTableCompanion(
      id: Value(id),
      type: Value(type),
      unit: Value(unit),
      value: Value(value),
    );
  }

  factory HabitTargetTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitTargetTableData(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      unit: serializer.fromJson<String>(json['unit']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'unit': serializer.toJson<String>(unit),
      'value': serializer.toJson<double>(value),
    };
  }

  HabitTargetTableData copyWith({
    int? id,
    String? type,
    String? unit,
    double? value,
  }) => HabitTargetTableData(
    id: id ?? this.id,
    type: type ?? this.type,
    unit: unit ?? this.unit,
    value: value ?? this.value,
  );
  HabitTargetTableData copyWithCompanion(HabitTargetTableCompanion data) {
    return HabitTargetTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      unit: data.unit.present ? data.unit.value : this.unit,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitTargetTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('unit: $unit, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, unit, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitTargetTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.unit == this.unit &&
          other.value == this.value);
}

class HabitTargetTableCompanion extends UpdateCompanion<HabitTargetTableData> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> unit;
  final Value<double> value;
  final Value<int> rowid;
  const HabitTargetTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitTargetTableCompanion.insert({
    required int id,
    required String type,
    required String unit,
    required double value,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       unit = Value(unit),
       value = Value(value);
  static Insertable<HabitTargetTableData> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? unit,
    Expression<double>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (unit != null) 'unit': unit,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitTargetTableCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<String>? unit,
    Value<double>? value,
    Value<int>? rowid,
  }) {
    return HabitTargetTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitTargetTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitScheduleTableTable extends HabitScheduleTable
    with TableInfo<$HabitScheduleTableTable, HabitScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habit_table (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekdaysMeta = const VerificationMeta(
    'weekdays',
  );
  @override
  late final GeneratedColumn<String> weekdays = GeneratedColumn<String>(
    'weekdays',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, weekdays];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_schedule_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitScheduleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('weekdays')) {
      context.handle(
        _weekdaysMeta,
        weekdays.isAcceptableOrUnknown(data['weekdays']!, _weekdaysMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HabitScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitScheduleTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      weekdays: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weekdays'],
      ),
    );
  }

  @override
  $HabitScheduleTableTable createAlias(String alias) {
    return $HabitScheduleTableTable(attachedDatabase, alias);
  }
}

class HabitScheduleTableData extends DataClass
    implements Insertable<HabitScheduleTableData> {
  final int id;
  final String type;
  final String? weekdays;
  const HabitScheduleTableData({
    required this.id,
    required this.type,
    this.weekdays,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || weekdays != null) {
      map['weekdays'] = Variable<String>(weekdays);
    }
    return map;
  }

  HabitScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return HabitScheduleTableCompanion(
      id: Value(id),
      type: Value(type),
      weekdays: weekdays == null && nullToAbsent
          ? const Value.absent()
          : Value(weekdays),
    );
  }

  factory HabitScheduleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitScheduleTableData(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      weekdays: serializer.fromJson<String?>(json['weekdays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'weekdays': serializer.toJson<String?>(weekdays),
    };
  }

  HabitScheduleTableData copyWith({
    int? id,
    String? type,
    Value<String?> weekdays = const Value.absent(),
  }) => HabitScheduleTableData(
    id: id ?? this.id,
    type: type ?? this.type,
    weekdays: weekdays.present ? weekdays.value : this.weekdays,
  );
  HabitScheduleTableData copyWithCompanion(HabitScheduleTableCompanion data) {
    return HabitScheduleTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      weekdays: data.weekdays.present ? data.weekdays.value : this.weekdays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitScheduleTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('weekdays: $weekdays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, weekdays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitScheduleTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.weekdays == this.weekdays);
}

class HabitScheduleTableCompanion
    extends UpdateCompanion<HabitScheduleTableData> {
  final Value<int> id;
  final Value<String> type;
  final Value<String?> weekdays;
  final Value<int> rowid;
  const HabitScheduleTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.weekdays = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitScheduleTableCompanion.insert({
    required int id,
    required String type,
    this.weekdays = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type);
  static Insertable<HabitScheduleTableData> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? weekdays,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (weekdays != null) 'weekdays': weekdays,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitScheduleTableCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<String?>? weekdays,
    Value<int>? rowid,
  }) {
    return HabitScheduleTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      weekdays: weekdays ?? this.weekdays,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (weekdays.present) {
      map['weekdays'] = Variable<String>(weekdays.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('weekdays: $weekdays, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitReminderTableTable extends HabitReminderTable
    with TableInfo<$HabitReminderTableTable, HabitReminderTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitReminderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habit_table (id)',
    ),
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour = GeneratedColumn<int>(
    'hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
    'minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, enabled, hour, minute];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_reminder_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitReminderTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(
        _hourMeta,
        hour.isAcceptableOrUnknown(data['hour']!, _hourMeta),
      );
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(
        _minuteMeta,
        minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta),
      );
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HabitReminderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitReminderTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      hour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hour'],
      )!,
      minute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minute'],
      )!,
    );
  }

  @override
  $HabitReminderTableTable createAlias(String alias) {
    return $HabitReminderTableTable(attachedDatabase, alias);
  }
}

class HabitReminderTableData extends DataClass
    implements Insertable<HabitReminderTableData> {
  final int id;
  final bool enabled;
  final int hour;
  final int minute;
  const HabitReminderTableData({
    required this.id,
    required this.enabled,
    required this.hour,
    required this.minute,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['enabled'] = Variable<bool>(enabled);
    map['hour'] = Variable<int>(hour);
    map['minute'] = Variable<int>(minute);
    return map;
  }

  HabitReminderTableCompanion toCompanion(bool nullToAbsent) {
    return HabitReminderTableCompanion(
      id: Value(id),
      enabled: Value(enabled),
      hour: Value(hour),
      minute: Value(minute),
    );
  }

  factory HabitReminderTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitReminderTableData(
      id: serializer.fromJson<int>(json['id']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      hour: serializer.fromJson<int>(json['hour']),
      minute: serializer.fromJson<int>(json['minute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'enabled': serializer.toJson<bool>(enabled),
      'hour': serializer.toJson<int>(hour),
      'minute': serializer.toJson<int>(minute),
    };
  }

  HabitReminderTableData copyWith({
    int? id,
    bool? enabled,
    int? hour,
    int? minute,
  }) => HabitReminderTableData(
    id: id ?? this.id,
    enabled: enabled ?? this.enabled,
    hour: hour ?? this.hour,
    minute: minute ?? this.minute,
  );
  HabitReminderTableData copyWithCompanion(HabitReminderTableCompanion data) {
    return HabitReminderTableData(
      id: data.id.present ? data.id.value : this.id,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      hour: data.hour.present ? data.hour.value : this.hour,
      minute: data.minute.present ? data.minute.value : this.minute,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitReminderTableData(')
          ..write('id: $id, ')
          ..write('enabled: $enabled, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, enabled, hour, minute);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitReminderTableData &&
          other.id == this.id &&
          other.enabled == this.enabled &&
          other.hour == this.hour &&
          other.minute == this.minute);
}

class HabitReminderTableCompanion
    extends UpdateCompanion<HabitReminderTableData> {
  final Value<int> id;
  final Value<bool> enabled;
  final Value<int> hour;
  final Value<int> minute;
  final Value<int> rowid;
  const HabitReminderTableCompanion({
    this.id = const Value.absent(),
    this.enabled = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitReminderTableCompanion.insert({
    required int id,
    required bool enabled,
    required int hour,
    required int minute,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       enabled = Value(enabled),
       hour = Value(hour),
       minute = Value(minute);
  static Insertable<HabitReminderTableData> custom({
    Expression<int>? id,
    Expression<bool>? enabled,
    Expression<int>? hour,
    Expression<int>? minute,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (enabled != null) 'enabled': enabled,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitReminderTableCompanion copyWith({
    Value<int>? id,
    Value<bool>? enabled,
    Value<int>? hour,
    Value<int>? minute,
    Value<int>? rowid,
  }) {
    return HabitReminderTableCompanion(
      id: id ?? this.id,
      enabled: enabled ?? this.enabled,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitReminderTableCompanion(')
          ..write('id: $id, ')
          ..write('enabled: $enabled, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserAccountTableTable userAccountTable = $UserAccountTableTable(
    this,
  );
  late final $UserProfileTableTable userProfileTable = $UserProfileTableTable(
    this,
  );
  late final $HabitTableTable habitTable = $HabitTableTable(this);
  late final $HabitTargetTableTable habitTargetTable = $HabitTargetTableTable(
    this,
  );
  late final $HabitScheduleTableTable habitScheduleTable =
      $HabitScheduleTableTable(this);
  late final $HabitReminderTableTable habitReminderTable =
      $HabitReminderTableTable(this);
  late final UserAccountDao userAccountDao = UserAccountDao(
    this as AppDatabase,
  );
  late final UserProfileDao userProfileDao = UserProfileDao(
    this as AppDatabase,
  );
  late final HabitMutationDao habitMutationDao = HabitMutationDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userAccountTable,
    userProfileTable,
    habitTable,
    habitTargetTable,
    habitScheduleTable,
    habitReminderTable,
  ];
}

typedef $$UserAccountTableTableCreateCompanionBuilder =
    UserAccountTableCompanion Function({
      required String id,
      required String email,
      Value<DateTime?> lastSyncedAt,
      Value<int> rowid,
    });
typedef $$UserAccountTableTableUpdateCompanionBuilder =
    UserAccountTableCompanion Function({
      Value<String> id,
      Value<String> email,
      Value<DateTime?> lastSyncedAt,
      Value<int> rowid,
    });

final class $$UserAccountTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserAccountTableTable,
          UserAccountTableData
        > {
  $$UserAccountTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$UserProfileTableTable, List<UserProfileTableData>>
  _userProfileTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userProfileTable,
    aliasName: 'user_account_table__id__user_profile_table__id',
  );

  $$UserProfileTableTableProcessedTableManager get userProfileTableRefs {
    final manager = $$UserProfileTableTableTableManager(
      $_db,
      $_db.userProfileTable,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userProfileTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HabitTableTable, List<HabitTableData>>
  _habitTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.habitTable,
    aliasName: 'user_account_table__id__habit_table__user_i_d',
  );

  $$HabitTableTableProcessedTableManager get habitTableRefs {
    final manager = $$HabitTableTableTableManager(
      $_db,
      $_db.habitTable,
    ).filter((f) => f.userID.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_habitTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserAccountTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserAccountTableTable> {
  $$UserAccountTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userProfileTableRefs(
    Expression<bool> Function($$UserProfileTableTableFilterComposer f) f,
  ) {
    final $$UserProfileTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userProfileTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfileTableTableFilterComposer(
            $db: $db,
            $table: $db.userProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> habitTableRefs(
    Expression<bool> Function($$HabitTableTableFilterComposer f) f,
  ) {
    final $$HabitTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableFilterComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserAccountTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserAccountTableTable> {
  $$UserAccountTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserAccountTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserAccountTableTable> {
  $$UserAccountTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  Expression<T> userProfileTableRefs<T extends Object>(
    Expression<T> Function($$UserProfileTableTableAnnotationComposer a) f,
  ) {
    final $$UserProfileTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userProfileTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfileTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> habitTableRefs<T extends Object>(
    Expression<T> Function($$HabitTableTableAnnotationComposer a) f,
  ) {
    final $$HabitTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserAccountTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserAccountTableTable,
          UserAccountTableData,
          $$UserAccountTableTableFilterComposer,
          $$UserAccountTableTableOrderingComposer,
          $$UserAccountTableTableAnnotationComposer,
          $$UserAccountTableTableCreateCompanionBuilder,
          $$UserAccountTableTableUpdateCompanionBuilder,
          (UserAccountTableData, $$UserAccountTableTableReferences),
          UserAccountTableData,
          PrefetchHooks Function({
            bool userProfileTableRefs,
            bool habitTableRefs,
          })
        > {
  $$UserAccountTableTableTableManager(
    _$AppDatabase db,
    $UserAccountTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAccountTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAccountTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAccountTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserAccountTableCompanion(
                id: id,
                email: email,
                lastSyncedAt: lastSyncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String email,
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserAccountTableCompanion.insert(
                id: id,
                email: email,
                lastSyncedAt: lastSyncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserAccountTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userProfileTableRefs = false, habitTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userProfileTableRefs) db.userProfileTable,
                    if (habitTableRefs) db.habitTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userProfileTableRefs)
                        await $_getPrefetchedData<
                          UserAccountTableData,
                          $UserAccountTableTable,
                          UserProfileTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UserAccountTableTableReferences
                              ._userProfileTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserAccountTableTableReferences(
                                db,
                                table,
                                p0,
                              ).userProfileTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) =>
                                  referencedItems.where((e) => e.id == item.id),
                          typedResults: items,
                        ),
                      if (habitTableRefs)
                        await $_getPrefetchedData<
                          UserAccountTableData,
                          $UserAccountTableTable,
                          HabitTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UserAccountTableTableReferences
                              ._habitTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserAccountTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userID == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UserAccountTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserAccountTableTable,
      UserAccountTableData,
      $$UserAccountTableTableFilterComposer,
      $$UserAccountTableTableOrderingComposer,
      $$UserAccountTableTableAnnotationComposer,
      $$UserAccountTableTableCreateCompanionBuilder,
      $$UserAccountTableTableUpdateCompanionBuilder,
      (UserAccountTableData, $$UserAccountTableTableReferences),
      UserAccountTableData,
      PrefetchHooks Function({bool userProfileTableRefs, bool habitTableRefs})
    >;
typedef $$UserProfileTableTableCreateCompanionBuilder =
    UserProfileTableCompanion Function({
      required String id,
      required String username,
      required Gender gender,
      required DateTime dateOfBirth,
      Value<String?> biography,
      Value<String?> profileImagePath,
      Value<int> rowid,
    });
typedef $$UserProfileTableTableUpdateCompanionBuilder =
    UserProfileTableCompanion Function({
      Value<String> id,
      Value<String> username,
      Value<Gender> gender,
      Value<DateTime> dateOfBirth,
      Value<String?> biography,
      Value<String?> profileImagePath,
      Value<int> rowid,
    });

final class $$UserProfileTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserProfileTableTable,
          UserProfileTableData
        > {
  $$UserProfileTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserAccountTableTable _idTable(_$AppDatabase db) => db
      .userAccountTable
      .createAlias('user_profile_table__id__user_account_table__id');

  $$UserAccountTableTableProcessedTableManager get id {
    final $_column = $_itemColumn<String>('id')!;

    final manager = $$UserAccountTableTableTableManager(
      $_db,
      $_db.userAccountTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HabitTableTable, List<HabitTableData>>
  _habitTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.habitTable,
    aliasName: 'user_profile_table__username__habit_table__username',
  );

  $$HabitTableTableProcessedTableManager get habitTableRefs {
    final manager = $$HabitTableTableTableManager($_db, $_db.habitTable).filter(
      (f) => f.username.username.sqlEquals($_itemColumn<String>('username')!),
    );

    final cache = $_typedResult.readTableOrNull(_habitTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfileTableTable> {
  $$UserProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Gender, Gender, String> get gender =>
      $composableBuilder(
        column: $table.gender,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get biography => $composableBuilder(
    column: $table.biography,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileImagePath => $composableBuilder(
    column: $table.profileImagePath,
    builder: (column) => ColumnFilters(column),
  );

  $$UserAccountTableTableFilterComposer get id {
    final $$UserAccountTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userAccountTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserAccountTableTableFilterComposer(
            $db: $db,
            $table: $db.userAccountTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> habitTableRefs(
    Expression<bool> Function($$HabitTableTableFilterComposer f) f,
  ) {
    final $$HabitTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.username,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.username,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableFilterComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfileTableTable> {
  $$UserProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get biography => $composableBuilder(
    column: $table.biography,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileImagePath => $composableBuilder(
    column: $table.profileImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserAccountTableTableOrderingComposer get id {
    final $$UserAccountTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userAccountTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserAccountTableTableOrderingComposer(
            $db: $db,
            $table: $db.userAccountTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfileTableTable> {
  $$UserProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get biography =>
      $composableBuilder(column: $table.biography, builder: (column) => column);

  GeneratedColumn<String> get profileImagePath => $composableBuilder(
    column: $table.profileImagePath,
    builder: (column) => column,
  );

  $$UserAccountTableTableAnnotationComposer get id {
    final $$UserAccountTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userAccountTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserAccountTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userAccountTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> habitTableRefs<T extends Object>(
    Expression<T> Function($$HabitTableTableAnnotationComposer a) f,
  ) {
    final $$HabitTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.username,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.username,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfileTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfileTableTable,
          UserProfileTableData,
          $$UserProfileTableTableFilterComposer,
          $$UserProfileTableTableOrderingComposer,
          $$UserProfileTableTableAnnotationComposer,
          $$UserProfileTableTableCreateCompanionBuilder,
          $$UserProfileTableTableUpdateCompanionBuilder,
          (UserProfileTableData, $$UserProfileTableTableReferences),
          UserProfileTableData,
          PrefetchHooks Function({bool id, bool habitTableRefs})
        > {
  $$UserProfileTableTableTableManager(
    _$AppDatabase db,
    $UserProfileTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfileTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfileTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<Gender> gender = const Value.absent(),
                Value<DateTime> dateOfBirth = const Value.absent(),
                Value<String?> biography = const Value.absent(),
                Value<String?> profileImagePath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfileTableCompanion(
                id: id,
                username: username,
                gender: gender,
                dateOfBirth: dateOfBirth,
                biography: biography,
                profileImagePath: profileImagePath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String username,
                required Gender gender,
                required DateTime dateOfBirth,
                Value<String?> biography = const Value.absent(),
                Value<String?> profileImagePath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfileTableCompanion.insert(
                id: id,
                username: username,
                gender: gender,
                dateOfBirth: dateOfBirth,
                biography: biography,
                profileImagePath: profileImagePath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserProfileTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false, habitTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (habitTableRefs) db.habitTable],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.id,
                                referencedTable:
                                    $$UserProfileTableTableReferences._idTable(
                                      db,
                                    ),
                                referencedColumn:
                                    $$UserProfileTableTableReferences
                                        ._idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitTableRefs)
                    await $_getPrefetchedData<
                      UserProfileTableData,
                      $UserProfileTableTable,
                      HabitTableData
                    >(
                      currentTable: table,
                      referencedTable: $$UserProfileTableTableReferences
                          ._habitTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserProfileTableTableReferences(
                            db,
                            table,
                            p0,
                          ).habitTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.username == item.username,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfileTableTable,
      UserProfileTableData,
      $$UserProfileTableTableFilterComposer,
      $$UserProfileTableTableOrderingComposer,
      $$UserProfileTableTableAnnotationComposer,
      $$UserProfileTableTableCreateCompanionBuilder,
      $$UserProfileTableTableUpdateCompanionBuilder,
      (UserProfileTableData, $$UserProfileTableTableReferences),
      UserProfileTableData,
      PrefetchHooks Function({bool id, bool habitTableRefs})
    >;
typedef $$HabitTableTableCreateCompanionBuilder =
    HabitTableCompanion Function({
      Value<int> id,
      required String userID,
      required String username,
      required String title,
      Value<String?> description,
      required String category,
      required String datasource,
      required DateTime dateCreated,
      required int color,
    });
typedef $$HabitTableTableUpdateCompanionBuilder =
    HabitTableCompanion Function({
      Value<int> id,
      Value<String> userID,
      Value<String> username,
      Value<String> title,
      Value<String?> description,
      Value<String> category,
      Value<String> datasource,
      Value<DateTime> dateCreated,
      Value<int> color,
    });

final class $$HabitTableTableReferences
    extends BaseReferences<_$AppDatabase, $HabitTableTable, HabitTableData> {
  $$HabitTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserAccountTableTable _userIDTable(_$AppDatabase db) => db
      .userAccountTable
      .createAlias('habit_table__user_i_d__user_account_table__id');

  $$UserAccountTableTableProcessedTableManager get userID {
    final $_column = $_itemColumn<String>('user_i_d')!;

    final manager = $$UserAccountTableTableTableManager(
      $_db,
      $_db.userAccountTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserProfileTableTable _usernameTable(_$AppDatabase db) => db
      .userProfileTable
      .createAlias('habit_table__username__user_profile_table__username');

  $$UserProfileTableTableProcessedTableManager get username {
    final $_column = $_itemColumn<String>('username')!;

    final manager = $$UserProfileTableTableTableManager(
      $_db,
      $_db.userProfileTable,
    ).filter((f) => f.username.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usernameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HabitTargetTableTable, List<HabitTargetTableData>>
  _habitTargetTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.habitTargetTable,
    aliasName: 'habit_table__id__habit_target_table__id',
  );

  $$HabitTargetTableTableProcessedTableManager get habitTargetTableRefs {
    final manager = $$HabitTargetTableTableTableManager(
      $_db,
      $_db.habitTargetTable,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _habitTargetTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $HabitScheduleTableTable,
    List<HabitScheduleTableData>
  >
  _habitScheduleTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.habitScheduleTable,
        aliasName: 'habit_table__id__habit_schedule_table__id',
      );

  $$HabitScheduleTableTableProcessedTableManager get habitScheduleTableRefs {
    final manager = $$HabitScheduleTableTableTableManager(
      $_db,
      $_db.habitScheduleTable,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _habitScheduleTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $HabitReminderTableTable,
    List<HabitReminderTableData>
  >
  _habitReminderTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.habitReminderTable,
        aliasName: 'habit_table__id__habit_reminder_table__id',
      );

  $$HabitReminderTableTableProcessedTableManager get habitReminderTableRefs {
    final manager = $$HabitReminderTableTableTableManager(
      $_db,
      $_db.habitReminderTable,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _habitReminderTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HabitTableTableFilterComposer
    extends Composer<_$AppDatabase, $HabitTableTable> {
  $$HabitTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get datasource => $composableBuilder(
    column: $table.datasource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  $$UserAccountTableTableFilterComposer get userID {
    final $$UserAccountTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.userAccountTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserAccountTableTableFilterComposer(
            $db: $db,
            $table: $db.userAccountTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserProfileTableTableFilterComposer get username {
    final $$UserProfileTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.username,
      referencedTable: $db.userProfileTable,
      getReferencedColumn: (t) => t.username,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfileTableTableFilterComposer(
            $db: $db,
            $table: $db.userProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> habitTargetTableRefs(
    Expression<bool> Function($$HabitTargetTableTableFilterComposer f) f,
  ) {
    final $$HabitTargetTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTargetTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTargetTableTableFilterComposer(
            $db: $db,
            $table: $db.habitTargetTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> habitScheduleTableRefs(
    Expression<bool> Function($$HabitScheduleTableTableFilterComposer f) f,
  ) {
    final $$HabitScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitScheduleTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.habitScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> habitReminderTableRefs(
    Expression<bool> Function($$HabitReminderTableTableFilterComposer f) f,
  ) {
    final $$HabitReminderTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitReminderTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitReminderTableTableFilterComposer(
            $db: $db,
            $table: $db.habitReminderTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitTableTable> {
  $$HabitTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get datasource => $composableBuilder(
    column: $table.datasource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserAccountTableTableOrderingComposer get userID {
    final $$UserAccountTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.userAccountTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserAccountTableTableOrderingComposer(
            $db: $db,
            $table: $db.userAccountTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserProfileTableTableOrderingComposer get username {
    final $$UserProfileTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.username,
      referencedTable: $db.userProfileTable,
      getReferencedColumn: (t) => t.username,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfileTableTableOrderingComposer(
            $db: $db,
            $table: $db.userProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitTableTable> {
  $$HabitTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get datasource => $composableBuilder(
    column: $table.datasource,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => column,
  );

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  $$UserAccountTableTableAnnotationComposer get userID {
    final $$UserAccountTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.userAccountTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserAccountTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userAccountTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserProfileTableTableAnnotationComposer get username {
    final $$UserProfileTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.username,
      referencedTable: $db.userProfileTable,
      getReferencedColumn: (t) => t.username,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfileTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> habitTargetTableRefs<T extends Object>(
    Expression<T> Function($$HabitTargetTableTableAnnotationComposer a) f,
  ) {
    final $$HabitTargetTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTargetTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTargetTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitTargetTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> habitScheduleTableRefs<T extends Object>(
    Expression<T> Function($$HabitScheduleTableTableAnnotationComposer a) f,
  ) {
    final $$HabitScheduleTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.habitScheduleTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HabitScheduleTableTableAnnotationComposer(
                $db: $db,
                $table: $db.habitScheduleTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> habitReminderTableRefs<T extends Object>(
    Expression<T> Function($$HabitReminderTableTableAnnotationComposer a) f,
  ) {
    final $$HabitReminderTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.habitReminderTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HabitReminderTableTableAnnotationComposer(
                $db: $db,
                $table: $db.habitReminderTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$HabitTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitTableTable,
          HabitTableData,
          $$HabitTableTableFilterComposer,
          $$HabitTableTableOrderingComposer,
          $$HabitTableTableAnnotationComposer,
          $$HabitTableTableCreateCompanionBuilder,
          $$HabitTableTableUpdateCompanionBuilder,
          (HabitTableData, $$HabitTableTableReferences),
          HabitTableData,
          PrefetchHooks Function({
            bool userID,
            bool username,
            bool habitTargetTableRefs,
            bool habitScheduleTableRefs,
            bool habitReminderTableRefs,
          })
        > {
  $$HabitTableTableTableManager(_$AppDatabase db, $HabitTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userID = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> datasource = const Value.absent(),
                Value<DateTime> dateCreated = const Value.absent(),
                Value<int> color = const Value.absent(),
              }) => HabitTableCompanion(
                id: id,
                userID: userID,
                username: username,
                title: title,
                description: description,
                category: category,
                datasource: datasource,
                dateCreated: dateCreated,
                color: color,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userID,
                required String username,
                required String title,
                Value<String?> description = const Value.absent(),
                required String category,
                required String datasource,
                required DateTime dateCreated,
                required int color,
              }) => HabitTableCompanion.insert(
                id: id,
                userID: userID,
                username: username,
                title: title,
                description: description,
                category: category,
                datasource: datasource,
                dateCreated: dateCreated,
                color: color,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userID = false,
                username = false,
                habitTargetTableRefs = false,
                habitScheduleTableRefs = false,
                habitReminderTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (habitTargetTableRefs) db.habitTargetTable,
                    if (habitScheduleTableRefs) db.habitScheduleTable,
                    if (habitReminderTableRefs) db.habitReminderTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userID,
                                    referencedTable: $$HabitTableTableReferences
                                        ._userIDTable(db),
                                    referencedColumn:
                                        $$HabitTableTableReferences
                                            ._userIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (username) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.username,
                                    referencedTable: $$HabitTableTableReferences
                                        ._usernameTable(db),
                                    referencedColumn:
                                        $$HabitTableTableReferences
                                            ._usernameTable(db)
                                            .username,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (habitTargetTableRefs)
                        await $_getPrefetchedData<
                          HabitTableData,
                          $HabitTableTable,
                          HabitTargetTableData
                        >(
                          currentTable: table,
                          referencedTable: $$HabitTableTableReferences
                              ._habitTargetTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitTargetTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) =>
                                  referencedItems.where((e) => e.id == item.id),
                          typedResults: items,
                        ),
                      if (habitScheduleTableRefs)
                        await $_getPrefetchedData<
                          HabitTableData,
                          $HabitTableTable,
                          HabitScheduleTableData
                        >(
                          currentTable: table,
                          referencedTable: $$HabitTableTableReferences
                              ._habitScheduleTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitScheduleTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) =>
                                  referencedItems.where((e) => e.id == item.id),
                          typedResults: items,
                        ),
                      if (habitReminderTableRefs)
                        await $_getPrefetchedData<
                          HabitTableData,
                          $HabitTableTable,
                          HabitReminderTableData
                        >(
                          currentTable: table,
                          referencedTable: $$HabitTableTableReferences
                              ._habitReminderTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitReminderTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) =>
                                  referencedItems.where((e) => e.id == item.id),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HabitTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitTableTable,
      HabitTableData,
      $$HabitTableTableFilterComposer,
      $$HabitTableTableOrderingComposer,
      $$HabitTableTableAnnotationComposer,
      $$HabitTableTableCreateCompanionBuilder,
      $$HabitTableTableUpdateCompanionBuilder,
      (HabitTableData, $$HabitTableTableReferences),
      HabitTableData,
      PrefetchHooks Function({
        bool userID,
        bool username,
        bool habitTargetTableRefs,
        bool habitScheduleTableRefs,
        bool habitReminderTableRefs,
      })
    >;
typedef $$HabitTargetTableTableCreateCompanionBuilder =
    HabitTargetTableCompanion Function({
      required int id,
      required String type,
      required String unit,
      required double value,
      Value<int> rowid,
    });
typedef $$HabitTargetTableTableUpdateCompanionBuilder =
    HabitTargetTableCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<String> unit,
      Value<double> value,
      Value<int> rowid,
    });

final class $$HabitTargetTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HabitTargetTableTable,
          HabitTargetTableData
        > {
  $$HabitTargetTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitTableTable _idTable(_$AppDatabase db) =>
      db.habitTable.createAlias('habit_target_table__id__habit_table__id');

  $$HabitTableTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$HabitTableTableTableManager(
      $_db,
      $_db.habitTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitTargetTableTableFilterComposer
    extends Composer<_$AppDatabase, $HabitTargetTableTable> {
  $$HabitTargetTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitTableTableFilterComposer get id {
    final $$HabitTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableFilterComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitTargetTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitTargetTableTable> {
  $$HabitTargetTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitTableTableOrderingComposer get id {
    final $$HabitTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableOrderingComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitTargetTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitTargetTableTable> {
  $$HabitTargetTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$HabitTableTableAnnotationComposer get id {
    final $$HabitTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitTargetTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitTargetTableTable,
          HabitTargetTableData,
          $$HabitTargetTableTableFilterComposer,
          $$HabitTargetTableTableOrderingComposer,
          $$HabitTargetTableTableAnnotationComposer,
          $$HabitTargetTableTableCreateCompanionBuilder,
          $$HabitTargetTableTableUpdateCompanionBuilder,
          (HabitTargetTableData, $$HabitTargetTableTableReferences),
          HabitTargetTableData,
          PrefetchHooks Function({bool id})
        > {
  $$HabitTargetTableTableTableManager(
    _$AppDatabase db,
    $HabitTargetTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitTargetTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitTargetTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitTargetTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitTargetTableCompanion(
                id: id,
                type: type,
                unit: unit,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String type,
                required String unit,
                required double value,
                Value<int> rowid = const Value.absent(),
              }) => HabitTargetTableCompanion.insert(
                id: id,
                type: type,
                unit: unit,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitTargetTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.id,
                                referencedTable:
                                    $$HabitTargetTableTableReferences._idTable(
                                      db,
                                    ),
                                referencedColumn:
                                    $$HabitTargetTableTableReferences
                                        ._idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitTargetTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitTargetTableTable,
      HabitTargetTableData,
      $$HabitTargetTableTableFilterComposer,
      $$HabitTargetTableTableOrderingComposer,
      $$HabitTargetTableTableAnnotationComposer,
      $$HabitTargetTableTableCreateCompanionBuilder,
      $$HabitTargetTableTableUpdateCompanionBuilder,
      (HabitTargetTableData, $$HabitTargetTableTableReferences),
      HabitTargetTableData,
      PrefetchHooks Function({bool id})
    >;
typedef $$HabitScheduleTableTableCreateCompanionBuilder =
    HabitScheduleTableCompanion Function({
      required int id,
      required String type,
      Value<String?> weekdays,
      Value<int> rowid,
    });
typedef $$HabitScheduleTableTableUpdateCompanionBuilder =
    HabitScheduleTableCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<String?> weekdays,
      Value<int> rowid,
    });

final class $$HabitScheduleTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HabitScheduleTableTable,
          HabitScheduleTableData
        > {
  $$HabitScheduleTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitTableTable _idTable(_$AppDatabase db) =>
      db.habitTable.createAlias('habit_schedule_table__id__habit_table__id');

  $$HabitTableTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$HabitTableTableTableManager(
      $_db,
      $_db.habitTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitScheduleTableTableFilterComposer
    extends Composer<_$AppDatabase, $HabitScheduleTableTable> {
  $$HabitScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weekdays => $composableBuilder(
    column: $table.weekdays,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitTableTableFilterComposer get id {
    final $$HabitTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableFilterComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitScheduleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitScheduleTableTable> {
  $$HabitScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weekdays => $composableBuilder(
    column: $table.weekdays,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitTableTableOrderingComposer get id {
    final $$HabitTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableOrderingComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitScheduleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitScheduleTableTable> {
  $$HabitScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get weekdays =>
      $composableBuilder(column: $table.weekdays, builder: (column) => column);

  $$HabitTableTableAnnotationComposer get id {
    final $$HabitTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitScheduleTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitScheduleTableTable,
          HabitScheduleTableData,
          $$HabitScheduleTableTableFilterComposer,
          $$HabitScheduleTableTableOrderingComposer,
          $$HabitScheduleTableTableAnnotationComposer,
          $$HabitScheduleTableTableCreateCompanionBuilder,
          $$HabitScheduleTableTableUpdateCompanionBuilder,
          (HabitScheduleTableData, $$HabitScheduleTableTableReferences),
          HabitScheduleTableData,
          PrefetchHooks Function({bool id})
        > {
  $$HabitScheduleTableTableTableManager(
    _$AppDatabase db,
    $HabitScheduleTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitScheduleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitScheduleTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> weekdays = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitScheduleTableCompanion(
                id: id,
                type: type,
                weekdays: weekdays,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String type,
                Value<String?> weekdays = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitScheduleTableCompanion.insert(
                id: id,
                type: type,
                weekdays: weekdays,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitScheduleTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.id,
                                referencedTable:
                                    $$HabitScheduleTableTableReferences
                                        ._idTable(db),
                                referencedColumn:
                                    $$HabitScheduleTableTableReferences
                                        ._idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitScheduleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitScheduleTableTable,
      HabitScheduleTableData,
      $$HabitScheduleTableTableFilterComposer,
      $$HabitScheduleTableTableOrderingComposer,
      $$HabitScheduleTableTableAnnotationComposer,
      $$HabitScheduleTableTableCreateCompanionBuilder,
      $$HabitScheduleTableTableUpdateCompanionBuilder,
      (HabitScheduleTableData, $$HabitScheduleTableTableReferences),
      HabitScheduleTableData,
      PrefetchHooks Function({bool id})
    >;
typedef $$HabitReminderTableTableCreateCompanionBuilder =
    HabitReminderTableCompanion Function({
      required int id,
      required bool enabled,
      required int hour,
      required int minute,
      Value<int> rowid,
    });
typedef $$HabitReminderTableTableUpdateCompanionBuilder =
    HabitReminderTableCompanion Function({
      Value<int> id,
      Value<bool> enabled,
      Value<int> hour,
      Value<int> minute,
      Value<int> rowid,
    });

final class $$HabitReminderTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HabitReminderTableTable,
          HabitReminderTableData
        > {
  $$HabitReminderTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitTableTable _idTable(_$AppDatabase db) =>
      db.habitTable.createAlias('habit_reminder_table__id__habit_table__id');

  $$HabitTableTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$HabitTableTableTableManager(
      $_db,
      $_db.habitTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitReminderTableTableFilterComposer
    extends Composer<_$AppDatabase, $HabitReminderTableTable> {
  $$HabitReminderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitTableTableFilterComposer get id {
    final $$HabitTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableFilterComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitReminderTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitReminderTableTable> {
  $$HabitReminderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitTableTableOrderingComposer get id {
    final $$HabitTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableOrderingComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitReminderTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitReminderTableTable> {
  $$HabitReminderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get hour =>
      $composableBuilder(column: $table.hour, builder: (column) => column);

  GeneratedColumn<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => column);

  $$HabitTableTableAnnotationComposer get id {
    final $$HabitTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitReminderTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitReminderTableTable,
          HabitReminderTableData,
          $$HabitReminderTableTableFilterComposer,
          $$HabitReminderTableTableOrderingComposer,
          $$HabitReminderTableTableAnnotationComposer,
          $$HabitReminderTableTableCreateCompanionBuilder,
          $$HabitReminderTableTableUpdateCompanionBuilder,
          (HabitReminderTableData, $$HabitReminderTableTableReferences),
          HabitReminderTableData,
          PrefetchHooks Function({bool id})
        > {
  $$HabitReminderTableTableTableManager(
    _$AppDatabase db,
    $HabitReminderTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitReminderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitReminderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitReminderTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> hour = const Value.absent(),
                Value<int> minute = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitReminderTableCompanion(
                id: id,
                enabled: enabled,
                hour: hour,
                minute: minute,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required bool enabled,
                required int hour,
                required int minute,
                Value<int> rowid = const Value.absent(),
              }) => HabitReminderTableCompanion.insert(
                id: id,
                enabled: enabled,
                hour: hour,
                minute: minute,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitReminderTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.id,
                                referencedTable:
                                    $$HabitReminderTableTableReferences
                                        ._idTable(db),
                                referencedColumn:
                                    $$HabitReminderTableTableReferences
                                        ._idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitReminderTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitReminderTableTable,
      HabitReminderTableData,
      $$HabitReminderTableTableFilterComposer,
      $$HabitReminderTableTableOrderingComposer,
      $$HabitReminderTableTableAnnotationComposer,
      $$HabitReminderTableTableCreateCompanionBuilder,
      $$HabitReminderTableTableUpdateCompanionBuilder,
      (HabitReminderTableData, $$HabitReminderTableTableReferences),
      HabitReminderTableData,
      PrefetchHooks Function({bool id})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserAccountTableTableTableManager get userAccountTable =>
      $$UserAccountTableTableTableManager(_db, _db.userAccountTable);
  $$UserProfileTableTableTableManager get userProfileTable =>
      $$UserProfileTableTableTableManager(_db, _db.userProfileTable);
  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db, _db.habitTable);
  $$HabitTargetTableTableTableManager get habitTargetTable =>
      $$HabitTargetTableTableTableManager(_db, _db.habitTargetTable);
  $$HabitScheduleTableTableTableManager get habitScheduleTable =>
      $$HabitScheduleTableTableTableManager(_db, _db.habitScheduleTable);
  $$HabitReminderTableTableTableManager get habitReminderTable =>
      $$HabitReminderTableTableTableManager(_db, _db.habitReminderTable);
}
