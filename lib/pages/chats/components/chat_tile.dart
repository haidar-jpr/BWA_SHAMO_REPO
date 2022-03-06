import 'package:flutter/material.dart';

import '../../../models/massage_model.dart';
import '../../../theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.massageModel,
  }) : super(key: key);

  final MassageModel? massageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor3,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 33,
            ),
            width: 315,
            height: 67,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_logo_shop.png',
                  width: 54,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${massageModel!.massage}',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: light),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: subtitleTextColor,
          ),
        ],
      ),
    );
  }
}