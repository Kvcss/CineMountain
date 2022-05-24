import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'cinema_event.dart';
part 'cinema_state.dart';

class CinemaBloc extends Bloc<CinemaEvent,CinemaState>{
  CinemaBloc(): super(CinemaState()){
    on<OnSelectedSeatsEvent>( _onSelectedSeats );
  }
  List<String> seats = [];

  Future<void> _onSelectedSeats (OnSelectedSeatsEvent event, Emitter<CinemaState>emit)async{
    if(seats.contains(event.selectedSeats)){
      seats.remove(event.selectedSeats);
      emit (state.copyWith(selectedSeats: seats));
    }else{
      seats.add(event.selectedSeats);
      emit ( state.copyWith(selectedSeats: seats));
    }
  }
}
