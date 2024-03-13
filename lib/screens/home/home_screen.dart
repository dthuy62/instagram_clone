import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/assets/app_assets.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/widgets.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 110,
              titleSpacing: 0,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppAssets.init.iconLogoText.widget(),
                      Row(
                        children: [
                          AppAssets.init.iconReelsInactive.widget(),
                          SizedBox(
                            width: 20.H,
                          ),
                          AppAssets.init.iconMessenger.widget(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.H,
                  ),
                  SizedBox(
                    height: 80.H,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        padding: EdgeInsets.zero,
                        //shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.H).copyWith(
                              left: index == 0 ? 10.H : 8.H,
                              right: index == 19 ? 10.H : 8.H,
                            ),
                            child: UnicornOutlineButton(
                              strokeWidth: 2,
                              radius: 50,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFBAC47),
                                  Color(0xFFD91A46),
                                  Color(0xFFA60F93),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                    width: 70.H,
                                    height: 70.H,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    imageUrl:
                                        'https://ss-images.saostar.vn/wwebp700/pc/1649853724066/saostar-x3dyzbddlwqi5pfo.jpeg'),
                              ),
                              onPressed: () {},
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 100,
                (context, index) {
                  return Container(
                    height: 500,
                    margin: EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(context.l10n.text_hello_world),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: BlocProvider<HomeBloc>(
    //             create: (context) => HomeBloc(context.read()),
    //             child: Center(
    //               child: BlocBuilder<HomeBloc, HomeState>(
    //                 builder: (context, state) => _buildHome(context, state),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

// Widget _buildHome(BuildContext context, HomeState state) {
//   if (state is LoadCitiesSuccess) {
//     return _buildCityList(state.cities);
//   } else if (state is LoadCitiesError) {
//     return const Text('Error');
//   } else if (state is HomeInitial) {
//     return ElevatedButton(
//       onPressed: () => context.read<HomeBloc>().add(HomeEvent.loadCities),
//       child: Text(context.l10n.text_display_some_text),
//     );
//   } else {
//     // Loading
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }
//
// Widget _buildCityList(List<City> cities) {
//   return ListView.builder(
//     shrinkWrap: true,
//     itemBuilder: (context, index) => ListTile(
//       key: ValueKey(cities[index].id),
//       title: Text(cities[index].name),
//     ),
//     itemCount: cities.length,
//   );
// }
}
