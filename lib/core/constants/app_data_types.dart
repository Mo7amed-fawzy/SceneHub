import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

typedef AsyncListOfDataResponse<T> = Future<Either<Failure, List<T>>>;
typedef AsyncSingleDataResponse<T> = Future<Either<Failure, T>>;
typedef AsyncBooleanResponse = Future<Either<Failure, bool>>;
typedef AsyncVoidResponse = Future<Either<Failure, void>>;
typedef BooleanResponse = Either<Failure, bool>;
typedef DataMap = Map<String, dynamic>;
