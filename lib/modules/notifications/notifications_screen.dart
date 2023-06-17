import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/App_layout.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/notifications_model.dart';
import '../../shared/components/general_components.dart';
import '../../shared/components/notifications_component.dart';
import '../../shared/custom_icons/my_flutter_app_icons.dart';

class NotificationsScreen extends StatelessWidget {
  late NotificationModel model;

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              title: Transform(
                transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, const AppLayout());
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'assets/images/cura_small_logo.png',
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, Container());
                  },
                  icon: const Icon(
                    MyFlutterApp.comment_empty,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(context, Container());
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/patient.png'),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children:
                          dummyNotification.map((e) => Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: NotificationComponent(
                              title: e.message,
                              subTitle: '${e.date} at ${e.time}',
                            ),
                          )).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
