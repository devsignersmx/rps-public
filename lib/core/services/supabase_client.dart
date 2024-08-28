import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseNetwork {
  SupabaseNetwork(this._supabase) {
    _supabase = Supabase.instance;
  }
  Supabase _supabase;
  SupabaseClient get client => _supabase.client;
}
