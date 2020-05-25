import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'globals.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "piloty-city-project",
  "private_key_id": "95f178a39d895d804ce6c7623b4963f7834f4a03",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDadOZ9zrcjkSGD\nFPajBj07ihCmZSnxp7LgnixjF8UgBiIIXKL74W8xVmGqukMHzBNUL8dTSJtHgVXM\nwpeW2cj0MyygBRQfUHUg1BDF4gxWUt4cJ1HTGIgbXyjVFkrUnw29hIsXKA2HQ68X\n1j/n8bYZew+Votnh50bwgUlN8DQfkvMNqh2doxoyhN5B8ACUBe8tVXQrkYx7BNif\naiGmDom7r14kKakjHPufFZk5AmJlzSioYtvJK+1FAsh1DkjJ7RoZMP4m5l4hlP01\nr+40HaEdGawwhGXE6q3b+RVv2V5NuxW7Bsla3F8HZaff4DUXXcMNWdEuKfyCwrF9\n5yfxOSFzAgMBAAECggEAQ9F9yrm1Zi/EiRaleLfTo5u5joaibliC8jN4kSzMcCQn\nRZRIrsxuAhGQkXlwnMeQipaomSTVu+2dbstMVzL2LUWDyYu6Evyd2BqtuFj0PopM\nVM4qG1Am1OSGXxykD3zvPZIbwg0XohHzlgFX5pBF2YQ4MtqTLIvpnHlugekbrV8V\nAQvYVbrJ/ig184Swx4L2Cyuq46DlDm+hUpxt2O3v+DTkkBVsCZPNo/160qjZQn6S\ns3Kyb5qxucddzkRlZljAxBjgi+6pqsfsORuFgy6VTIBHJJkOXnzYzXuoKDbUyhqy\nMqQfzxUNbyIyU0x6eyOofP9UE4K4Gzs+4eFgR7XACQKBgQDyHqFAPbDw0rjvSTe4\nP9CSnIskm1HNwrkhrNymGELRknxaTrmAdZQtOnvQqJtFOfY4LnM54Hy3avpO8mWZ\ncIapJUkgiFURQSrc3k4H/UWWUZE2hV2wWRe4uW8j8mNUBfJO+gp/dMTQ7RUVXxjl\nPJzPNK5kWAXQ2qW+lLYfKEncywKBgQDm+v1yj1MFGv4BNQumvX2ZCTwh72OXMZVu\n28f+DnS30CdY9J/W2l5LBTD9x9O/RN5at6/G7FnB7Z+D+jqqpYRS1PHA+9VvG78w\n8ZkxMQxkeG4Y4sH1vjmaYOYdmz6M+h/bZDQRcBs8POJF/pA3IM5IP6xjBIxymSRA\nbLVR4Fgg+QKBgFgslXbqwJSDeTwTgwpDmza5cebr9ZekkX1VEaofbb4axdSxlNbW\nexcZlFvB+4HzgNqm9+mc+m5ltDCqEBwYIcJZxM7nN2uoOu7iurIoJ359yA999Eez\nunLYfUQvEsNXww3F+6q9IKwhmysETfG16DmBqvz6HWwZJIFKcSTZrESPAoGACF0M\nMkq4QdYRXm/SRS5VTuZDtCLb40ybUZFJs4xIc6No2VK6OuhbQ7IjbP0AUMuolXZT\nOguy0E/PV9MGrskhenJVcpxrxQMnMBl/Z4WUIksuCV6kkUZbBZj+nBHT+PzRjHsb\nW4pIoiy+MLSf+i8I6RrNHiS7BSdAZcjJ4/YQmtkCgYEA4/g19Lk/VaXdz2Ruvb58\nftLW2Jb8c+vUhAU9NuuWwAzo8K/jIQOjrZCdruDxmTH0EVcPUAxV2ETJO/EGdIFc\nQsL+ns7lmh0SJGfAe93WCrDi4x5myyTnipDhPCBrCQ4xgHEVA3JE/lff3mi+ojY7\n5PaGCBqpvCvG6VMrHNVjinQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "piloty-city@piloty-city-project.iam.gserviceaccount.com",
  "client_id": "110673181534265501648",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/piloty-city%40piloty-city-project.iam.gserviceaccount.com"
}
''';

const _spreadsheetId = '1oa2jCoJ7IPqR6wMHW51iVo6pkQ_Sk-Oj82lm4jOSJUs';

void main() async {
  runApp(MaterialApp(
    home: MyButton(),
  ));



  // init GSheets
  final ss = await gsheets.spreadsheet(_spreadsheetId);
  sheet = ss.worksheetByTitle('Sheet1');
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> strings = ['Flutter', 'is', 'cool', "and","awesome!"];
  String displayedString = "Hello World!";

  void onPressOfButton() {
    setState(() {
      displayedString = strings[counter];
      counter = counter < 4 ? counter + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initAlanButton();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [

              SizedBox(width:500),

              Text("Home Screen", style: TextStyle(fontSize: 40.0, fontFamily: 'Quicksand',), textAlign: TextAlign.center, ),

              SizedBox(height: 50),

              SizedBox(
                height:100,
                child: RaisedButton(
                  padding: EdgeInsets.all(30.0),
                  child: Text("Business Owner", style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Quicksand'),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));},
                ),
              ),

              SizedBox(height: 50),

              SizedBox(
                height:100,
                child: RaisedButton(
                  padding: EdgeInsets.all(30.0),
                  child: Text("Customer", style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Quicksand'),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdRoute()));},
                ),
              ),


            ]
        )
    );
  }

  bool _enabled = true; //start button state

  void _initAlanButton() async {
    //init Alan with sample project id
    AlanVoice.addButton("a486cfc4fbcdfb8c9a84d125c13863142e956eca572e1d8b807a3e2338fdd0dc/stage");
    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
    setState(() {
      _enabled = true;
    });
  }

  void _handleCommand(Map<String, dynamic> command) async{
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    // get worksheet by its title
    var sheet = ss.worksheetByTitle('Sheet1');
    var itemN = (await sheet.values.value(column: 3, row: 2)).toLowerCase();
    int rowNum = 2;
    while (!(itemN == "") && !(itemN == command["value"].toLowerCase())) {
      rowNum++;
      itemN = (await sheet.values.value(column: 3, row: rowNum)).toLowerCase();
    }
    switch (command["command"]) {
      case "aisle":
        var aisleNum = await sheet.values.value(column: 1, row: rowNum);
        AlanVoice.playText(command["value"] + " is at aisle " + aisleNum);
        break;
      case "prices":
        var priceVal = await sheet.values.value(column: 5, row: rowNum);
        AlanVoice.playText(command["value"] + " costs " + priceVal);
        break;
      case "category":
        int rows = 2;
        var catGory = (await sheet.values.value(column: 2, row: rows)).toLowerCase();
        var items = (await sheet.values.value(column: 3, row: rows)).toLowerCase();
        while(!(catGory == command["value"])){
          rows++;
          catGory = (await sheet.values.value(column: 2, row: rows)).toLowerCase();
        }
        AlanVoice.playText("the items are ");
        while(catGory == command["value"]){
          catGory = (await sheet.values.value(column: 2, row: rows)).toLowerCase();
          items = (await sheet.values.value(column: 3, row: rows)).toLowerCase();
          if(catGory == command["value"]) {
            AlanVoice.playText(items);
          }
          rows++;
        }
        break;
      case "change":
        print('fsdsdssfsf');
        int quantity = command["stock"];
        await sheet.values.insertValue(quantity, column: 4, row: rowNum);
        break;
      case "stock":
        var stockVal = await sheet.values.value(column: 4, row: rowNum);
        AlanVoice.playText(command["value"] + " has " + stockVal + " in stock");
        break;
    }
  }
}

// System to set up multiple pages


// Second Page
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Business Owner Page", style: TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: 'Quicksand'),)
      ),
      body: Column(
        children: <Widget>[

          Image(
            image: AssetImage('assets/spreadsheetimage.png'),
          ),

          SizedBox(height: 225),

          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              Navigator.pop(context);
              // Navigate back to first route when tapped.
            },
            child: Text("Home", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'Quicksand'),),
          ),
        ],
      ),
    );
  }
}


class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState  createState() => _ThirdRouteState();
}



// Third Page
class _ThirdRouteState extends State<ThirdRoute> {

  String aisleString = aisleNum.toString();
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
          title: Text("Customer Page", style: TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: 'Quicksand'),)
      ),
      body: Column(
        children: <Widget>[


          SizedBox(height:225),

          Text('You can find this at Aisle $aisleString', style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'Quicksand'),),

          SizedBox(height:275, width: 500),

          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              Navigator.pop(context);
              // Navigate back to first route when tapped.
            },
            child: Text("Home", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'Quicksand'), ),
          ),
        ],
      ),
    );
  }
}