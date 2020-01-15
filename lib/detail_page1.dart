import 'package:flutter/cupertino.dart';
import 'package:praytna2/model/lesson.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_launch/flutter_launch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gestures/gestures.dart';
class DetailPage1 extends StatelessWidget {
  final Lesson lesson;
  DetailPage1({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /* final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.grey)),
      ),
    );
    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(7.0)),
      child: new Text(
        "Rs." + lesson.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
*/
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 40.0),
        Icon(
          Icons.videogame_asset,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white10),
        ),
        SizedBox(height: 10.0),
        Text(
          lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.level,
                      style: TextStyle(color: Color.fromRGBO(7, 4, 23, 1.0), fontFamily: 'Quicksand'),
                    ))),
            //Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("prayatna-logo-withdate.png"),
                fit: BoxFit.contain,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    _launchURLp ()
    {
      const url = 'https://www.prayatna.org.in/';
      launch(url);
    }
    MaterialButton(
        child: GestureDetector(
            child: RaisedButton(
              onPressed: _launchURLp, //() => {},
              color: Color.fromRGBO(7, 4, 23, 1.0),
              child:
              Text("Participate", style: TextStyle(color: Color.fromRGBO(45,234,220,1.0),fontFamily: 'Quicksand'),),

            ))
    );

    final bottomContentText = Text(
      lesson.content,
      style: TextStyle(fontSize: 18.0, fontFamily: 'Quicksand'),
    );


    _launchURL () {
      const url = 'https://www.prayatna.org.in/';
      launch(url);
    }



    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
            children: <Widget>[
              GestureDetector(
                  child: RaisedButton(
                    onPressed: _launchURL, //() => {},
                    color: Color.fromRGBO(7, 4, 23, 1.0),
                    child:
                    Text("VIEW RESULT", style: TextStyle(color: Color.fromRGBO(45,234,220,1.0),fontFamily: 'Quicksand'),),

                  )),
              GestureDetector(
                  child: RaisedButton(
                    onPressed: _launchURLp, //() => {},
                    color: Color.fromRGBO(7, 4, 23, 1.0),
                    child:
                    Text("PARTICIPATE", style: TextStyle(color: Color.fromRGBO(45,234,220,1.0),fontFamily: 'Quicksand'),),

                  ))
            ]));



    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );
    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );


  }
}