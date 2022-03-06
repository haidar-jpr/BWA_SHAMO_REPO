import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/chats/components/chat_tile.dart';
import 'package:shamo/pages/chats/main/detail_chat.dart';
import 'package:shamo/pages/chats/components/empty_chat.dart';

import '../../../models/massage_model.dart';
import '../../../models/products_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/massage_service.dart';

class HaveChat extends StatelessWidget {
  const HaveChat({
    Key? key,
    this.massageModel,
  }) : super(key: key);

  final MassageModel? massageModel;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return StreamBuilder<List<MassageModel>>(
      stream: MassageService().getMassageByUserId(userId: authProvider.user.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          if(snapshot.data!.isEmpty){
            return EmtyChat();
          }

          return Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DetailChatPage(
                      products: UninitializedProductModel(),
                    ),
                  ),
                );
              },
              child: ChatTile(massageModel: snapshot.data![snapshot.data!.length - 1]),
            ),
          );
        } else {
          return EmtyChat();
        }
      },
    );
  }
}