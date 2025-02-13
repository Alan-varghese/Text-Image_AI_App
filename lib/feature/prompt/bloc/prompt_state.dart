part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}

final class PromptGeneratingImageLoadState extends PromptState {}

final class PromptGeneratingImageErrorState extends PromptState {}

final class PromptGeneratingImageSuccessState extends PromptState {
  final File file;

  PromptGeneratingImageSuccessState(this.file);
}
