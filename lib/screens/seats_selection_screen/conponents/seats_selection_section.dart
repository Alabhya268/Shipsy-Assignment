import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_seat/movie_seat_bloc.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class SeatsSelectionSection extends StatefulWidget {
  const SeatsSelectionSection({
    super.key,
    required this.setPrice,
    required this.selectedSeats,
  });

  final Function(double price) setPrice;
  final List<String> selectedSeats;

  @override
  State<SeatsSelectionSection> createState() => _SeatsSelectionSectionState();
}

class _SeatsSelectionSectionState extends State<SeatsSelectionSection> {
  @override
  Widget build(BuildContext context) {
    final seatBloc = context.watch<MovieSeatBloc>();
    final seats = seatBloc.state.seats;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: seats?.length,
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        final curSeat = seats?[index];
        final name = curSeat?.seatName;
        final seatPrice = curSeat?.seatPrice ?? 0;
        final iselected = widget.selectedSeats.contains(name);
        return InkWell(
          onTap: () {
            if (iselected) {
              widget.selectedSeats.remove(name);
              widget.setPrice(-seatPrice);
            } else {
              widget.selectedSeats.add(name ?? "");
              widget.setPrice(seatPrice);
            }
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: iselected
                  ? context.constantUi.primaryColor
                  : context.constantUi.blackLightColor,
            ),
            child: Center(
              child: Text(
                seats?[index].seatName ?? "",
                style: TextStyle(
                  color: iselected
                      ? context.constantUi.whiteColor
                      : context.constantUi.blackColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
