import 'package:country_app/domain/entities/country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:country_app/presentation/providers/countries/countries_provider.dart';

/// Main screen, this screen contains the list of all the countries
class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Calls the countries provider
    final countriesProvider =
        Provider.of<CountriesProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries App'),
        centerTitle: true,
      ),

      /// Need a future builder to give time to the app for load data
      body: FutureBuilder(
        /// calls the loadCountries
        future: countriesProvider.loadAllCountries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Country> countries = countriesProvider.allCountries;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                /// Replaced listview to slivers due to performance
                SliverList.separated(
                  itemCount: countriesProvider.allCountries.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 2),
                  itemBuilder: (context, index) {
                    final Country country = countries[index];
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
                      onTap: () {
                        //TODO: Make the navigation to the new Screen
                      },
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
