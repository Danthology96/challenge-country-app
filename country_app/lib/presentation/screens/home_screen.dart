import 'package:country_app/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:country_app/presentation/widgets/countries/country_list_tile_widget.dart';
import 'package:country_app/presentation/providers/countries/countries_provider.dart';
import 'package:country_app/domain/entities/country.dart';

/// Main screen, this screen contains the list of all the countries
class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool filtersVisible = false;

  Region selectedRegion = Region.none;
  late CountriesProvider countriesProvider;

  /// Calls the countries provider
  @override
  void initState() {
    countriesProvider = Provider.of<CountriesProvider>(context, listen: false);
    loadCountries();
    super.initState();
  }

  /// load the data in asynchronous form and then, it refreshes the screen
  void loadCountries() async {
    await countriesProvider.loadAllCountries().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Countries App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.push('/search');
              },
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (filtersVisible) {
                    filtersVisible = false;
                  } else {
                    filtersVisible = true;
                  }
                });
              },
              icon: const Icon(Icons.filter_list_sharp),
            ),
          ],
        ),

        /// Changed the future because everytime the screen is refreshed, it will
        /// call the api again, we don't need this, so we just wait for the data
        /// to complete just once, when i display the filters, the screen will
        /// refresh, so that causes the previous future to load data again, this
        /// is a very good solution to that.
        body: (countriesProvider.currentCountries.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  (filtersVisible)
                      ? SliverSafeArea(
                          sliver: SliverAppBar(
                            pinned: true,
                            title: SizedBox(
                              height: 40,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 10);
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: Region.values.length,
                                itemBuilder: (context, index) {
                                  return FilterChip(
                                      label: Text(Region.values[index].value),

                                      /// If the region matches with the first
                                      /// element, this means that it's selected
                                      selected: selectedRegion ==
                                          Region.values[index],
                                      onSelected: (selected) {
                                        if (!selected) {
                                          filterCountries("", context);
                                          selectedRegion = Region.none;
                                        } else {
                                          selectedRegion = Region.values[index];
                                          filterCountries(
                                              Region.values[index].value,
                                              context);
                                        }
                                      });
                                },
                              ),
                            ),
                          ),
                        )
                      : const SliverPadding(padding: EdgeInsets.zero),

                  /// Replaced listview to slivers due to performance
                  SliverList.separated(
                    itemCount: countriesProvider.currentCountries.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 2),
                    itemBuilder: (context, index) {
                      final Country country =
                          countriesProvider.currentCountries[index];
                      return CountryListTileWidget(country: country);
                    },
                  ),
                ],
              ));
  }

  /// load the data in asynchronous form and then, it refreshes the screen
  void filterCountries(String region, BuildContext context) async {
    final countriesProvider =
        Provider.of<CountriesProvider>(context, listen: false);
    // if (region == '') {
    //   setState(() {
    //     countriesProvider.currentCountries = countriesProvider.allCountries;
    //   });
    // }
    await countriesProvider.filterRegion(region).then((value) {
      setState(() {
        countriesProvider.currentCountries = value;
      });
    });
  }
}
