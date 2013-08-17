XMLElement xml;
ArrayList<Movie> circles;
ArrayList<GenreButton> buttons;
PFont calibri;
Boolean[] globalGenre = {true,true,true,true,true};


void setup() {
  size(4000, 1000);
  background(230, 230, 230);
  smooth();
  circles = new ArrayList<Movie>();
  buttons = new ArrayList<GenreButton>();
  calibri = createFont("Myriad Pro");
  
  // Load XMLElement
  xml = new XMLElement(this, "movies.xml");
  XMLElement[] movies = xml.getChildren();
  
  //println(xml);
  
  //----- MOVIES XML LOAD
  for (int i = 0; i < movies.length; i++) {
    //println(movies[i]);
    
    // Get XMLElement elements and store them as variables
    XMLElement a0 = movies[i].getChild("title");
    String title = a0.getContent();
    //println("** " + title);
    
    XMLElement a1 = movies[i].getChild("prodYear");
    int prodYear = int(a1.getContent());
    //println("prodYear: " + prodYear);
    
    XMLElement a2 = movies[i].getChild("boxOffice");
    int boxOffice = int(a2.getContent())/2;
    //println("boxOffice: " + boxOffice);
    
    XMLElement a3 = movies[i].getChild("budget");
    int budget = int(a3.getContent())/2;
    //println("budget: " + budget);
    
    XMLElement a4 = movies[i].getChild("userRating");
    float userRating = 1850 - (float(a4.getContent()) * 200);
    //println("userRating: " + userRating);
    
    XMLElement a5 = movies[i].getChild("rating");
    String rating = a5.getContent();
    //println("rating: " + rating);
    
    XMLElement a6 = movies[i].getChild("genre");
    String genre = a6.getContent();
    //println("genre: " + genre);
    
    //XMLElement a7 = movies[i].getChild("website");
    //String website = a7.getContent();
    //println("web: " + web);
    
    // Create movie objects and add to circles array
    Movie m = new Movie(prodYear, userRating, boxOffice, genre, title, budget, rating);
    circles.add(m);
  }
}
  
void draw() {
  fill(230, 230, 230);
  rect(0, 0, width, height);
  
  //----- VERTICAL LINES
  stroke(255);
  strokeWeight(1);
  for (int i = 0; i < width; i+=100) {
    line(i, 0, i, 1000);
  }
  
  // Horizontal lines
  /*stroke(255);
  strokeWeight(1);
  for (int i = 0; i < height; i+=100) {
    line(0, i, 4000, i);
  }*/
  
  //----- HEADING
  textFont(calibri);
  textSize(50);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(125, 50);
  rect(width * 0.5 - 473, height * 0.8 - 28, 950, 60);
  fill(102, 102, 102);
  rect(width * 0.5 - 475, height * 0.8 - 30, 950, 60);
  fill(255);
  text("ALL-TIME WORLDWIDE BOX OFFICE FIGURES", width / 2, height * 0.8);
  
  //----- GENRES
  textFont(calibri);
  textSize(24);
  textAlign(CENTER, CENTER);
  noStroke();
  
  fill(125, 50);
  rect(width * 0.2 - 123, height * 0.9 - 13, 250, 30);
  fill(102, 194, 165);
  rect(width * 0.2 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("DRAMA", width * 0.2, height * 0.9);
  
  fill(125, 50);
  rect(width * 0.3 - 123, height * 0.9 - 13, 250, 30);
  fill(252, 141, 98);
  rect(width * 0.3 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("THRILLER", width * 0.3, height * 0.9);
  
  fill(125, 50);
  rect(width * 0.4 - 123, height * 0.9 - 13, 250, 30);
  //use btnAAlpha to change opacity
  fill(141, 160, 203);
  rect(width * 0.4 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("ACTION & ADVENTURE", width * 0.4, height * 0.9);
   
  fill(125, 50);
  rect(width * 0.5 - 123, height * 0.9 - 13, 250, 30);
  fill(238, 138, 195);
  rect(width * 0.5 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("KIDS & FAMILY", width * 0.5, height * 0.9);
   
  fill(125, 50);
  rect(width * 0.6 - 123, height * 0.9 - 13, 250, 30);
  fill(166, 216, 84);
  rect(width * 0.6 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("SCI-FI & FANTASY", width * 0.6, height * 0.9);
  
  fill(125, 50);
  rect(width * 0.7 - 123, height * 0.9 - 13, 250, 30);
  fill(255, 217, 47);
  rect(width * 0.7 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("MUSICAL & COMEDY", width * 0.7, height * 0.9); 
  
  fill(125, 50);
  rect(width * 0.8 - 123, height * 0.9 - 13, 250, 30);
  fill(229, 196, 148);
  rect(width * 0.8 - 125, height * 0.9 - 15, 250, 30);
  fill(255);
  text("HORROR", width * 0.8, height * 0.9);
  
  //----- RATINGS
  fill(125, 50);
  rect(width * 0.425 - 35.5, height * 0.95 - 13, 75, 30);
  fill(175);
  rect(width * 0.425 - 37.5, height * 0.95 - 15, 75, 30);
  fill(255);
  text("G", width * 0.425, height * 0.95);
  
  fill(125, 50);
  rect(width * 0.475 - 35.5, height * 0.95 - 13, 75, 30);
  fill(150);
  rect(width * 0.475 - 37.5, height * 0.95 - 15, 75, 30);
  fill(255);
  text("PG", width * 0.475, height * 0.95);
  
  fill(125, 50);
  rect(width * 0.525 - 35.5, height * 0.95 - 13, 75, 30);
  fill(100);
  rect(width * 0.525 - 37.5, height * 0.95 - 15, 75, 30);
  fill(255);
  text("PG-13", width * 0.525, height * 0.95);
  
  fill(125, 50);
  rect(width * 0.575 - 35.5, height * 0.95 - 13, 75, 30);
  fill(75);
  rect(width * 0.575 - 37.5, height * 0.95 - 15, 75, 30);
  fill(255);
  text("R", width * 0.575, height * 0.95);
  
  //----- YEARS
  textFont(calibri);
  textSize(18);
  fill(102, 102, 102);
  
  text("1976", 100, 10);
  text("1977", 200, 10);
  text("1978", 300, 10);
  text("1979", 400, 10);
  text("1980", 500, 10);
  text("1981", 600, 10);
  text("1982", 700, 10);
  text("1983", 800, 10);
  text("1984", 900, 10);
  text("1985", 1000, 10);
  text("1986", 1100, 10);
  text("1987", 1200, 10);
  text("1988", 1300, 10);
  text("1989", 1400, 10);
  text("1990", 1500, 10);
  text("1991", 1600, 10);
  text("1992", 1700, 10);
  text("1993", 1800, 10);
  text("1994", 1900, 10);
  text("1995", 2000, 10);
  text("1996", 2100, 10);
  text("1997", 2200, 10);
  text("1998", 2300, 10);
  text("1999", 2400, 10);
  text("2000", 2500, 10);
  text("2001", 2600, 10);
  text("2002", 2700, 10);
  text("2003", 2800, 10);
  text("2004", 2900, 10);
  text("2005", 3000, 10);
  text("2006", 3100, 10);
  text("2007", 3200, 10);
  text("2008", 3300, 10);
  text("2009", 3400, 10);
  text("2010", 3500, 10);
  text("2011", 3600, 10);
  text("2012", 3700, 10);
  text("2013", 3800, 10);
  text("2014", 3900, 10);
  text("1976", 100, height - 10);
  text("1977", 200, height - 10);
  text("1978", 300, height - 10);
  text("1979", 400, height - 10);
  text("1980", 500, height - 10);
  text("1981", 600, height - 10);
  text("1982", 700, height - 10);
  text("1983", 800, height - 10);
  text("1984", 900, height - 10);
  text("1985", 1000, height - 10);
  text("1986", 1100, height - 10);
  text("1987", 1200, height - 10);
  text("1988", 1300, height - 10);
  text("1989", 1400, height - 10);
  text("1990", 1500, height - 10);
  text("1991", 1600, height - 10);
  text("1992", 1700, height - 10);
  text("1993", 1800, height - 10);
  text("1994", 1900, height - 10);
  text("1995", 2000, height - 10);
  text("1996", 2100, height - 10);
  text("1997", 2200, height - 10);
  text("1998", 2300, height - 10);
  text("1999", 2400, height - 10);
  text("2000", 2500, height - 10);
  text("2001", 2600, height - 10);
  text("2002", 2700, height - 10);
  text("2003", 2800, height - 10);
  text("2004", 2900, height - 10);
  text("2005", 3000, height - 10);
  text("2006", 3100, height - 10);
  text("2007", 3200, height - 10);
  text("2008", 3300, height - 10);
  text("2009", 3400, height - 10);
  text("2010", 3500, height - 10);
  text("2011", 3600, height - 10);
  text("2012", 3700, height - 10);
  text("2013", 3800, height - 10);
  text("2014", 3900, height - 10);
  
  //----- MOVIE CONNECTIONS
  /*stroke(200, 200, 200);
  strokeWeight(2);
    // Harry Potter
  line(2600, (1850 - 7.2 * 200), 2700, (1850 - 7.2 * 200));
  line(2700, (1850 - 7.2 * 200), 2900, (1850 - 7.7 * 200));
  line(2900, (1850 - 7.7 * 200), 3000, (1850 - 7.5 * 200));
  line(3000, (1850 - 7.5 * 200), 3200, (1850 - 7.3 * 200));
  line(3200, (1850 - 7.3 * 200), 3400, (1850 - 7.3 * 200));
  line(3400, (1850 - 7.3 * 200), 3500, (1850 - 7.6 * 200));
  line(3500, (1850 - 7.6 * 200), 3600, (1850 - 8.1 * 200));*/
    
  //----- CIRCLES
  textSize(14);
  for (int i = 0; i < circles.size(); i++) {
      circles.get(i).drawMovie();
  }
  
  //----- MOVIE ROLLOVER TEXT
   for(Movie a: circles) {
     if(mouseX > a.xPos - a.rad && mouseX < a.xPos + a.rad && mouseY > a.yPos - a.rad && mouseY < a.yPos + a.rad){
        fill(102, 102, 102);
        textAlign(CENTER, CENTER);
        textSize(20);
        text(a.titleText, a.xPos, a.yPos - 17);
        textSize(14);
        text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
        text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
      } else {
      //  fill(0, 0);
      }
    }

//----- GENRE BUTTONS TEXT ON
  if(mousePressed == true) {
    for(Movie a: circles) {  
      if(mouseX > width * 0.2 - 125 && mouseX < width * 0.2 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Drama
          if(a.gen == "Drama") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }
        } 
        
        if(mouseX > width * 0.3 - 125 && mouseX < width * 0.3 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Thriller
          if(a.gen == "Thriller") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }  
        }
        
        if(mouseX > width * 0.4 - 125 && mouseX < width * 0.4 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Action
          if(a.gen == "Action") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }   
        }
        
        if(mouseX > width * 0.5 - 125 && mouseX < width * 0.5 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Kids
          if(a.gen == "Kids") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }  
        }
        
        if(mouseX > width * 0.6 - 125 && mouseX < width * 0.6 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Fantasy
          if(a.gen == "Fantasy") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }   
        }
        
        if(mouseX > width * 0.7 - 125 && mouseX < width * 0.7 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Comedy
          if(a.gen == "Comedy") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }   
        }
        
        if(mouseX > width * 0.8 - 125 && mouseX < width * 0.8 + 125 && mouseY > height * 0.9 - 15 && mouseY < height * 0.9 + 30) {
          // Horror
          if(a.gen == "Horror") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }   
        }
      }
    }
    
//----- RATINGS BUTTONS TEXT ON
  if(mousePressed == true) {
    for(Movie a: circles) {  
      if(mouseX > width * 0.425 - 125 && mouseX < width * 0.425 + 125 && mouseY > height * 0.95 - 15 && mouseY < height * 0.95 + 30) {
          // G
          if(a.rat == "G") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          } 
        } 
        
        if(mouseX > width * 0.475 - 125 && mouseX < width * 0.475 + 125 && mouseY > height * 0.95 - 15 && mouseY < height * 0.95 + 30) {
          // PG
          if(a.rat == "PG") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }  
        }
        
        if(mouseX > width * 0.525 - 125 && mouseX < width * 0.525 + 125 && mouseY > height * 0.95 - 15 && mouseY < height * 0.95 + 30) {
          // PG-13
          if(a.rat == "PG-13") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }   
        }
        
        if(mouseX > width * 0.575 - 125 && mouseX < width * 0.575 + 125 && mouseY > height * 0.95 - 15 && mouseY < height * 0.95 + 30) {
          // R
          if(a.rat == "R") {
            fill(102, 102, 102);
            textAlign(CENTER, CENTER);
            textSize(20);
            text(a.titleText, a.xPos, a.yPos - 17);
            textSize(14);
            text("Box Office: $" + a.rad * 2 * 10 + " million", a.xPos, a.yPos);
            text("Budget: $" + a.rad_ * 2 * 10 + " million", a.xPos, a.yPos + 15);
          }
        }
      }
    }
}
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

