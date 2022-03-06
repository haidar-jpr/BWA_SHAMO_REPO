import 'package:flutter/material.dart';

import '../../../theme.dart';
import 'location_checkout.dart';
import 'title_chekout.dart';

class AddressCheckoutPage extends StatelessWidget {
  const AddressCheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TittleCheckoutPage(
            name: 'Address Details',
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icon_store_location.png',
                    width: 40,
                  ),
                  Image.asset(
                    'assets/icon_line.png',
                    height: 45,
                  ),
                  Image.asset(
                    'assets/icon_your_address.png',
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LocationCheckoutPage(
                    storeLocation: 'Store Location',
                    homeLocation: 'Adidas Core',
                  ),
                  SizedBox(height: defaultMargin),
                  const LocationCheckoutPage(
                    storeLocation: 'Your Address',
                    homeLocation: 'Marsemoon',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}