import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('SharedPreferences'),
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _setTheme('Light');
                },
                child: Text("Light"),
              ),
              SizedBox(height: 16), // Adiciona um espaço entre os botões
              ElevatedButton(
                onPressed: () {
                  _setTheme('Dark');
                },
                child: Text("Dark"),
              ),
            ],
          ),
        ),
        
      ),
    );
  }

  String _theme = 'Light';
  var _themeData = ThemeData.light();
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

// Carregando o tema salvo pelo usuário
  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = (prefs.getString('theme') ?? 'Light');
      _themeData = _theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
    });
  }

// Carregando o tema salvo pelo usuário
  _setTheme(theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = theme;
      _themeData = theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
      prefs.setString('theme', theme);
    });
  }
}
