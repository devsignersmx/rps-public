import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/user_model.dart';

class UserSource {
  UserSource(this._client);
  final SupabaseClient _client;
  Future<UserModel> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    final gravatar = Gravatar(email);
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'picture': gravatar.imageUrl(size: 200),
      },
    );
    if (response.user == null) {
      throw Exception('Sign up failed');
    }
    await saveProfile(
      response.user!.id,
      email,
      gravatar.imageUrl(size: 200),
      name,
    );
    return UserModel.fromJson(
      {
        ...response.user!.userMetadata!,
        ...response.user!.toJson(),
      },
    );
  }

  Future<UserModel> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await _client.auth.signInWithPassword(
      password: password,
      email: email,
    );
    if (response.user == null) {
      throw Exception('Sign in failed');
    }
    return UserModel.fromJson(
      {
        ...response.user!.userMetadata!,
        ...response.user!.toJson(),
      },
    );
  }

  // Future<UserModel> signInWithGoogle() async {}
  Future<void> saveProfile(
    String id,
    String email,
    String picture,
    String name,
  ) async {
    await _client.from('profiles').insert(
      {
        'id': id,
        'email': email,
        'picture': picture,
        'name': name,
      },
    );
  }

  Future<UserModel?> getUser() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      return null;
    }
    if (user.appMetadata['provider'] == 'google') {
      return UserModel.fromJson({
        'id': user.id,
        'name': user.userMetadata!['full_name'],
        'email': user.email,
        'picture': user.userMetadata!['avatar_url'],
      });
    }
    return UserModel.fromJson({...user.userMetadata!, ...user.toJson()});
  }

  // Future<UserModel?> getPublicProfile(String id) async {}
  Future<void> signOut() async => _client.auth.signOut();
}
