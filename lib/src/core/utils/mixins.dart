import 'package:dartz/dartz.dart';

import '../../src.dart';

mixin ExceptionMixin {
  Future<Either<GeneralException, T>>handleResponse<T>(
    Future<T> Function() action,
  ) async {
    try {
      return right(
        await action(),
      );
    } on NoInternetException catch (e) {
      return left(e);
    } catch (e) {
      return left(
        GeneralException(
          message: e.toString(),
        ),
      );
    }
  }
}
