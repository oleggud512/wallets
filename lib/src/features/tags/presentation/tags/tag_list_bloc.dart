import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/tags/application/use_cases/delete_tag_use_case.dart';
import 'package:ads_pay_app/src/features/tags/application/use_cases/watch_tags_use_case.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tag_list_events.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tag_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/use_cases/add_tag_use_case.dart';

class TagListBloc extends Bloc<TagListEvent, TagListState> {
  WatchTagsUseCase watchTagsUseCase;
  AddTagUseCase addTagUseCase;
  DeleteTagUseCase deleteTagUseCase;
  final WalletAction action;

  TagListBloc(this.action, this.watchTagsUseCase, this.addTagUseCase, this.deleteTagUseCase) : super(TagListState()) {
    
    on<TagListLoadEvent>((event, emit) {
      final tagsStream = watchTagsUseCase();
      emit.onEach(tagsStream, 
        onData: (tags) => emit(state.copyWith(tags: tags))
      );
    });

    on<TagListNameChangedEvent>((event, emit) {
      emit(state.copyWith(newTagName: event.name));
    });

    on<TagListColorChangedEvent>((event, emit) {
      emit(state.copyWith(newTagColor: event.color));
    });

    on<TagListAddTagEvent>((event, emit) async {
      await addTagUseCase(
        action: action, 
        color: state.newTagColor, 
        name: state.newTagName
      );
      event.onAdded?.call();
      emit(state.copyWith(newTagColor: Colors.grey, newTagName: ''));
    });

    on<TagListDeleteTagEvent>((event, emit) async {
      await deleteTagUseCase(event.name);
    });
  }
}