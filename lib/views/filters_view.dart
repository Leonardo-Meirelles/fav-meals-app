import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_providers.dart';

class FiltersView extends ConsumerWidget {
  const FiltersView({
    super.key,
  });

  // void _setView(String identifier) {
  //   Navigator.of(context).pop();

  //   if (identifier == 'meals') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const TabsView(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectView: _setView),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only includes gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            value: ref.watch(filtersProvider
                .select((value) => value[Filter.glutenFree] == true)),
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
          ),
          SwitchListTile(
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only includes lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            value: ref.watch(filtersProvider
                .select((value) => value[Filter.lactoseFree] == true)),
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only includes vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            value: ref.watch(filtersProvider
                .select((value) => value[Filter.vegetarian] == true)),
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only includes vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            value: ref.watch(
                filtersProvider.select((value) => value[Filter.vegan] == true)),
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
          ),
        ],
      ),
    );
  }
}
