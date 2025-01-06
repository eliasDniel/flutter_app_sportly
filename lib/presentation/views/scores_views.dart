import 'package:flutter/material.dart';

class ScoresViews extends StatelessWidget {
  static const name = 'ScoresScreen';
  const ScoresViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: const Text(
          'Scores',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildOvalItem(Icons.event, "Top Events"),
                _buildOvalItem(Icons.sports_baseball, "MLB"),
                _buildOvalItem(Icons.sports_soccer, "Champ. League"),
                _buildOvalItem(Icons.sports_basketball, "NBA"),
                _buildOvalItem(Icons.sports_tennis, "Tennis"),
                _buildOvalItem(Icons.sports_football, "NFL"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Liga: Champions League",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildMatchItem(
                  "Champions League",
                  "Independiente Del Valle",
                  "Liga De Quito",
                  "5",
                  "5",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Thu, 10/03 9:30 AM",
                ),
                const SizedBox(height: 15),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Liga: Premier League",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildMatchItem(
                  "Premier League",
                  "Manchester United",
                  "Chelsea",
                  "3",
                  "2",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sat, 10/04 5:00 PM",
                ),
                const SizedBox(height: 15),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Liga: NBA",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildMatchItem(
                  "NBA",
                  "LA Lakers",
                  "Golden State Warriors",
                  "101",
                  "98",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sun, 10/05 7:30 PM",
                ),
                _buildMatchItem(
                  "NBA",
                  "LA Lakers",
                  "Golden State Warriors",
                  "101",
                  "98",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sun, 10/05 7:30 PM",
                ),
                _buildMatchItem(
                  "NBA",
                  "LA Lakers",
                  "Golden State Warriors",
                  "101",
                  "98",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sun, 10/05 7:30 PM",
                ),
                _buildMatchItem(
                  "NBA",
                  "LA Lakers",
                  "Golden State Warriors",
                  "101",
                  "98",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sun, 10/05 7:30 PM",
                ),
                _buildMatchItem(
                  "NBA",
                  "LA Lakers",
                  "Golden State Warriors",
                  "101",
                  "98",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sun, 10/05 7:30 PM",
                ),
                _buildMatchItem(
                  "NBA",
                  "LA Lakers",
                  "Golden State Warriors",
                  "101",
                  "98",
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Qg_3ucpKBdjZIpga48sfIw_96x96.png',
                  'https://ssl.gstatic.com/onebox/media/sports/logos/Iuk3Emwfmii37cXTu4qJEQ_96x96.png',
                  "Sun, 10/05 7:30 PM",
                ),

              
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir un ítem de partido

_buildMatchItem(
  String league,
  String team1,
  String team2,
  String score1,
  String score2,
  String image1,
  String image2,
  String dateTime,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          league,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Columna de equipos e imágenes
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        image1,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        team1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        score1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Image.network(
                        image2,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        team2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        score2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ],
    ),
  );
}



  // Método para construir un ítem de óvalo
  _buildOvalItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(64, 158, 158, 158),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
