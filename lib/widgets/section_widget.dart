import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queritel_practical/constants/colors.dart';
import 'package:queritel_practical/enums/pet.dart';
import 'package:queritel_practical/models/pet.dart';
import 'package:queritel_practical/services/api.dart';
import 'package:queritel_practical/services/config.dart';
import 'package:queritel_practical/widgets/pet_widget.dart';

class SectionWidget extends StatefulWidget {
  final PetEnum pet;
  const SectionWidget({required this.pet, super.key});

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  List<Pet>? pets;

  @override
  void initState() {
    super.initState();
    getPets();
  }

  void getPets() async {
    final apiService = GetIt.I<ApiService>();
    final pets = await apiService.getpets(widget.pet);
    if (!mounted) return;
    setState(() => this.pets = pets);
  }

  @override
  Widget build(BuildContext context) {
    final configService = GetIt.I<ConfigService>();

    if (pets == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: CustomColors.primaryColor,
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(configService.isDesktop ? 40 : 20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: .9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => PetWidget(pet: pets![index]),
      itemCount: pets!.length,
    );
  }
}
