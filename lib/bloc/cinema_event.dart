part of 'cinema_bloc.dart';

@immutable
abstract class CinemaEvent{}

class OnSelectedSeatsEvent extends CinemaEvent{
  final String selectedSeats;
  OnSelectedSeatsEvent(this.selectedSeats);
}