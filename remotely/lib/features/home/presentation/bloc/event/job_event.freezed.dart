// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobEvent()';
}


}

/// @nodoc
class $JobEventCopyWith<$Res>  {
$JobEventCopyWith(JobEvent _, $Res Function(JobEvent) __);
}


/// Adds pattern-matching-related methods to [JobEvent].
extension JobEventPatterns on JobEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchJobs value)?  fetchJobs,TResult Function( _BookMarkJob value)?  bookMarkJobs,TResult Function( _SearchJob value)?  searchJob,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchJobs() when fetchJobs != null:
return fetchJobs(_that);case _BookMarkJob() when bookMarkJobs != null:
return bookMarkJobs(_that);case _SearchJob() when searchJob != null:
return searchJob(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchJobs value)  fetchJobs,required TResult Function( _BookMarkJob value)  bookMarkJobs,required TResult Function( _SearchJob value)  searchJob,}){
final _that = this;
switch (_that) {
case _FetchJobs():
return fetchJobs(_that);case _BookMarkJob():
return bookMarkJobs(_that);case _SearchJob():
return searchJob(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchJobs value)?  fetchJobs,TResult? Function( _BookMarkJob value)?  bookMarkJobs,TResult? Function( _SearchJob value)?  searchJob,}){
final _that = this;
switch (_that) {
case _FetchJobs() when fetchJobs != null:
return fetchJobs(_that);case _BookMarkJob() when bookMarkJobs != null:
return bookMarkJobs(_that);case _SearchJob() when searchJob != null:
return searchJob(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchJobs,TResult Function( JobEntity job)?  bookMarkJobs,TResult Function( String query)?  searchJob,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchJobs() when fetchJobs != null:
return fetchJobs();case _BookMarkJob() when bookMarkJobs != null:
return bookMarkJobs(_that.job);case _SearchJob() when searchJob != null:
return searchJob(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchJobs,required TResult Function( JobEntity job)  bookMarkJobs,required TResult Function( String query)  searchJob,}) {final _that = this;
switch (_that) {
case _FetchJobs():
return fetchJobs();case _BookMarkJob():
return bookMarkJobs(_that.job);case _SearchJob():
return searchJob(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchJobs,TResult? Function( JobEntity job)?  bookMarkJobs,TResult? Function( String query)?  searchJob,}) {final _that = this;
switch (_that) {
case _FetchJobs() when fetchJobs != null:
return fetchJobs();case _BookMarkJob() when bookMarkJobs != null:
return bookMarkJobs(_that.job);case _SearchJob() when searchJob != null:
return searchJob(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _FetchJobs implements JobEvent {
  const _FetchJobs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchJobs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobEvent.fetchJobs()';
}


}




/// @nodoc


class _BookMarkJob implements JobEvent {
  const _BookMarkJob(this.job);
  

 final  JobEntity job;

/// Create a copy of JobEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookMarkJobCopyWith<_BookMarkJob> get copyWith => __$BookMarkJobCopyWithImpl<_BookMarkJob>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookMarkJob&&(identical(other.job, job) || other.job == job));
}


@override
int get hashCode => Object.hash(runtimeType,job);

@override
String toString() {
  return 'JobEvent.bookMarkJobs(job: $job)';
}


}

/// @nodoc
abstract mixin class _$BookMarkJobCopyWith<$Res> implements $JobEventCopyWith<$Res> {
  factory _$BookMarkJobCopyWith(_BookMarkJob value, $Res Function(_BookMarkJob) _then) = __$BookMarkJobCopyWithImpl;
@useResult
$Res call({
 JobEntity job
});




}
/// @nodoc
class __$BookMarkJobCopyWithImpl<$Res>
    implements _$BookMarkJobCopyWith<$Res> {
  __$BookMarkJobCopyWithImpl(this._self, this._then);

  final _BookMarkJob _self;
  final $Res Function(_BookMarkJob) _then;

/// Create a copy of JobEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? job = null,}) {
  return _then(_BookMarkJob(
null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity,
  ));
}


}

/// @nodoc


class _SearchJob implements JobEvent {
  const _SearchJob(this.query);
  

 final  String query;

/// Create a copy of JobEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchJobCopyWith<_SearchJob> get copyWith => __$SearchJobCopyWithImpl<_SearchJob>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchJob&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'JobEvent.searchJob(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchJobCopyWith<$Res> implements $JobEventCopyWith<$Res> {
  factory _$SearchJobCopyWith(_SearchJob value, $Res Function(_SearchJob) _then) = __$SearchJobCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchJobCopyWithImpl<$Res>
    implements _$SearchJobCopyWith<$Res> {
  __$SearchJobCopyWithImpl(this._self, this._then);

  final _SearchJob _self;
  final $Res Function(_SearchJob) _then;

/// Create a copy of JobEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchJob(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
