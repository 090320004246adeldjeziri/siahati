import 'package:achref_siaha/controllers/accomondation.dart';
import 'package:achref_siaha/model/accomondation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_time_picker/date_time_picker.dart';


class AccommodationForm extends StatelessWidget {
  final Accommodation? accommodation;
  final bool isEditing;

  AccommodationForm({this.accommodation, this.isEditing = false});

  final _formKey = GlobalKey<FormState>();
  final AccomondationController _controller = Get.find();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  String _availableFrom = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    if (isEditing && accommodation != null) {
      _titleController.text = accommodation!.title;
      _descriptionController.text = accommodation!.description;
      _imageUrlController.text = accommodation!.imageUrl;
      _ratingController.text = accommodation!.rating.toString();
      _priceController.text = accommodation!.price.toString();
      _positionController.text = accommodation!.position.toString();
      _availableFrom = accommodation!.availableFrom.toIso8601String();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Accommodation' : 'Add Accommodation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid rating';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: InputDecoration(labelText: 'Position'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Please enter a valid position';
                  }
                  return null;
                },
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateLabelText: 'Available from',
                initialValue: _availableFrom,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                onChanged: (val) => _availableFrom = val,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(isEditing ? 'Update' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Accommodation accommodation = Accommodation(
        id: isEditing ? this.accommodation!.id : '',
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        rating: double.parse(_ratingController.text),
        price: double.parse(_priceController.text),
        availableFrom: DateTime.parse(_availableFrom),
        position: int.parse(_positionController.text),
      );

      if (isEditing) {
        _controller.updateAccommodation(accommodation);
      } else {
        _controller.addAccommodation(accommodation);
      }

      Get.back();
    }
  }
}
