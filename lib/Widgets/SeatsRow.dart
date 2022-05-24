import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Helpers/paint_chair.dart';
import 'package:projetointegrado_e/bloc/cinema_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SeatsRow extends StatelessWidget {
  final int numSeats;
  final List<int>freeSeats;
  final String rowSeats;
  const SeatsRow({Key? key, required this.rowSeats, required this.numSeats, required this.freeSeats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cinemaBloc = BlocProvider.of<CinemaBloc>(context);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats, (i){
          if (freeSeats.contains(i+i)){
            return InkWell(
              onTap: ()=> cinemaBloc.add(OnSelectedSeatsEvent('$rowSeats${i+1}')),
              child: BlocBuilder<CinemaBloc,CinemaState>(
                builder: (_, state)=>
                PaintChair(
                  color: state.selectedSeats.contains('$rowSeats${i+1}') ? Colors.pink : Colors.white
                ),
              ),

            );
          }
          return PaintChair();
        }),


      ),
    );
  }
}
