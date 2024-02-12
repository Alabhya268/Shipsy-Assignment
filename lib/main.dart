import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shipsy_assignment/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_location/movie_location_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_seat/movie_seat_bloc.dart';
import 'package:shipsy_assignment/blocs/my_tickets/my_tickets_bloc.dart';
import 'package:shipsy_assignment/blocs/upcoming_movie/upcoming_movies_bloc.dart';
import 'package:shipsy_assignment/models/hive_data_models/my_tickets_hive_model.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';
import 'package:shipsy_assignment/screens/home_screen/home_screen.dart';
import 'package:shipsy_assignment/services/injection_container.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

late Box<MyTicketsHiveModel> boxTickets;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MyTicketsHiveModelAdapter());
  Hive.registerAdapter(TicketAdapter());
  boxTickets = await Hive.openBox<MyTicketsHiveModel>("myTickets");
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UpComingMoviesBloc()),
        BlocProvider(create: (context) => MovieDetailBloc()),
        BlocProvider(create: (context) => MovieLocationBloc()),
        BlocProvider(create: (context) => MovieSeatBloc()),
        BlocProvider(create: (context) => MyTicketsBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: context.constantUi.primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: context.constantUi.primaryColor,
            foregroundColor: context.constantUi.whiteColor,
            centerTitle: false,
            titleTextStyle: TextStyle(
              color: context.constantUi.whiteColor,
              fontSize: 20,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
