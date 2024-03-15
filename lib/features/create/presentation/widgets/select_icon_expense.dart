import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';

class IconTabBar extends StatelessWidget {
  const IconTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 40,
        mainAxisSpacing: 34.0,
        crossAxisSpacing: 30.0,
      ),
      padding: const EdgeInsets.all(50.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<ExpenseBloc>().add(
              SelectIcon(icon: items[index]),
            );
            print(items[index]);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: context.colors.colorContainerEleventh,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Center(child: SvgPicture.network(items[index])),
            ],
          ),
        );
      },
    );
  }
}

List<String> items = [
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fbx_restaurant.svg?alt=media&token=81ea903e-dbba-4b22-95c8-d479e7e0b43d',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ffluent-mdl2_health-solid.svg?alt=media&token=9f973ada-b858-41c4-b6dd-86eb925c8afb',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fshopping.svg?alt=media&token=6515635e-a2d6-407a-a01d-9949e7a44fe3',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ffa6-solid_gifts.svg?alt=media&token=95a90429-8de9-479d-b41f-2b81e5305b15',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmaterial-symbols_transportation.svg?alt=media&token=a91c2d3d-311e-49ef-96fd-8633ba31c3f1',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmdi_car-wrench.svg?alt=media&token=c25acd70-cedd-4699-b771-432fe2d51fef',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmdi_art.svg?alt=media&token=7f36ee7e-3d63-4e24-b6ce-e7ab69a15f73',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmdi_food-drumstick.svg?alt=media&token=ade78b9e-5470-4efd-bfaa-a1869ce3e275',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fion_game-controller.svg?alt=media&token=8a364e0a-45cf-4b53-91be-d12414e5222b',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fri_headphone-fill.svg?alt=media&token=5058ddea-215d-4cab-b4d6-d8d49dc26952',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ffluent_sport-basketball-20-filled.svg?alt=media&token=ebb63dbb-230b-41df-aa88-654f9ee8e220',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmaterial-symbols_phone-android.svg?alt=media&token=382e0492-0abb-405e-b1d9-f4fe159ce3c7',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fph_cat-fill.svg?alt=media&token=2f703e02-4577-47d2-9b82-255b051a1806',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fic_round-fastfood.svg?alt=media&token=8f754c3e-f747-475a-8374-e597370467f0',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Femojione-monotone_nail-polish.svg?alt=media&token=6c719411-63ff-4444-bf16-eb7bb684d79a',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fic_round-shopping-cart.svg?alt=media&token=1377fb70-f67e-4488-98e7-0af12f5ba77e',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fbxs_plane-alt.svg?alt=media&token=647a73c7-d738-4bbd-8f16-ac34d1361f47',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmdi_sunglasses.svg?alt=media&token=0c84c8fe-7246-4eba-9a3a-c8365816fd21',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmap_gym.svg?alt=media&token=0b4bd799-ba28-457c-ab40-06694d5d2a19',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ffa-solid_baby.svg?alt=media&token=fc03c807-9bed-47ed-9db4-25d2fd7dd8f4',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fic_round-shopping-cart.svg?alt=media&token=1377fb70-f67e-4488-98e7-0af12f5ba77e',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ffa6-solid_graduation-cap.svg?alt=media&token=8cf3258b-0b4c-4efa-980c-3a1fdb71aec0',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fion_umbrella.svg?alt=media&token=a65286ce-dbe3-4c1e-95f9-13aa8f79aad0',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmap_clothing-store.svg?alt=media&token=61f38a8d-7e1f-4732-8bc3-4f61b65c3b97',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fmdi_dog.svg?alt=media&token=a40ea4cd-3527-40dd-97b9-8ed01f099f60',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ficon-park_translate.svg?alt=media&token=a4392387-6676-4dea-bb7c-22da7197a98a',
  'https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Fgiftbox.svg?alt=media&token=740045e7-087b-4563-b4c0-613b5bc65d8c',
];
