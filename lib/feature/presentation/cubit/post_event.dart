
import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable {}

class FetchDataEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}