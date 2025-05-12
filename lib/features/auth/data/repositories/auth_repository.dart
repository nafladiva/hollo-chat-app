import 'package:dartz/dartz.dart';
import 'package:hollo/core/core.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register();
  Future<Either<Failure, void>> login();
}

//TODO: implement
