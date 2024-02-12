import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_seat/movie_seat_bloc.dart';
import 'package:shipsy_assignment/blocs/my_tickets/my_tickets_bloc.dart';
import 'package:shipsy_assignment/models/movie_locations_model/show.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';
import 'package:shipsy_assignment/screens/seats_selection_screen/conponents/seat_screen_section.dart';
import 'package:shipsy_assignment/screens/seats_selection_screen/conponents/seats_selection_section.dart';
import 'package:shipsy_assignment/screens/ticket_detail_screen/ticket_detail_screen.dart';
import 'package:shipsy_assignment/utils/app_error.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({
    super.key,
    required this.name,
    required this.movieImage,
    required this.cityName,
    required this.showData,
    required this.movieId,
  });

  final String name;
  final String movieImage;
  final String? cityName;
  final Show? showData;
  final int movieId;

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  double totalTicketPrice = 0;
  List<String> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getSeats();
    });
  }

  Future<void> getSeats() async {
    try {
      final movieLocation = context.read<MovieSeatBloc>();
      movieLocation.add(
        FetchMovieSeatEvent(
          locationName: widget.name,
          movieId: widget.movieId,
        ),
      );
    } catch (e, s) {
      reportError.handleAppError(e, s);
    }
  }

  Widget bodytype() {
    final movieLocation = context.watch<MovieSeatBloc>();
    switch (movieLocation.state.runtimeType) {
      case (MovieSeatFetchedState):
        {
          return successWidget();
        }
      case (MovieSeatErrorState):
        {
          return const Center(
            child: Text("Oops! Something went wrong"),
          );
        }
      case (MovieSeatLoadingState):
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      default:
        return Container();
    }
  }

  Widget successWidget() {
    return ListView(
      children: [
        const SeatScreenSection(),
        const SizedBox(height: 10),
        SeatsSelectionSection(
          selectedSeats: selectedSeats,
          setPrice: (price) {
            setState(() {
              totalTicketPrice = totalTicketPrice + price;
            });
          },
        )
      ],
    );
  }

  void bottomNavOnTap() {
    final ticketBloc = context.read<MyTicketsBloc>();
    final ticket = Ticket(
      movieId: widget.movieId,
      movieImage: widget.movieImage,
      ticketId: Random().nextInt(100),
      movieName: widget.name,
      mallName: "${widget.showData?.mallName}, ${widget.cityName} ",
      date: widget.showData?.date,
      time: widget.showData?.time,
      totalPrice: totalTicketPrice,
      seatNames: selectedSeats,
    );

    ticketBloc.add(
      AddTicketEvent(ticket: ticket),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => TicketDetailScreen(ticket: ticket),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: bodytype(),
      bottomNavigationBar: totalTicketPrice > 0
          ? InkWell(
              onTap: bottomNavOnTap,
              child: Container(
                height: 65,
                color: context.constantUi.primaryColor,
                child: Center(
                  child: Text(
                    "Book Ticket ($totalTicketPrice)",
                    style: context.constantUi.headingTextStyle1Fun(
                      context.constantUi.whiteColor,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
