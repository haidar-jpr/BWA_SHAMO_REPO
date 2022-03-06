import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/massage_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/massage_service.dart';
import '../../../theme.dart';
import 'chat_buble.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return StreamBuilder<List<MassageModel>>(
      stream: MassageService().getMassageByUserId(userId: authProvider.user.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: snapshot.data
                !.map(
                  (MassageModel massage) => ChatBubble(
                    chat: massage.massage!,
                    isSender: massage.isFromUser!,
                    products: massage.products,
                  ),
                )
                .toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}