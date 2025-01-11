import 'package:aflamy/core/app_widgets/loading_indicator.dart';
import 'package:aflamy/features/movies/presentation/components/trending_item.dart';
import '../../../../core/utils/enums.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({
    super.key,
  });
  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await _fetchPages(
            (context.read<MoviesBloc>().state.trendingResponse ?? []).length ~/
                    20 +
                1);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text("Trending"),
        centerTitle: true,
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if ((state.trendingResponse != null &&
              state.trendingResponse!.isNotEmpty)) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: state.trendingResponse!.length + 1,
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.7,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                if (state.trendingResponse!.length > index) {
                  return TrendingItem(
                    movie: state.trendingResponse![index],
                  );
                } else {
                  if (state.trendingRequestState == RequestState.loading) {
                    return const Center(child: LoadingIndicator());
                  } else {
                    return const SizedBox.shrink();
                  }
                }
              },
            );
          } else {
            return const Center(
              child: LoadingIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> _fetchPages(page) async {
    BlocProvider.of<MoviesBloc>(context).add(GetTrendingEvent(page: page));
  }
}
