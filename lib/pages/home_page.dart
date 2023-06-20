import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kurir_sbw/common/assets.dart';
import 'package:kurir_sbw/common/constant.dart';
import 'package:kurir_sbw/pages/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isActive = true;
  bool reject = false;

  GoogleMapController? mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng center = const LatLng(-7.2580729, 112.7442639);

  void toggleStatus() {
    setState(() {
      isActive = !isActive;
    });
  }

  void toggleReject() {
    setState(() {
      reject = !reject;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isActive ? kGreen : Colors.red;

    void openBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.70,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 1.5,
                            width: 100,
                            color: kLightGrey,
                            margin: const EdgeInsets.only(bottom: 4),
                          ),
                          Container(
                            height: 1.5,
                            width: 100,
                            color: kLightGrey,
                            margin: const EdgeInsets.only(bottom: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kLightBlue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order',
                            style: blackTextStyle.copyWith(fontWeight: bold),
                          ),
                          Text(
                            'Antar Barang',
                            style: blackTextStyle.copyWith(fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(markerGreen),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alamat Pengambilan',
                                style: blackTextStyle.copyWith(
                                    fontWeight: semiBold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Jl. Jemur Andayani No.55, Jemur Wonosari, Kec. Wonocolo, Kota SBY, Jawa Timur 60237',
                                style: blackTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(markerYellow),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alamat Pengiriman',
                                style: blackTextStyle.copyWith(
                                    fontWeight: semiBold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Jl. Smea, Wonokromo, Kec. Wonokromo, Kota SBY, Jawa Timur 60243',
                                style: blackTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumlah Dus',
                          style: blackTextStyle.copyWith(fontWeight: medium),
                        ),
                        Text(
                          '2 Dus',
                          style: blackTextStyle.copyWith(fontWeight: bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: kLightGrey,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: kPaleYellow,
                        border: Border.all(color: kLightGrey),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pembayaran: Transfer',
                                style:
                                    blackTextStyle.copyWith(fontWeight: bold),
                              ),
                              Text(
                                'Harga',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jarak: 3.3 KM',
                                style:
                                    blackTextStyle.copyWith(fontWeight: bold),
                              ),
                              Text(
                                'Rp 8.000',
                                style: blackTextStyle.copyWith(
                                    fontWeight: bold, fontSize: 18),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jumlah',
                                style:
                                    blackTextStyle.copyWith(fontWeight: bold),
                              ),
                              Text(
                                '2 Dus',
                                style:
                                    blackTextStyle.copyWith(fontWeight: bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    reject == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OrderPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kGreen,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Terima',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ElevatedButton(
                                onPressed: toggleReject,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 8),
                                  backgroundColor: const Color(0XFFEAD485),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Tolak (5)',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: toggleReject,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 8),
                                backgroundColor: kRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Pengajuan Pembatalan (10)',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            openBottomSheet(context);
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        title: Text(
          'Kurir',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ElevatedButton(
              onPressed: toggleStatus,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                isActive ? 'AKTIF' : 'NON-AKTIF',
                style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 11.5,
            ),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                lightPanic,
                width: 49,
                height: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
