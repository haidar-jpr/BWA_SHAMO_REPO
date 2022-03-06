import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/massage_service.dart';
import '../../../theme.dart';
import '../main/detail_chat.dart';

class InputChat extends StatefulWidget {
  InputChat({
    Key? key,
    this.products,
  }) : super(key: key);

  Products? products;

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  TextEditingController massageC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleMassage() async {
      await MassageService().addMassage(
        user: authProvider.user,
        isFromUser: true,
        products: widget.products,
        massage: massageC.text,
      );

      setState(() {
        widget.products = UninitializedProductModel();
        massageC.text = '';
      });
    }

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.products is UninitializedProductModel
              ? const SizedBox()
              : ProductPreview(
                  products: widget.products,
                ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: massageC,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Typle Message...',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: handleMassage,
                icon: Image.asset(
                  'assets/icon_submit.png',
                  width: 40,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
