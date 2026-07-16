import 'package:finjoy/data/repositories/budget_repository.dart';
import 'package:finjoy/features/dashboard/cubit/budget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/api_service.dart';
import 'data/repositories/transaction_repository.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/repositories/auth_repository.dart';
import 'features/splash/screens/splash_screen.dart';
import 'features/transactions/cubit/transaction_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(
          create: (_) => TransactionCubit(TransactionRepository(apiService)),
        ),
        BlocProvider(create: (_) => BudgetCubit(BudgetRepository(apiService))),
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
