import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_event.freezed.dart';

@freezed
class BookMarkEvent with _$BookMarkEvent {
  factory BookMarkEvent.fetchBookMarkedJobs() = _FetchBookmarkedjObs;
}