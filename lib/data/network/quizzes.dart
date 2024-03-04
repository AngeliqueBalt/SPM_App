import 'package:chopper/chopper.dart';

part 'quizzes.chopper.dart';

// TODO(A): DOES THIS URL HAVE TO BE SOMETHING ELSE
@ChopperApi(baseUrl: '/user')
abstract class QuizzesService extends ChopperService {
  static QuizzesService create([final ChopperClient? client]) =>
      _$QuizzesService(client);
}
