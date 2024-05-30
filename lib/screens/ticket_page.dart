import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Container(
                width: 328.w,
                height: 40.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 24.w,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Icon(
                              Icons.home,
                              size: 24.w,
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.home, size: 24.w, color: Colors.white)
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Container(
                height: 350,
                width: double.infinity,
                color: Colors.amber,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Дешевый тариф"),
                      Row(
                        children: [
                          Icon(Icons.abc),
                          Text("Ручная кладь 1х5 кг"),
                          Expanded(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text("55х20х40 см")),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.abc),
                          Text("Ручная кладь 1х5 кг"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.abc),
                          Text("Ручная кладь 1х5 кг"),
                          Icon(Icons.abc),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.abc),
                          Text("Ручная кладь 1х5 кг"),
                          Icon(Icons.abc),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 312.w,
                          height: 102.h,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r))),
                          child: Column(
                            children: [
                              Container(
                                  width: 312.w,
                                  height: 51.h,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Добавить багаж + 1 082 ₽"),
                                        Padding(
                                          padding: EdgeInsets.only(right: 16.w),
                                          child: Container(
                                            width: 36.w,
                                            height: 20.h,
                                            child: Switch(
                                              activeTrackColor: Colors.red,
                                              value: true,
                                              onChanged: (bool value) {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Text("Изменить обмен или возврат"),
                                  Icon(Icons.abc),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 12,
                    ),
                    title: Text("Якутия"),
                    subtitle: Text("04ч в полете"),
                    trailing: Container(
                      color: Colors.grey,
                      child: Text("Подробнее"),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 20, backgroundColor: Colors.amber),
                              CircleAvatar(
                                  radius: 7, backgroundColor: Colors.white),
                            ],
                          ),
                          Container(
                            width: 5,
                            height: 50,
                            color: Colors.amber,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 20, backgroundColor: Colors.amber),
                              CircleAvatar(
                                  radius: 10, backgroundColor: Colors.white),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("03:15"),
                                subtitle: Text("23 фев, ср"),
                              ),
                              ListTile(
                                title: Text("03:15"),
                                subtitle: Text("23 фев, ср"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("03:15"),
                                subtitle: Text("23 фев, ср"),
                              ),
                              ListTile(
                                title: Text("03:15"),
                                subtitle: Text("23 фев, ср"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}

Widget androidSwitch() => Transform.scale(
      scale: 1.5,
      child: Switch(
        value: true,
        onChanged: (value) {},
      ),
    );
