import 'package:flutter/material.dart';
import 'package:locategeouser/api/notifications.dart';
import 'package:locategeouser/ui/theme.dart';
import 'package:lottie/lottie.dart';

class LocalPush extends StatefulWidget {
  const LocalPush({Key? key}) : super(key: key);

  @override
  _LocalPushState createState() => _LocalPushState();
}

class _LocalPushState extends State<LocalPush> {
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: const Text(
          'Push Notifications',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 200),
              height: 100,
              width: double.infinity,
              child: Lottie.asset('assets/lottie/noti.json'),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      notifyHelper.displayNotification(
                          body: 'Notification Activated', title: 'Fauzi');
                    },
                    child: const Text(
                      'Simple Notification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      notifyHelper.scheduledNotification(
                          body: 'Scheduled Notification Activated',
                          title: 'Fauzi');
                    },
                    child: const Text(
                      'Schedule Notification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      notifyHelper.cancelAllNotifications();
                    },
                    child: const Text(
                      'Remove Notification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
