import 'package:flutter/material.dart';


class SeatsRow extends StatelessWidget {
  final int numSeats;
  final List<int>freeSeats;
  final String rowSeats;
  const SeatsRow({Key? key, required this.rowSeats, required this.numSeats, required this.freeSeats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  final cinemaBloc = BlocProvider.of<CinemaBloc>(context);

    return Container();
  }
}
