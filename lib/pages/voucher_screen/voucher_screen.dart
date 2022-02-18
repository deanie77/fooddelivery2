import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery2/blocs/basket/basket_bloc.dart';
import 'package:fooddelivery2/blocs/voucher/voucher_bloc.dart';
import 'package:fooddelivery2/models/models.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = '/voucher-screen';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VoucherScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Voucher Screen',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter a Voucher Code',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Voucher Code',
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Your Vouchers',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            BlocBuilder<VoucherBloc, VoucherState>(
              builder: (context, state) {
                if (state is VoucherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is VoucherLoaded) {
                  return ListView.builder(
                    itemCount: state.vouchers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1x',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                state.vouchers[index].code,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<VoucherBloc>()
                                    .add(SelectVouchers(voucher: state.vouchers[index]));
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Apply',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('Something went wrong!');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
