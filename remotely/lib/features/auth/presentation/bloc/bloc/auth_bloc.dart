import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely/core/local_storage/secure_storage/secure_storage.dart';
import 'package:remotely/core/network/error/firebase_error_ux.dart';
import 'package:remotely/features/auth/presentation/bloc/event/auth_event.dart';
import 'package:remotely/features/auth/presentation/bloc/state/auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState>{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final SecureStorageHelper _secureStorageHelper = SecureStorageHelper.instance;

  AuthBloc():super(const AuthState.initial()){
    on<AuthEvent>(_mapEventToState);
  }


  Future<void> _mapEventToState(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      login: (event) => _login(event, emit),
      logout: (event) => _logout(event, emit),
      signup: (event) => _signup(event, emit),
      toggleAuthPage: (event) => _toggleAuthPage(event, emit),
    );
  }

  // ignore: strict_top_level_inference
  Future<void> _login(event, Emitter<AuthState> emit) async{
    emit(const AuthState.loading());
    
    try{

      final user = await _firebaseAuth.signInWithEmailAndPassword(email: event.email, password: event.password);
      if(user.user!=null||user.user!.uid.isNotEmpty){
        final String? token = await user.user?.getIdToken();
        _secureStorageHelper.saveToken(token??'');
        emit(const AuthState.authenticated());
      }else{
        emit(const AuthState.unauthenticated());
      }
    }on FirebaseAuthException catch(e){
      final message = getFirebaseAuthErrorMessage(e);

      emit(AuthState.error(message));
    }
  
    catch(e){
      emit(AuthState.error('Something went wrong'));
    }
 
  }


  Future<void> _logout(AuthEvent event, Emitter<AuthState> emit) async{
    try{
      await _firebaseAuth.signOut();
      emit(const AuthState.unauthenticated());
    }catch(e){
      emit(AuthState.error('Something went wrong'));
    }

    }


    
 
 
   Future<void>_signup( event, Emitter<AuthState> emit) async{
    try{
     final user = await _firebaseAuth.createUserWithEmailAndPassword(email: event.email, password: event.password);

     if(user.user!=null||user.additionalUserInfo!=null){
        emit(const AuthState.authenticated());
      }else{
        emit(const AuthState.unauthenticated());
      }

    }on FirebaseAuthException catch(e){
      emit(AuthState.error(e.message??'Server issue'));
    }
    
    
    catch(e){
      emit(AuthState.error('Something went wrong'));
    }


    
 
 
 
  }

  _toggleAuthPage(event, Emitter<AuthState> emit){
    // _isVisible = _isVisible;
    emit(AuthState.toggleAuthPage(event.isSignUp));
  }

  }


  

