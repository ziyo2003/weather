import 'package:new_api_project/core/either/either.dart';

import '../failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams {}
