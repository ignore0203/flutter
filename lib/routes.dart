import 'package:flutter/material.dart';
import 'Home.dart';
import 'About.dart';
import 'def/Def.dart';
import 'def/RowColumn.dart';
import 'def/ka1.dart';
import 'def/BoxCon.dart';
import 'def/Con2.dart';

import 'def2/Counter.dart';
import 'def2/ParentChild.dart';
import 'def2/FormW.dart';
import 'def2/FormW2.dart';
import 'def2/ka2.dart';


final Map<String, WidgetBuilder> routes = {
  '/home': (context) => Home(),
  '/about': (context) => About(),
  '/def': (context) => Def(),
  '/rowColumn': (context) => RowColumn(),
  '/ka1': (context) => ka1(),
  '/boxcon': (context) => BoxCon(),
  '/con2': (context) => Con2(),

  '/counter': (context) => Counter(),
  '/parentChild': (context) => ParentChild(),
  '/formW': (context) => FormW(),
  '/formW2': (context) => FormW2(),
  '/ka2': (context) => ka2(),
};