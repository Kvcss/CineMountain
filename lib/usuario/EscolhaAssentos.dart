
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/ArmChairsModel.dart';

import '../model/build_chairs.dart';

class EscolhaAssentos extends StatefulWidget {
  const EscolhaAssentos({Key? key}) : super(key: key);

  @override
  State<EscolhaAssentos> createState() => _EscolhaAssentosState();
}

class _EscolhaAssentosState extends State<EscolhaAssentos> {
  Widget _chairList(){

      var _chairStatus = [
        [1,1,1,1,1,1,1],
        [1,1,1,1,3,1,1],
        [1,1,1,1,1,3,3],
        [2,2,1,1,1,3,3],
        [1,1,1,1,1,3,3],
        [2,2,1,1,1,3,3],
      ];
      Size size = MediaQuery.of(context).size;
      return Container(
        child: Column(
          children: [
            for(int i = 0; i< 6; i++)
              Container(
                margin: EdgeInsets.only(top: i== 3 ? size.height *0.02 : 0),
                child: Row(
                  children: [
                    for(int x = 0; x< 9; x++)
                      Expanded(
                        flex: x == 0 || x == 8 ? 2 : 1,
                        child: x==0 ||
                        x == 8 ||
                            (i == 0 && x == 1) ||
                            (i == 0 && x == 7) ||
                            (x == 4)? Container() : GestureDetector(
                              child: Container(
                          height: size.width/11 - 10,
                          margin: EdgeInsets.all(5.0),
                          child: _chairStatus[i][x - 1] == 1 ?
                          BuildChairs.avaliableChair()
                          :_chairStatus [i][x - 1] == 2
                          ?BuildChairs.selectedChair()
                          :BuildChairs.reservedChair()
                          ,
                        ),
                          onTap: (){
                              setState(() {
                                _chairStatus [i][x-1] = 2;
                              });
                          },
                            ),
                      )

                  ],
                ),
              )
          ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 47,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size.width,

            ),
            //Movie white scream
            Positioned(
              top: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.65,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.white,Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      )
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.55,
                    decoration: const BoxDecoration(
                      border : Border(
                        top: BorderSide(
                          width: 6.0,
                          color: Colors.white
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
            //end movie white scream
            Positioned(
              bottom: size.height * 0.2,
              child: Container(
                height:  240,
                width: size.width,
                child: Column(
                  children: List.generate(ArmChairsModel.listChairs.length,(i)=>
                  SeatsRow(
                    numSeats: ArmChairsModel.listChair[i].seats,
                    freeSeats: ArmChairModel.listChair[i].freeSeats,
                    rowSeats: ArmChairsModel.listChairs[i].rowSeats,
                  )
                  ),
                ),
            ),
            ),
          ],
        ),
    );
  }
}
