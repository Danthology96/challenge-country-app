import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:country_app/domain/entities/country.dart';

/// Widget used in search and home page
class CountryListTileWidget extends StatelessWidget {
  const CountryListTileWidget({
    super.key,
    required this.country,
  });

  final Country country;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(country.flagUrl),
      ),
      title: Text(
        country.commonName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        country.officialName,
        style: Theme.of(context).textTheme.labelMedium,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(country.code),
      onTap: () => context.push('/country-detail/${country.commonName}'),
    );
  }
}
