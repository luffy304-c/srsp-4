import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/bottom_bar.dart';
import 'home_page.dart';
import 'catalog_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  // Общий список для каталога и избранного. База данных не нужна.
  final List<Product> favorites = [];

  void toggleFavorite(Product product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      CatalogPage(favorites: favorites, onFavorite: toggleFavorite),
      FavoritesPage(favorites: favorites, onFavorite: toggleFavorite),
      const ProfilePage(),
    ];
    const titles = ['home', 'catalog', 'favorites', 'profile'];
    return Scaffold(
      appBar: AppBar(title: Text(titles[currentIndex].tr(context: context))),
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: pages),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
