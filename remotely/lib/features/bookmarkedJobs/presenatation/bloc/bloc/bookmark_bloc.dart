import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely/features/bookmarkedJobs/domain/usecases/bookmark_usecases.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/event/bookmark_event.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/state/bookmark_state.dart';

class BookmarkBloc  extends Bloc<BookMarkEvent,BookMarkState> {

  final BookmarkUsecases _bookmarkUsecases;



  BookmarkBloc(this._bookmarkUsecases) : super(BookMarkState.intial()) {
    on<BookMarkEvent>((event, emit) async{
     await event.map( fetchBookMarkedJobs: (value) => _fetchBookMark(emit),);
    });
  }

  Future<void> _fetchBookMark(Emitter<BookMarkState> emit) async{
    try{
      final response = await _bookmarkUsecases.getBookMarkJobs();
      emit(BookMarkState.bookmarkedJobs(response));
    }catch(e){
      debugPrint(e.toString());
    }
  }
}