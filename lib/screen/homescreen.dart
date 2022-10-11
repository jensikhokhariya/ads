import 'package:ads/utils/admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    bannerAds();
    InterstitialAds();
    RewardAds();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ads SDK"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              child: AdWidget(ad: bannerAd!),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (interstitialAd != null) {
                  interstitialAd!.show();
                  InterstitialAds();
                } else {
                  InterstitialAds();
                }
              },
              child: Text("InterAds"),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                if(rewardedAd != null){
                  rewardedAd!.show(onUserEarnedReward: (ad,reward){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${reward.amount}")));
                  });
                  RewardAds();
                }else{
                  RewardAds();
                }
              },
              child: Text("RewardAds"),
            ),
          ],
        ),
      ),
    );
  }
}
