part of 'cinema_bloc.dart';



@immutable
class CinemaState{

    final List<String> selectedSeats;

    CinemaState({
      List<String>? selectedSeats
}): this.selectedSeats = selectedSeats ?? [];

    CinemaState copyWith({List<String>? selectedSeats})
    => CinemaState(
      selectedSeats: selectedSeats ?? this.selectedSeats
    );
}