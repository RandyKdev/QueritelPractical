import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queritel_practical/models/pet.dart';
import 'package:queritel_practical/services/config.dart';

class PetDetailsScreen extends StatelessWidget {
  final Pet pet;
  const PetDetailsScreen({required this.pet, super.key});

  @override
  Widget build(BuildContext context) {
    final configService = GetIt.I<ConfigService>();
    configService.init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !configService.isWeb,
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
                    Text(pet.name),
                  ],
                ),
              )
            : Text(pet.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(configService.isDesktop ? 40 : 20),
          child: configService.isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: configService.screenWidth * .1),
                    Image.network(pet.photo),
                    const SizedBox(width: 50),
                    Expanded(child: showDetails()),
                    SizedBox(width: configService.screenWidth * .1),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(pet.photo),
                    const SizedBox(height: 20),
                    showDetails(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget showDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pet.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        Text('Age: ${pet.age.toString()}'),
        const SizedBox(height: 5),
        Text('Weight: ${pet.weight.toString()}'),
        const SizedBox(height: 40),
        Text(
          pet.description,
          style: const TextStyle(
            letterSpacing: 1.2,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
