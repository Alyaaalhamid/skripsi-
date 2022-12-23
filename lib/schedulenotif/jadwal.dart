import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:skripsi/home_page.dart';
import 'package:skripsi/main.dart';
import 'package:skripsi/schedulenotif/add_task.dart';
import 'package:skripsi/schedulenotif/button.dart';
import 'package:skripsi/schedulenotif/notification_services.dart';
import 'package:skripsi/schedulenotif/task_controller.dart';
import 'package:skripsi/schedulenotif/task_modul.dart';
import 'package:skripsi/schedulenotif/task_tile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class calendar extends StatefulWidget {
  @override
  _calendar createState() => _calendar();
}

class _calendar extends State<calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final _taskController = Get.put(TaskController());
  Map<String, List> mySelectedEvent = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvent[DateFormat('dd-MM-yyyy').format(dateTime)] != null) {
      return mySelectedEvent[DateFormat('dd-MM-yyyy').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEvent() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xff92C9A1),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Masukkan title dan description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              } else {
                print(titleController.text);
                print(descpController.text);

                if (mySelectedEvent[
                        DateFormat('dd-MM-yyyy').format(selectedDay)] !=
                    null) {
                  mySelectedEvent[DateFormat('dd-MM-yyyy').format(selectedDay)]
                      ?.add(
                    {
                      'eventTitle': titleController.text,
                      'eventDescp': descpController.text,
                    },
                  );
                } else {
                  mySelectedEvent[
                      DateFormat('dd-MM-yyyy').format(selectedDay)] = [
                    {
                      'eventTitle': titleController.text,
                      'eventDescp': descpController.text,
                    }
                  ];
                }
                print('New Event ${json.encode(mySelectedEvent)}');
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Color(0xff92C9A1),
              ),
            ),
          )
        ],
      ),
    );
  }

  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => homepage(username: username)));
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
          ),
          child: Text(
            'Jadwal',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              notifyHelper.displayNotification();
              notifyHelper.scheduledNotification();
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.all(20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) =>
          //                       homepage(username: username)));
          //         },
          //         icon: Icon(Icons.arrow_back_ios),
          //       ),
          //       IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.notifications,
          //           size: 30,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime.utc(1999),
            lastDay: DateTime.utc(2030),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              if (!isSameDay(selectDay, selectedDay)) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              }
              print(focusedDay);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Color(0xff4C9E63),
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Color(0xff4C9E63),
                shape: BoxShape.circle,
              ),
            ),
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _listOfDayEvents,
          ),
          // Container(
          //   padding: EdgeInsets.only(left: 30),
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          //     color: Color(0xff67BD7F),
          //   ),
          //   child: Stack(
          //     children: <Widget>[
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: <Widget>[
          //           Padding(
          //             padding: EdgeInsets.only(top: 50),
          //             child: Text(
          //               'Upcomming Event',
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                mybutton(
                    label: '+ Add Task',
                    onTap: () async {
                      await Get.to(() => Addtask());
                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => Addtask()));
                      _taskController.getTask();
                    }),
              ],
            ),
          ),
          // Column(children: [
          SizedBox(
            height: 10,
          ),
          _showTask(),
          // ])
        ],
      ),
      // floatingActionButton: FloatingActionButton.small(
      //   onPressed: () => _showAddEvent(),
      //   child: Icon(
      //     Icons.plus_one_rounded,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Color(0xff92C9A1),
      // ),
    );
  }

  _showTask() {
    return Expanded(child: Obx(() {
      return ListView.builder(
        itemCount: _taskController.taskList.length,
        itemBuilder: (_, index) {
          print(_taskController.taskList.length);
          Task task = _taskController.taskList[index];
          print(task.toJson());
          if (task.repeat == 'Daily') {
            DateTime date = DateFormat.jm().parse(task.startTime.toString());
            var myTime = DateFormat('HH:mm').format(date);
            notifyHelper.scheduledNotification(
                int.parse(myTime.toString().split(':')[0]),
                int.parse(myTime.toString().split(':')[1]),
                task);
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                    child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showButtomSheet(context, task);
                      },
                      child: TaskTile(task),
                    ),
                  ],
                )),
              ),
            );
          }
          if (task.date == DateFormat.yMd().format(selectedDay)) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                    child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showButtomSheet(context, task);
                      },
                      child: TaskTile(task),
                    ),
                  ],
                )),
              ),
            );
          } else {
            return Container();
          }
        },
      );
    }));
  }

  _showButtomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: 'Task Completed',
                    onTap: () {
                      _taskController.markTaskCompleted(task.id!);
                      Get.back();
                    },
                    clr: Colors.green,
                    context: context),
            SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
                label: 'Delete',
                onTap: () {
                  _taskController.delete(task);

                  Get.back();
                },
                clr: Colors.red[300]!,
                context: context),
            SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
                label: 'Close',
                onTap: () {
                  Get.back();
                },
                clr: Colors.red[300]!,
                isClose: true,
                context: context),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: isClose == true ? Colors.grey : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.white : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? TextStyle(color: Colors.black, fontSize: 16)
                : TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
//Widget calendarControl() {
//return Container(
//margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
// decoration: BoxDecoration(
// color: Colors.white,
// ),
//child: TableCalendar(
//focusedDay: DateTime.now(),
// firstDay: DateTime.utc(1999),
// lastDay: DateTime.utc(2030),
// calendarFormat: format,
// onFormatChanged: (CalendarFormat _format){
// setState((){
// format  = _format
// });
// },
// calendarStyle: CalendarStyle(
// canMarkersOverflow: true,
// ),
// ),
//);
//}
