import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/widgets/navbar.dart';
import '../../shared/widgets/footer.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = GetIt.I<AuthBloc>();
    return Scaffold(
      appBar: Navbar(title: title, onLogout: authBloc.logout),
      body: body,
      bottomNavigationBar: Footer(),
    );
  }
}