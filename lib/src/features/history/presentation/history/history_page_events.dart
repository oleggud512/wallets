import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_page_events.freezed.dart';

@freezed
class HistoryPageEvent with _$HistoryPageEvent {
  factory HistoryPageEvent() = _HistoryPageEvent;

  factory HistoryPageEvent.load() = HistoryPageLoadEvent;

}