import 'dart:ui';

import 'package:flutter/material.dart';

class HomeAux extends StatelessWidget {
  const HomeAux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).padding.top,
      ),
      Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height * .20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding (
              padding: EdgeInsets.only(right: 10),
              child: Image.network('https://s3-alpha-sig.figma.com/img/dd31/0b88/de778529fc5b3ab8d55f9aeb9a9312cc?Expires=1649635200&Signature=hRsGyMEyuG9d~UvF3B1~kl8BD5Kj4kdQFwfZ--zF-NNIuGHVwU4ilkQOmSd1Dv7JToV4DQBpQcO8lTYyPjX5pyrnotK0nks-TTrGa4RFZg6zJiRVsMyDJi4iF8bflR56mzB1tOFjFnkkV8XtOnHKe7kHoh4atGRAEQJ~Syak7D6F4OkbRFUmXAig3QhZNWLJv7O3ys9RLUGISYqPJtyZYZfM6hZfDTj0QtYOo85Dd15R1-~~~MQejep1FlFGpPWN39gwluM2Q10cOAuUDQSbhV-0rF97VQsbKKdkXUZyrRiI5FuKxGm1HtXTyNOvWTGxPJzMl4mSNgHZd3oh1tX2Cw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                height: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 60),
              child: Text(
                'Lançamentos ⭐',
                style: TextStyle( color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold
                ),
              ),
            )

          ],
        ),
      )
    ]);
  }
}
