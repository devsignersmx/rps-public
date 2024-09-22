import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/user/data/data_source/user_source.dart';
import '../features/user/data/repositories/user_repo_impl.dart';
import '../features/user/domain/repositories/user_repo.dart';
import 'services/supabase_client.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl
    //Services
    ..registerFactory<SupabaseClient>(
      () => SupabaseNetwork(Supabase.instance).client,
    )
    // Data sources
    ..registerFactory<UserSource>(
      () => UserSource(
        sl<SupabaseClient>(),
      ),
    ) // Repositories
    ..registerFactory<UserRepository>(
      () => UserRepoImpl(
        sl<UserSource>(),
      ),
    );
}
