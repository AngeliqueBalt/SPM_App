import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'class_management.chopper.dart';

@ChopperApi(baseUrl: '/admin/classes')
abstract class ClassManagementService extends ChopperService {
  static ClassManagementService create([final ChopperClient? client]) =>
      _$ClassManagementService(client);

  // Get all classes
  @Get(path: '')
  Future<RawApiResponse> getAllClasses();

  // Add new class
  @Post(path: '')
  Future<RawApiResponse> addClass({
    @Body() required final Map<String, dynamic> body,
  });

  // Remove class
  @Delete(path: '/{id}')
  Future<RawApiResponse> removeClass({
    @Path() required final String id,
  });

  // Update class
  @Patch(path: '/{id}')
  Future<RawApiResponse> editClass({
    @Path() required final String id,
    @Body() required final Map<String, dynamic> body,
  });
}
