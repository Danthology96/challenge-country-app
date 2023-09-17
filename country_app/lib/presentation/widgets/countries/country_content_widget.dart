import 'package:country_app/domain/entities/country.dart';
import 'package:flutter/material.dart';

class CountryContentWidget extends StatelessWidget {
  const CountryContentWidget({
    super.key,
    required this.country,
  });

  final Country country;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(country.coatOfArms!.png),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.officialName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(country.code)
                ],
              ),
            ),
          ],
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Región: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: country.region,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Subregión: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: country.subregion,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Capital: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: country.capital,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Monedas: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  for (var currency in country.currencies!.values)
                    TextSpan(
                      text: (currency.name.isEmpty) ? '' : currency.name,
                      children: [
                        TextSpan(
                            text: currency.symbol.isEmpty
                                ? ''
                                : " ${currency.symbol}")
                      ],
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Idiomas oficiales: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  for (var language in country.languages!.values)
                    TextSpan(
                      text: "$language ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Límites geográficos: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  for (var border in country.borders!)
                    TextSpan(
                      text: "$border ",
                      // text: "$border ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Población: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: "${country.population.toString()} personas",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Icono: ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: country.abreviation,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
