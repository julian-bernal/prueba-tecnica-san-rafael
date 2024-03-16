import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import 'src/app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().
  load('assets/certificados/socimedicosapp-com-chain.pem');

  SecurityContext.defaultContext.
  setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(EasyDynamicThemeWidget(
    child: const App(),
  ));

}