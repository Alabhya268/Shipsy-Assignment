import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';

part 'my_tickets_event.dart';
part 'my_tickets_state.dart';

class MyTicketsBloc extends Bloc<MyTicketsEvent, MyTicketsState> {
  MyTicketsBloc() : super(const MyTicketsState()) {
    on<FetchMyTicketEvent>((event, emit) {});
    on<AddTicketEvent>(
      (event, emit) {
        try {
          emit(state.copyWith(myTickets: [...state.myTickets, event.ticket]));
        } catch (e) {
          rethrow;
        }
      },
    );
  }
}
