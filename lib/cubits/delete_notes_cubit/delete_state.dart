part of 'delete_cubit.dart';

@immutable
sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}

final class DeleteNoteSuccess extends DeleteState {}
