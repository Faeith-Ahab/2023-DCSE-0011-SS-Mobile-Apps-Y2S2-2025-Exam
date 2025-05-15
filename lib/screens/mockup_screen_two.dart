import 'package:flutter/material.dart';

class MockupScreenTwo extends StatelessWidget {
  const MockupScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 53, 61, 119),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'TMDB',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Jumanji: The Next Level',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Action .Adventure .Comedy .Fantasy',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // What's Popular Section
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "What's Popular",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 240, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMovieCard(
                    'Birds of Prey',
                    'Action, Crime',
                    'assets/images/img8.png',
                  ),
                  const SizedBox(width: 12),
                  _buildMovieCard(
                    'Red Sparrow',
                    'Mystery, Thriller',
                    'assets/images/img9.jpg',
                  ),
                  const SizedBox(width: 12),
                  _buildMovieCard(
                    'Literally',
                    'Mystery',
                    'assets/images/img7.png',
                  ),
                ],
              ),
            ),

            // Now Playing Section
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 240, // Increased height to accommodate taller movie cards
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMovieCard(
                    'Sugar Rush',
                    'Action',
                    'assets/images/img4.jpg',
                  ),
                  const SizedBox(width: 12),
                  _buildMovieCard(
                    'Ford v Ferrari',
                    'Drama, Action',
                    'assets/images/img5.png',
                  ),
                  const SizedBox(width: 12),
                  _buildMovieCard(
                    'Barbie',
                    'Comedy',
                    'assets/images/img6.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // FIXED: Increased card size and adjusted text styling
  Widget _buildMovieCard(String title, String genres, String imageUrl) {
    return SizedBox(
      width: 140, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180, 
            width: 140,  
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imageUrl), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            genres,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14, 
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
