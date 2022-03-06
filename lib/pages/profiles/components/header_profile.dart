import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../theme.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: bgColor1,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  '${user.profilePhotoUrl}',
                  width: 64,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo, ${user.name}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Text(
                        '${user.email}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                icon: Image.asset(
                  'assets/icon_exit.png',
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
