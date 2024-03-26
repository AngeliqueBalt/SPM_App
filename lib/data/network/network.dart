import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

/// Sets up the Chopper client with the given services.

ChopperClient setUpClient({required final Iterable<ChopperService> services}) {
  return ChopperClient(
    baseUrl: Uri.parse('http://localhost:51548/'),
    services: services,
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
    interceptors: [
      (final Request request) async {
        if (request.uri.path == '/_auth/login') return request;

        final currentUser = await Authentication.readFromStorage();

        if (currentUser != null) {
          return applyHeader(
            request,
            "Authorization",
            'Bearer ${currentUser.sessionToken}',
            override: false,
          );
        }
        return request;
      },
    ],
  );
}
