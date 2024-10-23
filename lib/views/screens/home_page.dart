import 'package:alarm_app/helpers/notification_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper.simpleNotification();
                },
                child: Text("simple Notification..")),
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper.scheduleNotification(
                      title: "hello", body: "my name is meet");
                },
                child: Text("Schedule Notification..")),
            Container(
              height: 110,
              width: 430,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "5:30 am",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text("Mon,Tue"),
                      ],
                    ),
                    Switch(
                      value: istrue,
                      onChanged: (val) {
                        val = istrue;

                        istrue = !istrue;
                      },
                      hoverColor: Colors.black,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
