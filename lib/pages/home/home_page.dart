import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/pages/products_page.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/products_provider.dart';
import 'package:shamo/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: ListView(
        children: const [
          HeaderHomePage(),
          CategoriesHome(),
          PopularProductsHome(),
          CardProductsHome(),
          NewArrivalHome(),
          NewArrivalSection(),
        ],
      ),
    );
  }
}

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 14,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Wrap(
        children: productsProvider.products
            .map(
              (products) => NewArrivalItems(
                products: products,
              ),
            )
            .toList(),
      ),
    );
  }
}

class NewArrivalItems extends StatelessWidget {
  const NewArrivalItems({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProductsPage(
              products: products,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${products?.galleries?[0].url}',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${products?.category?.name}',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${products?.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${products?.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewArrivalHome extends StatelessWidget {
  const NewArrivalHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        bottom: 14,
      ),
      child: Text(
        'New Arrivals',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}

class CardProductsHome extends StatelessWidget {
  const CardProductsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productsProvider.products
              .map(
                (products) => ProductItems(
                  products: products,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ProductItems extends StatelessWidget {
  const ProductItems({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProductsPage(
              products: products,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        width: 215,
        height: 278,
        decoration: BoxDecoration(
          color: const Color(0XFFECEDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            Image.network(
              '${products?.galleries?[0].url}',
              // 'assets/img_shoes.png',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${products!.category?.name}',
                    // 'nama produk category',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${products?.name}',
                    // 'nama produk',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${products?.price}',
                    // 'harga',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopularProductsHome extends StatelessWidget {
  const PopularProductsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        bottom: 14,
      ),
      child: Text(
        'Popular Products',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin - 1,
        bottom: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategorieItemsHome(
              name: 'All Shoes',
              containerColor: primaryColor,
              borderColor: primaryColor,
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Running',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Training',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Basketball',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Hiking',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorieItemsHome extends StatelessWidget {
  const CategorieItemsHome({
    Key? key,
    required this.name,
    required this.style,
    required this.containerColor,
    required this.borderColor,
  }) : super(key: key);

  final String name;
  final Color containerColor;
  final TextStyle style;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: Text(
        name,
        style: style,
      ),
    );
  }
}

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    return Container(
      margin: EdgeInsets.all(
        defaultMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, ${user.name}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Text(
                  '${user.email}',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              '${user.profilePhotoUrl}',
              width: 54,
              height: 54,
            ),
          ),
        ],
      ),
    );
  }
}
