import 'package:cleanmovie/contracts/general.dart';
import 'package:cleanmovie/features/home/presentation/cubit/movie/movie_cubit.dart';
import 'package:cleanmovie/features/home/presentation/cubit/movie/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_page';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, movieState) {
          if(movieState is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (movieState is MovieLoaded) {
            return GridView.count(
              crossAxisCount: 2,
              children: movieState.movies.results!.map((movie) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${General.NETWORK_IMAGE}${movie.posterPath}'
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            return const Text(
              'error'
            );
          }
        }
      ),
    );
  }
}
