import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:productive/core/data/ad_helper.dart';
import 'package:productive/core/extensions/extensions.dart';

import 'package:productive/features/home/bloc/bnb_bloc.dart';
import 'package:productive/features/home/widgets/bnb_item.dart';

import '../../assets/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController homePageController;
  late BannerAd bannerAd;
  late InterstitialAd interstitialAd;
  var index = 0;

  @override
  void initState() {
    homePageController = PageController(keepPage: true);
    isLoading = true;
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoading = false;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.show();
        },
        onAdFailedToLoad: (err) {},
      ),
    ).then((value) {

    });

    bannerAd.load();
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BnbBloc(),
      child: BlocBuilder<BnbBloc, BnbState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(children: [
              Expanded(
                child: IndexedStack(
                  index: index,
                  children: [],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                decoration: BoxDecoration(
                  color: context.colors.bnbColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BnbItem(
                            index: 0,
                            icon: AppIcons.tasks,
                            title: context.localization.tasks,
                            onTap: () {
                              index = 0;
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 0, isActive: true));
                            }),
                        BnbItem(
                            index: 1,
                            icon: AppIcons.expense,
                            title: context.localization.expense,
                            onTap: () {
                              index = 1;
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 1, isActive: true));
                            }),
                        BnbItem(
                            index: 2,
                            icon: AppIcons.expense,
                            title: context.localization.create,
                            onTap: () {
                              index = 2;
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 2, isActive: true));
                            }),
                        BnbItem(
                            index: 3,
                            icon: AppIcons.calendar,
                            title: context.localization.calendar,
                            onTap: () {
                              index = 3;
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 3, isActive: true));
                            }),
                        BnbItem(
                          index: 4,
                          icon: AppIcons.stats,
                          title: context.localization.stats,
                          onTap: () {
                            index = 4;
                            context
                                .read<BnbBloc>()
                                .add(IsActiveColor(index: 4, isActive: true));
                          },
                        ),
                      ],
                    ),
                    if (isLoading == false)
                      SizedBox(
                        height: bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: bannerAd),
                      ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }
}
