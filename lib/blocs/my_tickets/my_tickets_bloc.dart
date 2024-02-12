import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shipsy_assignment/main.dart';
import 'package:shipsy_assignment/models/hive_data_models/my_tickets_hive_model.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';

part 'my_tickets_event.dart';
part 'my_tickets_state.dart';

class MyTicketsBloc extends Bloc<MyTicketsEvent, MyTicketsState> {
  MyTicketsBloc() : super(const MyTicketsState()) {
    on<FetchMyTicketEvent>(fetchMyTicketEvent);
    on<AddTicketEvent>(addTicketEvent);
  }

  Future<void> addTicketEvent(event, emit) async {
    try {
      boxTickets.put(
        "ticketList",
        MyTicketsHiveModel(myTickets: [...state.myTickets, event.ticket]),
      );
      emit(state.copyWith(myTickets: [...state.myTickets, event.ticket]));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchMyTicketEvent(event, emit) async {
    final data = boxTickets.get("ticketList")?.myTickets ?? [];
    emit(state.copyWith(myTickets: [...data]));
  }
}
