// import 'package:achref_siaha/controllers/accomondation_controller.dart';
import 'package:achref_siaha/controllers/accomondation.dart';
import 'package:achref_siaha/model/accomondation.dart';
import 'package:achref_siaha/view/accomondationForm.dart';
// import 'package:achref_siaha/view/accomondation_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccomondationPage extends StatelessWidget {
  final AccomondationController controller = Get.put(AccomondationController());
  final DateFormat formatter = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.accommodations.length,
          itemBuilder: (context, index) {
            return AccommodationCard(
              accommodation: controller.accommodations[index],
              formatter: formatter,
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}

class AccommodationCard extends StatelessWidget {
  final Accommodation accommodation;
  final DateFormat formatter;
  final AccomondationController controller;

  const AccommodationCard({
    Key? key,
    required this.accommodation,
    required this.formatter,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Text(
                accommodation.title,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Text(accommodation.description),
              const SizedBox(height: 10.0),
              RatingRow(rating: accommodation.rating),
              const SizedBox(height: 10.0),
              PriceRow(price: accommodation.price),
              const SizedBox(height: 10.0),
              AvailabilityRow(availableFrom: accommodation.availableFrom, formatter: formatter),
              const SizedBox(height: 10.0),
              ActionButtons(
                accommodation: accommodation,
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... (RatingRow, PriceRow, AvailabilityRow, and ActionButtons classes remain the same)

class RatingRow extends StatelessWidget {
  final double rating;

  const RatingRow({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        const SizedBox(width: 5.0),
        Text(rating.toString()),
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  final double price;

  const PriceRow({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.attach_money, color: Colors.green),
        const SizedBox(width: 5.0),
        Text('\$${price.toStringAsFixed(2)}'),
      ],
    );
  }
}

class AvailabilityRow extends StatelessWidget {
  final DateTime availableFrom;
  final DateFormat formatter;

  const AvailabilityRow({Key? key, required this.availableFrom, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.date_range, color: Colors.blue),
        const SizedBox(width: 5.0),
        Text('Available from: ${formatter.format(availableFrom)}'),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  final Accommodation accommodation;
  final AccomondationController controller;

  const ActionButtons({Key? key, required this.accommodation, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Get.to(() => AccommodationForm(
                  accommodation: accommodation,
                  isEditing: true,
                ));
          },
          tooltip: 'Edit',
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            controller.deleteAccommodation(accommodation.id).catchError((error) {
              // Gérer les erreurs ici
              print('Erreur lors de la suppression de l\'hébergement: $error');
            });
          },
          tooltip: 'Delete',
        ),
      ],
    );
  }
}