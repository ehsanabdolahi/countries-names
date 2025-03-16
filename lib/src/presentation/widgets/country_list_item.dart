import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/country.dart';

class CountryListItem extends StatelessWidget {
  final Country country;

  const CountryListItem({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: SizedBox(
          width: 60,
          height: 40,
          child: CachedNetworkImage(
            imageUrl: country.flagUrl,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          country.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          country.capital.isEmpty ? 'پایتخت نامشخص' : 'پایتخت: ${country.capital}',
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}