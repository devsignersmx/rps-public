import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'services/supabase_client.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl
    //Services
    ..registerFactory<SupabaseClient>(
      () => SupabaseNetwork(Supabase.instance).client,
    );
}
