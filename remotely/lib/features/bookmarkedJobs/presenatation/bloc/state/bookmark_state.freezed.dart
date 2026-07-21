// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookMarkState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookMarkState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookMarkState()';
}


}

/// @nodoc
class $BookMarkStateCopyWith<$Res>  {
$BookMarkStateCopyWith(BookMarkState _, $Res Function(BookMarkState) __);
}


/// Adds pattern-matching-related methods to [BookMarkState].
extension BookMarkStatePatterns on BookMarkState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _BookMarkedJobs value)?  bookmarkedJobs,TResult Function( _Intial value)?  intial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookMarkedJobs() when bookmarkedJobs != null:
return bookmarkedJobs(_that);case _Intial() when intial != null:
return intial(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _BookMarkedJobs value)  bookmarkedJobs,required TResult Function( _Intial value)  intial,}){
final _that = this;
switch (_that) {
case _BookMarkedJobs():
return bookmarkedJobs(_that);case _Intial():
return intial(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _BookMarkedJobs value)?  bookmarkedJobs,TResult? Function( _Intial value)?  intial,}){
final _that = this;
switch (_that) {
case _BookMarkedJobs() when bookmarkedJobs != null:
return bookmarkedJobs(_that);case _Intial() when intial != null:
return intial(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<JobEntity> jobs)?  bookmarkedJobs,TResult Function()?  intial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookMarkedJobs() when bookmarkedJobs != null:
return bookmarkedJobs(_that.jobs);case _Intial() when intial != null:
return intial();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<JobEntity> jobs)  bookmarkedJobs,required TResult Function()  intial,}) {final _that = this;
switch (_that) {
case _BookMarkedJobs():
return bookmarkedJobs(_that.jobs);case _Intial():
return intial();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<JobEntity> jobs)?  bookmarkedJobs,TResult? Function()?  intial,}) {final _that = this;
switch (_that) {
case _BookMarkedJobs() when bookmarkedJobs != null:
return bookmarkedJobs(_that.jobs);case _Intial() when intial != null:
return intial();case _:
  return null;

}
}

}

/// @nodoc


class _BookMarkedJobs implements BookMarkState {
   _BookMarkedJobs(final  List<JobEntity> jobs): _jobs = jobs;
  

 final  List<JobEntity> _jobs;
 List<JobEntity> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}


/// Create a copy of BookMarkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookMarkedJobsCopyWith<_BookMarkedJobs> get copyWith => __$BookMarkedJobsCopyWithImpl<_BookMarkedJobs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookMarkedJobs&&const DeepCollectionEquality().equals(other._jobs, _jobs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jobs));

@override
String toString() {
  return 'BookMarkState.bookmarkedJobs(jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class _$BookMarkedJobsCopyWith<$Res> implements $BookMarkStateCopyWith<$Res> {
  factory _$BookMarkedJobsCopyWith(_BookMarkedJobs value, $Res Function(_BookMarkedJobs) _then) = __$BookMarkedJobsCopyWithImpl;
@useResult
$Res call({
 List<JobEntity> jobs
});




}
/// @nodoc
class __$BookMarkedJobsCopyWithImpl<$Res>
    implements _$BookMarkedJobsCopyWith<$Res> {
  __$BookMarkedJobsCopyWithImpl(this._self, this._then);

  final _BookMarkedJobs _self;
  final $Res Function(_BookMarkedJobs) _then;

/// Create a copy of BookMarkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jobs = null,}) {
  return _then(_BookMarkedJobs(
null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,
  ));
}


}

/// @nodoc


class _Intial implements BookMarkState {
   _Intial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Intial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookMarkState.intial()';
}


}




// dart format on
