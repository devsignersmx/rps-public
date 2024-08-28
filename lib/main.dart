import 'package:error_stack/error_stack.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/app/app.dart';
import 'core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: const String.fromEnvironment(
      'SUPABASE_URL',
    ),
    anonKey: const String.fromEnvironment(
      'SUPABASE_ANON_KEY',
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: kDebugMode ? RealtimeLogLevel.debug : RealtimeLogLevel.info,
    ),
  );
  await setupServiceLocator();
  await ErrorStack.init();
  runApp(const MainApp());
}
