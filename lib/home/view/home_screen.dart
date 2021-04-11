import 'package:flutter/material.dart';
import 'package:flutter_interpreter_pattern/home/interpret/interpret_helpers.dart';
import 'package:flutter_interpreter_pattern/home/model/home_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeModel _model = HomeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Image.asset('assets/icon_background.png'),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Expanded(child: SizedBox(), flex: 360),
        buildJapaneseExpanded(),
        Expanded(child: SizedBox(), flex: 31),
        buildChineseExpanded(),
        Expanded(child: SizedBox(), flex: 30),
        buildWesternExpanded(),
        buildDetermineExpanded()
      ])
    ]));
  }

  Expanded buildJapaneseExpanded() {
    return Expanded(
        child: Row(children: <Widget>[
          Expanded(child: SizedBox(), flex: 33),
          Expanded(
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          color: _model.isJapaneseCuisine
                              ? Color(0x50C5160F)
                              : Color(0x00C5160F))),
                  onTap: () {
                    setState(() {
                      _model.isJapaneseCuisine = !_model.isJapaneseCuisine;
                    });
                  }),
              flex: 613),
          Expanded(child: SizedBox(), flex: 34)
        ]),
        flex: 205);
  }

  Expanded buildChineseExpanded() {
    return Expanded(
        child: Row(children: <Widget>[
          Expanded(child: SizedBox(), flex: 33),
          Expanded(
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          color: _model.isChineseCuisine
                              ? Color(0x50C5160F)
                              : Color(0x00C5160F))),
                  onTap: () {
                    setState(() {
                      _model.isChineseCuisine = !_model.isChineseCuisine;
                    });
                  }),
              flex: 613),
          Expanded(child: SizedBox(), flex: 34)
        ]),
        flex: 240);
  }

  Expanded buildWesternExpanded() {
    return Expanded(
        child: Row(children: <Widget>[
          Expanded(child: SizedBox(), flex: 33),
          Expanded(
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          color: _model.isWesternCuisine
                              ? Color(0x50C5160F)
                              : Color(0x00C5160F))),
                  onTap: () {
                    setState(() {
                      _model.isWesternCuisine = !_model.isWesternCuisine;
                    });
                  }),
              flex: 613),
          Expanded(child: SizedBox(), flex: 34)
        ]),
        flex: 216);
  }

  Expanded buildDetermineExpanded() {
    return Expanded(
        child: GestureDetector(
            child: Align(
                alignment: Alignment.centerRight,
                child: Container(color: Color(0x00C5160F))),
            onTap: () {
              _determineEvent();
            }),
        flex: 108);
  }

  void _determineEvent() {
    String content = "";
    if (_model.isJapaneseCuisine) content = content + " 210";
    if (_model.isChineseCuisine) content = content + " 290";
    if (_model.isWesternCuisine) content = content + " 320";
    content = content.trim();
    final interpretTree = InterpretHelpers.buildInterpretTree(content);
    final result = interpretTree.interpret(_model);
    content = '${_model.getContent()}\n\n總共為 \$$result';
    _showDialog(content);
  }

  void _showDialog(String content) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
              title: Text("請確認選擇的餐點︰"),
              content: Text(content),
              actions: <Widget>[
                FlatButton(
                    child:
                        Text("取消", style: TextStyle(color: Color(0xFFC5160F))),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      _model.clear();
                    }),
                FlatButton(
                    child:
                        Text("確認", style: TextStyle(color: Color(0xFFC5160F))),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      _model.clear();
                    })
              ]);
        });
  }
}
