import 'package:dartz/dartz.dart';

import '../../../../core/common/exceptions/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_source/user_source.dart';

class UserRepoImpl implements UserRepository {
  UserRepoImpl(this._userDataSource);
  final UserSource _userDataSource;

  @override
  Future<Either<Failure, UserEntity?>> getUser() async {
    try {
      final response = await _userDataSource.getUser();
      return Right(response);
    } catch (e) {
      return Left(SupaBaseException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await _userDataSource.signInWithEmailAndPassword(
        email,
        password,
      );
      return Right(response);
    } catch (e) {
      return Left(SupaBaseException(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await _userDataSource.signOut();
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final response = await _userDataSource.signUpWithEmailAndPassword(
        email,
        password,
        name,
      );
      return Right(response);
    } catch (e) {
      return Left(SupaBaseException(e.toString()));
    }
  }
}
