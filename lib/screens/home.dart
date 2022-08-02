import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queritel_practical/enums/pet.dart';
import 'package:queritel_practical/services/config.dart';
import 'package:queritel_practical/widgets/section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final configService = GetIt.I<ConfigService>();
    configService.init(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: configService.isWeb
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).popUntil(
                          (route) => route.isFirst,
                        ),
                        child: const Icon(Icons.logo_dev_rounded),
                      ),
                      const SizedBox(width: 20),
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: PetEnum.values
                            .map(
                                (e) => Tab(text: e.displayString.toUpperCase()))
                            .toList(),
                      ),
                    ],
                  ),
                )
              : TabBar(
                  isScrollable: false,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: PetEnum.values
                      .map((e) => Tab(text: e.displayString.toUpperCase()))
                      .toList(),
                ),
        ),
        body: TabBarView(
          physics: configService.isWeb
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          children: const [
            SectionWidget(pet: PetEnum.cat),
            SectionWidget(pet: PetEnum.dog),
          ],
        ),
      ),
    );
  }
}
