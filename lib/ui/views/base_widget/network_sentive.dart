import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/utils/enums.dart';
import 'package:trove/utils/styles.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  const NetworkSensitive({
    Key? key,
    required this.child,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus?>(context);

    if (connectionStatus == ConnectivityStatus.online) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.offline) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              //padding: EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width,
              height: 24,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'No Internet connection',
                  //textAlign: TextAlign.center,
                  style: AppTextStyle.whiteNormal16,
                ),
              ),
            ),
            Positioned.fill(top: 24, child: child),
          ],
        ),
      );
    }

    return Opacity(
      opacity: 0.1,
      child: Column(
        children: [
          Text('sssdfae'),
          Flexible(child: child),
        ],
      ),
    );
  }
}
