import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'classes.chopper.dart';

@ChopperApi(baseUrl: '/user/classes')
abstract class ClassesService extends ChopperService {
  static ClassesService create([final ChopperClient? client]) =>
      _$ClassesService(client);

// Get classes
  @Get(path: '')
  Future<RawApiResponse> getClasses();
}
