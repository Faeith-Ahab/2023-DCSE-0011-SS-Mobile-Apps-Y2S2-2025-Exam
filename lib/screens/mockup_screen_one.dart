
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:app/screens/mockup_screen_two.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({super.key});

  @override
  State<MockupScreenOne> createState() => _MockupScreenOneState();
}

class _MockupScreenOneState extends State<MockupScreenOne> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0;
  
  // Tab data for the categories
  final List<String> _tabs = ['Popular', 'Upcoming', 'Now Playing'];

  // Movie data
  final List<Map<String, dynamic>> _movies = [
    {
      'title': 'To All the Boys: P.S. I Still Love You',
      'duration': '2019 . 1h 35m',
      'genres': 'Romance, Comedy',
      'description': 'Lara Jean and Peter have just taken their romance from a lo...',
      'image': 'img10.jpeg',
    },
    {
      'title': 'Baby Driver',
      'duration': '2019 . 1h 53m',
      'genres': 'Car Action, Crime, Drama',
      'description': 'After being coerced into working for a crime boss, a yo...',
      'image': 'img2.jpeg',
    },
    {
      'title': 'John Wick',
      'duration': '2019 . 1h 41m',
      'genres': 'Action, Crime, Thriller',
      'description': 'John Wick is on the run after killing a member of the intern...',
      'image': 'img3.jpeg',
    },
    {
      'title': 'Exit',
      'duration': '2019 . 1h 43m',
      'genres': 'Cartoon',
      'description': 'A thrilling film...',
      'image': 'img4.jpg',
    },
  ];

  
  void _handleTabSelection(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    
   // Category:Popular navigates to mockup screen two
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MockupScreenTwo()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 61, 119),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'TMDB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),

            // Search bar container
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                  
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01, 
                      color: Colors.grey.shade600,
                      size: 20.0,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Find your movies',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Sort | Filters',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color:  Color.fromARGB(255, 53, 61, 119),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Discover & Enjoy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Your Favourite Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Category tabs
                Row(
                  children: List.generate(
                    _tabs.length,
                    (index) => GestureDetector(
                      onTap: () => _handleTabSelection(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == index
                              ? const Color.fromARGB(255, 66, 181, 227)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                _selectedTabIndex == index ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Movie list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 110,
                  child: Row(
                    children: [
                      // Movie poster
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/${movie['image']}',
                          width: 80,
                          height: 110,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 80,
                              height: 110,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.movie, color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Movie details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              movie['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 4),
                            Text(
                              movie['duration'],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 4),
                            Text(
                               movie['genres'],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            

                            const SizedBox(height: 4),
                            Text(
                              movie['description'],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 53, 61, 119),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.jost(),
      unselectedLabelStyle: GoogleFonts.jost(),
      items: [
        BottomNavigationBarItem(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedHome01,  
            color: selectedIndex == 0 ? const Color.fromARGB(255, 53, 61, 119) : Colors.grey,
            size: 22.0,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedFilm01,  
            color: selectedIndex == 1 ? const Color.fromARGB(255, 53, 61, 119) : Colors.grey,
            size: 24.0,
          ),
          label: 'Movies',
        ),

        BottomNavigationBarItem(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedBookmark01,  
            color: selectedIndex == 2 ? const Color.fromARGB(255, 53, 61, 119) : Colors.grey,
            size: 22.0,
          ),
          label: 'Bookmark',
        ),

        BottomNavigationBarItem(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedUser, 
            color: selectedIndex == 3 ? const Color.fromARGB(255, 53, 61, 119) : Colors.grey,
            size: 23.0,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}

