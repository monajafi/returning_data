import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Returning Data Demo",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),
      body: Center(child: SelectionButton(),),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Pick an option, any option"),
      onPressed: () => _navigateAndDisplayOption(context),
    );
  }

  _navigateAndDisplayOption(BuildContext context) async{
     final result = await Navigator.push(
       context, 
       MaterialPageRoute(builder:(context) => SelectionScreen()),);
     Scaffold.of(context)
     ..removeCurrentSnackBar()
     ..showSnackBar(SnackBar(content: Text("$result"),));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selection Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Yep"),
                onPressed: () => Navigator.pop(context,"Yep"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Nope'),
                onPressed: () => Navigator.pop(context,"Nope"),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}