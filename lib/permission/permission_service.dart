import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static final PermissionService instance = PermissionService._();

  Future<bool> notification() => _request(Permission.notification);

  Future<bool> contacts() => _request(Permission.contacts);

  Future<bool> _request(Permission permission) async {
    final status = await permission.request();
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return status.isGranted;
  }
}
