import 'dart:async';
import 'dart:io';

import 'package:ai_image_app/feature/prompt/bloc/prompt_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptInitialEvent);
    on<PromptEnteredEvent>(promptEnteredEvent);
  }

  Future<void> promptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadState());
    File? file = await PromptRepo.generateImage(event.prompt);
    if (file != null) {
      emit(PromptGeneratingImageSuccessState(file));
    } else {
      emit(PromptGeneratingImageErrorState());
    }
  }

  Future<void> promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageSuccessState(File('assets\file.png')));
  }
}
