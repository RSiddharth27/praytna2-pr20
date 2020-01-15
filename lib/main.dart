import 'package:praytna2/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:praytna2/detail_page.dart';
import 'package:praytna2/detail_page1.dart';
import 'package:praytna2/detail_page2.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      //home: new ListPage(title: 'Workshops'),

       home: FirstRoute(),

    );
  }
}
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praytna 2k20'),
      ),
      body: new Column(
        children: <Widget>[
          const SizedBox(height: 10),
          RaisedButton(
            //child: Text('Workshop'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new ListPage(title: 'Workshops')));
            },
            textColor: Color.fromRGBO(7, 4, 23, 1.0),
            //padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: new BoxDecoration(
                //image: new DecorationImage(image: new AssetImage("2.jpg"),
                //fit: BoxFit.cover,),
                gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF023455),
                      Color(0xFF024450),
                      Color(0xFF42A5F5),
                    ]
                ),
              ),
              child: Text('     Workshop      ',style: TextStyle(fontSize: 50,color: Colors.yellow), ),
            ),
            padding: const EdgeInsets.all(20.0),
            /*child: const Text(
              'Gradient Button',
              style: TextStyle(fontSize: 20)
          ),*/

          ),

          const SizedBox(height: 10),
          RaisedButton(
            //child: Text('Workshop'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new ListPage1(title: 'Non-Technical Events')));
            },
            textColor: Colors.white,
            //padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: new BoxDecoration(
                //image: new DecorationImage(image: new AssetImage("2.jpg"),
                //fit: BoxFit.cover,),
                gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ]
                ),
              ),
              child: Text('       Technical Events    ',style: TextStyle(fontSize: 50)),
            ),
            padding: const EdgeInsets.all(20.0),
            /*child: const Text(
              'Gradient Button',
              style: TextStyle(fontSize: 20)
          ),*/

          ),
          const SizedBox(height: 10),
          RaisedButton(
            //child: Text('Workshop'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new ListPage2(title: 'Technical Events')));
            },
            textColor: Colors.white,
            //padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: new BoxDecoration(
                //image: new DecorationImage(image: new AssetImage("2.jpg"),
                //fit: BoxFit.cover,),
                gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ]
                ),
              ),
              child: Text('  Non-Technical Events',style: TextStyle(fontSize: 50)),
            ),
            padding: const EdgeInsets.all(20.0),
            /*child: const Text(
              'Gradient Button',
              style: TextStyle(fontSize: 20)
          ),*/

          ),

        ],
      ),
      /*body: new Center(
        child: RaisedButton(
          child: Text('workshop'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new ListPage(title: 'Workshops'))
            );
          },
        ),


        )*/
      //),

    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 0.5, color: Colors.white))),
        child: Icon(Icons.laptop_chromebook, color: Color.fromRGBO(45,234,220,1.0),),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
        //semanticsLabel: lesson.date,
        //style:TextStyle(color: Colors.white , fontWeight: :FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      //: Text()

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(lesson.level,
                      style: TextStyle(color: Colors.white)))

          )

        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    /*final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    */

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        /*IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )*/
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      appBar: topAppBar,
      body: makeBody,
      //bottomNavigationBar: makeBottom,
    );
  }
}
class ListPage1 extends StatefulWidget {
  ListPage1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPage1State createState() => _ListPage1State();
}

class _ListPage1State extends State<ListPage1> {
  List lessons1;

  @override
  void initState() {
    lessons1 = getLessons1();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson1) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.all_inclusive, color: Color.fromRGBO(45,234,220,1.0)),
      ),
      title: Text(
        lesson1.title,
        style: TextStyle(height: 2,color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20 ),
        //semanticsLabel: lesson.date,
        //style:TextStyle(color: Colors.white , fontWeight: :FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      //: Text()

      subtitle: Row(
        children: <Widget>[
          /*Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),*/
          Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(lesson1.level,
                      style: TextStyle(color: Colors.white)))

          )

        ],
      ),
      trailing:
      Icon(Icons.arrow_right, color: Color.fromRGBO(45,234,220,1.0), size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage1(lesson: lesson1)));
      },
    );

    Card makeCard(Lesson lesson1) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: makeListTile(lesson1),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons1.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons1[index]);
        },
      ),
    );

    /* final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(7, 4, 23, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );*/
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        /*IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )*/
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      appBar: topAppBar,
      body: makeBody,
      //bottomNavigationBar: makeBottom,
    );
  }
}
class ListPage2 extends StatefulWidget {
  ListPage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPage2State createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons2();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.all_inclusive, color: Color.fromRGBO(45,234,220,1.0)),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(height: 2,color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20 ),
        //semanticsLabel: lesson.date,
        //style:TextStyle(color: Colors.white , fontWeight: :FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      //: Text()

      subtitle: Row(
        children: <Widget>[
          /*Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),*/
          Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(lesson.level,
                      style: TextStyle(color: Colors.white)))

          )

        ],
      ),
      trailing:
      Icon(Icons.arrow_right, color: Color.fromRGBO(45,234,220,1.0), size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage1(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    /* final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(7, 4, 23, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );*/
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        /*IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )*/
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      appBar: topAppBar,
      body: makeBody,
      //bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Campus to Corporate",
        level: "InMobi",
        indicatorValue: 0.33,
        price: 0,
        content:
        "DATE : FEB 7\nVENUE : LAB\n\nWe shape your career goals, help you meet the expectations of the industry through this workshop and fulfil your dream of being recruited in top companies.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
        title: "Digging into DATA",
        level: "Visa",
        indicatorValue: 1,
        price: 750,
        date : "Febraury 7 2k20",
        time : "9 AM",
        venue : "Lab",
        content:
        "DATE : FEB 7\nVENUE : LAB\n\n#MasterTheFuture. Demands for Data Science increases rapidly. So there is a great opportunity for every software professional to enter this newly growing field and start a career in Data science.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
        title: "Artificial Intelligence",
        level: "Amazon",
        indicatorValue: 0.5,
        price: 750,
        content:
        "DATE : FEB 8\nVENUE : LAB\n\nAI is a tool. The choice about how it gets deployed is yours. Come together lets make a change. This AI workshop is a great experience where you could learn new things and do great wonders.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
        title: "Web Development",
        level: "PayPal",
        indicatorValue: 0.66,
        price: 750,
        content:
        "DATE : FEB 7\nVENUE : LAB\n\nAn individual that understands how to design a website will generally be more creative when asked to solve a problem.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
        title: "Ethical Hacking",
        level: "OMEGA",
        indicatorValue: 1.0,
        price: 750,
        content:
        "DATE : FEB 7\nVENUE : LAB\n\nAre you dreaming to become a WHITE HAT HACKER in real life?. Do you want to learn hacking but don't know where to start? Then this is the workshop you have to be in.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
        title: "App Development",
        level: "GeekyAnts",
        indicatorValue: 1.0,
        price: 750,
        content:
        "DATE : FEB 7\nVENUE : LAB\n\nInspired by Instagram, YouTube and Whatsapp? Learn more about app development to develop a scalable and attractive app for others.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
        title: "Deep Learning",
        level: "GUVI",
        indicatorValue: 1.0,
        price: 750,
        content:
        "DATE : FEB 7\nVENUE : LAB\n\nIf you want to break into AI, Deep Learning will help you do so. Deep Learning is one of the most highly sought after skills in tech today.\n\nCONTACT DETAILS:\nPREETHI\n9080667260"),
    Lesson(
      title: "Amazon Web Service",
      level : "Amazon Developers",
      indicatorValue: 1.0,
      price : 750,
      content:
        "DATE : FEB 8\nVENUE : LAB\n\nLearn to deploy real applications in a scalable way, using Amazon Web Services (AWS).\n\nCONTACT DETAILS:\nPREETHI\n9566874169"
    )
  ];
}
List getLessons1() {
  return [
    Lesson(
        title: "Sherlock Holmes",
        level: "",
        //indicatorValue: 0,
        //price: 0,
        content:
        "Tired of technical stuffs? Give a break? Here is a chance for you peeps to be a part of this detective game. Come along to test your logical skills and open your mind to investigate and solve as SHERLOCK HOLMES Do come to have some fun and win exciting prizes."),
    Lesson(
        title: "Connexions",
        level: "",
        //indicatorValue: 1,
        // price: 750,
        content:
        "Are u people crazy about linking something? Here comes the most enthusiastic event!\n Connect your ideas to get the solution Connexion-il connect aagi vaazhvaarey vaazhvaar mattravar connexion indri enguvaar! \n\n\n PRIZES WORTH Rs. 2000  "),
    Lesson(
        title: "The Prestige",
        level: "",
        // indicatorValue: 0.5,
        //price: 750,
        content:
        "There is only one event that matters... The great event.. And it is here.. THE PRESTIGE Do participate to express your aptitude! Have unlimited fun and with everyone's hearts, kidneys, livers etc.\n\n Prizes worth ₹ 20000 \n\n Yashwanth : 7395879765 \n Lokesh : 7092694272"),
    Lesson(
        title: "IPL Auction",
        level: "",
        //indicatorValue: 0.66,
        //price: 750,
        content:
        "Wanna make RCB win the throne? Want do shopping like Preity Zinta? Wanna make fun like CSK Management? Here is a chance to quench your thirst! Prove that you're a proud IPL Fan at IPL Auction and win exciting prizes."),
    Lesson(
        title: "Treasure Hunt",
        level: "",
        //indicatorValue: 1.0,
        //price: 750,
        content:
        "The cave you fear to enter holds the treasure you seek!! It's time to overcome the fear and seek the treasure what is your\nFollow the Rules! Find the Clues!\nTake home the Treasure!!!\nReach the Treasure, Sweet the Pleasure"),
    Lesson(
        title: "Gaming",
        level: "",
        //indicatorValue: 1.0,
        // price: 750,
        content:
        "Escape reality and own the virtual world where you can have a second chance to life. Do you have what it takes to weave around the defenders and score a screamer of goal in FIFA? Deserted, alone, and a winner-takes-it-all battle royale? Can you get the better of 99 other participants in PUBG? Can you help the terrorists triumph in Call of Duty?\nCalling all the gaming maniacs to participate in our Gaming event!"),
    Lesson(
        title: "Math-o-Mania",
        level: "",
        //indicatorValue: 1.0,
        // price: 750,
        content:
        "Are you a math geek? Does Maths run in your veins??\nAre you ready to unleash the math destruction? Then be ready to witness the wrath of math as the great minds battle for the glory to become next Archimedes!!!?\nCAUTION : Don't Drink and Derive"),

  ];
}
List getLessons2() {
  return [
    Lesson(
        title: "Paper Presentation",
        level: "",
        //indicatorValue: 0,
        //price: 0,
        content:
        "Present your innovative thoughts in this event. Have you ever thought of presenting it to someone ? Prayatna'20 aims to provide the best platform to showcase your research ideas. Prepare a presentation and unleash the speaker in you to grab exciting prizes! Trying is winning in the moment.Logic will get you from A to B. Imagination will get you everywhere!"),
    Lesson(
        title: "Coffee with Java",
        level: "",
        //indicatorValue: 1,
        // price: 750,
        content:
        "The real challenge for a coder lies in his ability to write code that ensures readability, by reducing complexity and improving the maintainability of the system. For ages, Object-Oriented Programming Systems have aided coders to face this challenge and Java is widely used to create complete applications that can run on a single computer. "),
    Lesson(
        title: "Parsel Tongue",
        level: "",
        // indicatorValue: 0.5,
        //price: 750,
        content:
        "Soaring high above all other object-oriented programming languages due to its elegant code syntax, it is not surprising for Python to be preferred by tech giants such as Google and Facebook. With a plethora of open source libraries available for applications in data analysis and web development, Python is versatile to meet the requirements of any programmer."),
    Lesson(
        title: "OSPC",
        level: "",
        //indicatorValue: 0.66,
        //price: 750,
        content:
        "Although there is exponential development in the compiling power in recent times, a great programmer is the one who can write seamless code without the aid of fancy machine configurations. An efficient code comes to our rescue every single time there needs optimization in the system. OSPC is the contest that tests the coders’ talent in coming up with fast yet creative solutions for algorithmic problems."),
    Lesson(
        title: "DB Dwellers",
        level: "",
        //indicatorValue: 1.0,
        //price: 750,
        content:
        "Hey peers!! Do you know the language of the database? Want to dance with tables, rows, and columns? Do you know how huge amount of data is being generated each and every second? Come along and join us in this extraordinary chase of querying to find your answers from the DB. This event is for geeks like you who would like to explore the database world. 'select team from participants where answers= Right."),
    Lesson(
        title: "Hexathlon(The Mega Event)",
        level: "",
        //indicatorValue: 1.0,
        // price: 750,
        content:
        "Jack of all trades, master of none is a figure of speech in reference to a person who is an expert in many skills rather than focussing on one. Hexathlon is one such event that gives you the opportunity to test your knowledge gained through the years in the core fields of computer science making you a jack of all trades if you conquer it."),
    Lesson(
        title: "Web Hub",
        level: "",
        //indicatorValue: 1.0,
        // price: 750,
        content:
        "Are you the one who always indulges in the amazing visual experience of the websites? Then, this event is for you. You will be given the task of solving web-based questions which may also include designing and developing a part of a website. The team which puts their creativity into design and develops the most impressive page wins!"),

  ];
}
