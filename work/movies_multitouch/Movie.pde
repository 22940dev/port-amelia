class Movie {
  int xPos;
  float yPos;
  int rad;
  String gen;
  color col;
  String titleText;
  int rad_;
  String rat;
  int op;
  PImage i;
  
  color t = color(102, 194, 165); // drama
  color o = color(252, 141, 98);  // thriller
  color b = color(141, 160, 203); // action  
  color p = color(238, 138, 195); // kids
  color g = color(166, 216, 84);  // fantasy
  color y = color(255, 217, 47);  // musical/comedy
  color m = color(229, 196, 148); // horror
  
  Movie(int prodYear, float userRating, int boxOffice, String genre, String title, int budget, String rating) {
    // Set inputs
    xPos = prodYear;
    yPos = userRating;
    rad = boxOffice;
    gen = genre;
    titleText = title;
    rad_ = budget;
    rat = rating;
    i = loadImage(title + ".jpg");
    
    // Determine color
    if (gen == "Action") {
      col = b;
    }
    
    if(gen == "Fantasy") {
      col = g;
    }
    
    if(gen == "Kids") {
      col = p;
    }
    
    if(gen == "Thriller") {
      col = o;
    }
    
    if(gen == "Drama") {
      col = t;
    }
    
    if(gen == "Horror") {
      col = m;
    }
    
    if(gen == "Comedy") {
      col = y;
    }
  }
  
  
  // Draw movie circles
  void drawMovie() {
    // Box office circle
      // Shadow
    noStroke();
    fill(125, 50);
    ellipse(xPos + 2, yPos + 2, rad * 2, rad * 2);
      // Movie
    noStroke();
    fill(col, 200);
    ellipse(xPos, yPos, rad * 2, rad * 2);
    
    // Budget circle
    noStroke();
    fill(255, 100);
    ellipse(xPos, yPos, rad_*2, rad_*2);
  }
  
  // Draw movie circles
  void drawMovieOff() {
    // Box office circle
      // Shadow
    noStroke();
    fill(125, 0);
    ellipse(xPos + 2, yPos + 2, rad * 2, rad * 2);
      // Movie
    noStroke();
    fill(col, 0);
    ellipse(xPos, yPos, rad * 2, rad * 2);
    
    // Budget circle
    noStroke();
    fill(255, 0);
    ellipse(xPos, yPos, rad_*2, rad_*2);
  }
}
