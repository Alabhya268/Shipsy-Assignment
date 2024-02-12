import 'package:hive/hive.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';

part 'my_tickets_hive_model.g.dart';

@HiveType(typeId: 0)
class MyTicketsHiveModel extends HiveObject {
  @HiveField(0)
  List<Ticket> myTickets;

  MyTicketsHiveModel({required this.myTickets});
}
