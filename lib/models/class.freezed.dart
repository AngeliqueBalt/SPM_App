// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Class _$ClassFromJson(Map<String, dynamic> json) {
  return _Class.fromJson(json);
}

/// @nodoc
mixin _$Class {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  User get teacher => throw _privateConstructorUsedError;
  List<User> get students => throw _privateConstructorUsedError;
  List<Quiz> get quizzes => throw _privateConstructorUsedError;
  @JsonKey(name: "activeQuiz")
  String? get activeQuizId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassCopyWith<Class> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassCopyWith<$Res> {
  factory $ClassCopyWith(Class value, $Res Function(Class) then) =
      _$ClassCopyWithImpl<$Res, Class>;
  @useResult
  $Res call(
      {String id,
      String name,
      User teacher,
      List<User> students,
      List<Quiz> quizzes,
      @JsonKey(name: "activeQuiz") String? activeQuizId});

  $UserCopyWith<$Res> get teacher;
}

/// @nodoc
class _$ClassCopyWithImpl<$Res, $Val extends Class>
    implements $ClassCopyWith<$Res> {
  _$ClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? teacher = null,
    Object? students = null,
    Object? quizzes = null,
    Object? activeQuizId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as User,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<User>,
      quizzes: null == quizzes
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      activeQuizId: freezed == activeQuizId
          ? _value.activeQuizId
          : activeQuizId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get teacher {
    return $UserCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClassImplCopyWith<$Res> implements $ClassCopyWith<$Res> {
  factory _$$ClassImplCopyWith(
          _$ClassImpl value, $Res Function(_$ClassImpl) then) =
      __$$ClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      User teacher,
      List<User> students,
      List<Quiz> quizzes,
      @JsonKey(name: "activeQuiz") String? activeQuizId});

  @override
  $UserCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$ClassImplCopyWithImpl<$Res>
    extends _$ClassCopyWithImpl<$Res, _$ClassImpl>
    implements _$$ClassImplCopyWith<$Res> {
  __$$ClassImplCopyWithImpl(
      _$ClassImpl _value, $Res Function(_$ClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? teacher = null,
    Object? students = null,
    Object? quizzes = null,
    Object? activeQuizId = freezed,
  }) {
    return _then(_$ClassImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as User,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<User>,
      quizzes: null == quizzes
          ? _value._quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      activeQuizId: freezed == activeQuizId
          ? _value.activeQuizId
          : activeQuizId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassImpl extends _Class {
  const _$ClassImpl(
      {required this.id,
      required this.name,
      required this.teacher,
      required final List<User> students,
      required final List<Quiz> quizzes,
      @JsonKey(name: "activeQuiz") required this.activeQuizId})
      : _students = students,
        _quizzes = quizzes,
        super._();

  factory _$ClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final User teacher;
  final List<User> _students;
  @override
  List<User> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  final List<Quiz> _quizzes;
  @override
  List<Quiz> get quizzes {
    if (_quizzes is EqualUnmodifiableListView) return _quizzes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

  @override
  @JsonKey(name: "activeQuiz")
  final String? activeQuizId;

  @override
  String toString() {
    return 'Class(id: $id, name: $name, teacher: $teacher, students: $students, quizzes: $quizzes, activeQuizId: $activeQuizId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes) &&
            (identical(other.activeQuizId, activeQuizId) ||
                other.activeQuizId == activeQuizId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      teacher,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_quizzes),
      activeQuizId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassImplCopyWith<_$ClassImpl> get copyWith =>
      __$$ClassImplCopyWithImpl<_$ClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassImplToJson(
      this,
    );
  }
}

abstract class _Class extends Class {
  const factory _Class(
          {required final String id,
          required final String name,
          required final User teacher,
          required final List<User> students,
          required final List<Quiz> quizzes,
          @JsonKey(name: "activeQuiz") required final String? activeQuizId}) =
      _$ClassImpl;
  const _Class._() : super._();

  factory _Class.fromJson(Map<String, dynamic> json) = _$ClassImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  User get teacher;
  @override
  List<User> get students;
  @override
  List<Quiz> get quizzes;
  @override
  @JsonKey(name: "activeQuiz")
  String? get activeQuizId;
  @override
  @JsonKey(ignore: true)
  _$$ClassImplCopyWith<_$ClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
