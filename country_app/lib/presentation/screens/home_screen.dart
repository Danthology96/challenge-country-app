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
            return Center(
              ///TODO: Change listview with customScroll
              child: ListView.builder(
                itemCount: countriesProvider.allCountries.length,
                itemBuilder: (context, index) {
                  return Text(countriesProvider.allCountries[index].commonName);
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
