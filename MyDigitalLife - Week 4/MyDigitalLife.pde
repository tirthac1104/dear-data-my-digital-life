// My Digital Life - Week 4
// Each circle represents one time I used my phone.

Table firstData;
Table secondData;

void setup() {
  size(820, 470);

  firstData = loadTable("Observations Commit 2.csv", "header");
  secondData = loadTable("Observations Commit 3.csv", "header");
}

void draw() {
  background(250);

  fill(30);
  textSize(28);
  text("My Digital Life", 50, 55);

  int number = 0;

  // Draw the observations from the first CSV.
  if (firstData != null) {
    for (TableRow row : firstData.rows()) {
      drawSession(row, number);
      number++;
    }
  }

  // Then draw the observations from the second CSV.
  if (secondData != null) {
    for (TableRow row : secondData.rows()) {
      drawSession(row, number);
      number++;
    }
  }

  // Key for the colours and shapes.
  textSize(14);
  fill(160, 100, 210); text("Social", 50, 345);
  fill(60, 140, 220); text("Messaging", 145, 345);
  fill(240, 150, 50); text("Entertainment", 280, 345);
  fill(50, 175, 110); text("Work/Study", 470, 345);
  fill(150); text("Other", 640, 345);

  fill(40);
  text("Filled = intentional    Empty = unintentional    Bigger = longer use", 50, 385);
}

// Draw one observation from a CSV row.
void drawSession(TableRow row, int number) {
  String category = trim(row.getString("category"));
  float minutes = row.getFloat("duration_minutes");
  String intentional = trim(row.getString("intentional"));

  float x = 60 + (number % 10) * 76;
  float y = 130 + (number / 10) * 58;

  color c = color(150);  // Other = grey

  if (category.equals("Social")) {
    c = color(160, 100, 210);
  } else if (category.equals("Messaging")) {
    c = color(60, 140, 220);
  } else if (category.equals("Entertainment")) {
    c = color(240, 150, 50);
  } else if (category.equals("Work/Study")) {
    c = color(50, 175, 110);
  }

  stroke(c);
  strokeWeight(2);

  if (intentional.equals("Yes")) {
    fill(c);
  } else {
    noFill();
  }

  circle(x, y, circleSize(minutes));
  noStroke();
}

// A simple method that RETURNS a value.
float circleSize(float minutes) {
  return 10 + min(minutes, 60) / 3;
}
