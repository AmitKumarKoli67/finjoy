import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/services/api_service.dart';
import 'data/models/transaction_model.dart';
import 'data/repositories/transaction_repository.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/repositories/auth_repository.dart';
import 'features/splash/screens/splash_screen.dart';
import 'features/transactions/cubit/transaction_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>('transactions');
  runApp(const FinjoyApp());
}

class FinjoyApp extends StatelessWidget {
  const FinjoyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthRepository(apiService))),
        BlocProvider(create: (_) => TransactionCubit(TransactionRepository())),
      ],
      child: MaterialApp(
        title: 'Finjoy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const SplashScreen(),
      ),
    );
  }
}
