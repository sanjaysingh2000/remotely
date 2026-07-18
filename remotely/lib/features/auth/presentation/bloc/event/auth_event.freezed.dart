// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Login value)?  login,TResult Function( _Logout value)?  logout,TResult Function( _Signup value)?  signup,TResult Function( _ToggleAuthPage value)?  toggleAuthPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _Logout() when logout != null:
return logout(_that);case _Signup() when signup != null:
return signup(_that);case _ToggleAuthPage() when toggleAuthPage != null:
return toggleAuthPage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Login value)  login,required TResult Function( _Logout value)  logout,required TResult Function( _Signup value)  signup,required TResult Function( _ToggleAuthPage value)  toggleAuthPage,}){
final _that = this;
switch (_that) {
case _Login():
return login(_that);case _Logout():
return logout(_that);case _Signup():
return signup(_that);case _ToggleAuthPage():
return toggleAuthPage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Login value)?  login,TResult? Function( _Logout value)?  logout,TResult? Function( _Signup value)?  signup,TResult? Function( _ToggleAuthPage value)?  toggleAuthPage,}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _Logout() when logout != null:
return logout(_that);case _Signup() when signup != null:
return signup(_that);case _ToggleAuthPage() when toggleAuthPage != null:
return toggleAuthPage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  login,TResult Function()?  logout,TResult Function( String email,  String password)?  signup,TResult Function( bool isSignUp)?  toggleAuthPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.email,_that.password);case _Logout() when logout != null:
return logout();case _Signup() when signup != null:
return signup(_that.email,_that.password);case _ToggleAuthPage() when toggleAuthPage != null:
return toggleAuthPage(_that.isSignUp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  login,required TResult Function()  logout,required TResult Function( String email,  String password)  signup,required TResult Function( bool isSignUp)  toggleAuthPage,}) {final _that = this;
switch (_that) {
case _Login():
return login(_that.email,_that.password);case _Logout():
return logout();case _Signup():
return signup(_that.email,_that.password);case _ToggleAuthPage():
return toggleAuthPage(_that.isSignUp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  login,TResult? Function()?  logout,TResult? Function( String email,  String password)?  signup,TResult? Function( bool isSignUp)?  toggleAuthPage,}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.email,_that.password);case _Logout() when logout != null:
return logout();case _Signup() when signup != null:
return signup(_that.email,_that.password);case _ToggleAuthPage() when toggleAuthPage != null:
return toggleAuthPage(_that.isSignUp);case _:
  return null;

}
}

}

/// @nodoc


class _Login implements AuthEvent {
  const _Login(this.email, this.password);
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCopyWith<_Login> get copyWith => __$LoginCopyWithImpl<_Login>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.login(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) = __$LoginCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Login(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Logout implements AuthEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class _Signup implements AuthEvent {
  const _Signup(this.email, this.password);
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupCopyWith<_Signup> get copyWith => __$SignupCopyWithImpl<_Signup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Signup&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signup(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignupCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SignupCopyWith(_Signup value, $Res Function(_Signup) _then) = __$SignupCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$SignupCopyWithImpl<$Res>
    implements _$SignupCopyWith<$Res> {
  __$SignupCopyWithImpl(this._self, this._then);

  final _Signup _self;
  final $Res Function(_Signup) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Signup(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleAuthPage implements AuthEvent {
  const _ToggleAuthPage(this.isSignUp);
  

 final  bool isSignUp;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleAuthPageCopyWith<_ToggleAuthPage> get copyWith => __$ToggleAuthPageCopyWithImpl<_ToggleAuthPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleAuthPage&&(identical(other.isSignUp, isSignUp) || other.isSignUp == isSignUp));
}


@override
int get hashCode => Object.hash(runtimeType,isSignUp);

@override
String toString() {
  return 'AuthEvent.toggleAuthPage(isSignUp: $isSignUp)';
}


}

/// @nodoc
abstract mixin class _$ToggleAuthPageCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ToggleAuthPageCopyWith(_ToggleAuthPage value, $Res Function(_ToggleAuthPage) _then) = __$ToggleAuthPageCopyWithImpl;
@useResult
$Res call({
 bool isSignUp
});




}
/// @nodoc
class __$ToggleAuthPageCopyWithImpl<$Res>
    implements _$ToggleAuthPageCopyWith<$Res> {
  __$ToggleAuthPageCopyWithImpl(this._self, this._then);

  final _ToggleAuthPage _self;
  final $Res Function(_ToggleAuthPage) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isSignUp = null,}) {
  return _then(_ToggleAuthPage(
null == isSignUp ? _self.isSignUp : isSignUp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
