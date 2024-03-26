import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'classes.chopper.dart';

/// Service for classes
/// This file contains the http requests to get the classes.

@ChopperApi(baseUrl: '/user/classes')
abstract class ClassesService extends ChopperService {
  static ClassesService create([final ChopperClient? client]) =>
      _$ClassesService(client);

// Get classes
  @Get(path: '')
  Future<RawApiResponse> getClasses();
}
