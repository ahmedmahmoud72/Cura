import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_hospital_ward_app/modules/chat/cubit/chat_states.dart';

import '../../../shared/constants.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  CollectionReference messages =
  FirebaseFirestore.instance.collection(kMessagesCollections);


  void sendMessage({required String message, required String email}) {
    messages.add(
        messages.add(
          {kMessage: message, kCreatedAt: DateTime.now(), 'id': email},

        ));
  }

  void getMessages()
  {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      emit(ChatSuccessState());
    });
  }
  }
