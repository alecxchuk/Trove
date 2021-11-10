import 'package:trove/utils/enums.dart';

class SnackRequest {
  final String content;
  final Duration duration;
  final SnackbarType variant;

  SnackRequest(
      {required this.content, required this.duration, required this.variant});
}
