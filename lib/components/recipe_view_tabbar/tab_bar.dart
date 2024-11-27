import 'package:cookbook/components/recipe_view_tabbar/tabbar_contents/brief.dart';
import 'package:cookbook/components/recipe_view_tabbar/tabbar_contents/ingredients.dart';
import 'package:cookbook/components/recipe_view_tabbar/tab_bar_text.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/models/recipe.dart';

class TabBarSelector extends StatefulWidget {
  const TabBarSelector({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<TabBarSelector> createState() => _TabBarSelectorState();
}

class _TabBarSelectorState extends State<TabBarSelector>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                // height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorPallete.defaultGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TabBar(
                        labelColor: ColorPallete.primaryText,
                        unselectedLabelColor: ColorPallete.secondaryText,
                        controller: tabController,
                        indicator: BoxDecoration(
                          color: ColorPallete.plainWhite,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0xFF808080).withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        tabs: const [
                          Tab(
                            child: TabBarText(tabName: 'Ingredients'),
                          ),
                          Tab(
                            child: TabBarText(tabName: 'Briefly'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Ingredients(recipe: widget.recipe),
                    Brief(recipe: widget.recipe),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
