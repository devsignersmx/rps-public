import 'package:dartz/dartz.dart';

import '../../../../core/common/exceptions/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity?>> getUser();
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
