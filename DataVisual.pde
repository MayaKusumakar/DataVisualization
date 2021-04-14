String [] data;
ArrayList<String> location;
ArrayList<Float> longitude;
ArrayList<Float> latitude;
ArrayList<String> month;
ArrayList<String> year;
ArrayList<String> day;
ArrayList<DataCircle> circles;
ArrayList<Float> magnitude;
int rightxPos;
int leftxPos;

int topyPos;
int bottomyPos;

void setup(){
  size(1100,1100);
  background(0);
  magnitude = new ArrayList<Float>();
  location = new ArrayList<String>();
  latitude = new ArrayList<Float>();
  longitude = new ArrayList<Float>();
  month = new ArrayList<String>();
  year = new ArrayList<String>();
  day = new ArrayList<String>();
  circles = new ArrayList<DataCircle>();
  rightxPos = -140;
  leftxPos=-180;
  topyPos = -90;
  bottomyPos = -70;
    
  data = loadStrings("Earthquakes.csv");
  try{
  for(int i = 1; i < data.length; i++){
    String line = data[i];
    String[] lineChopped = line.split(",");
    String line2 = lineChopped[2].replace("\"","");
    String line6 = lineChopped[6].replace("\"","");
    String line7 = lineChopped[7].replace("\"","");
    float dbl = Float.parseFloat(line2);
    float dbl6 = Float.parseFloat(line6);
    float dbl7 = Float.parseFloat(line7);
    
    location.add(lineChopped[8]);
    magnitude.add(dbl);
    latitude.add(dbl6);
    longitude.add(dbl7);
    month.add(lineChopped[14]);
    year.add(lineChopped[16]);
    day.add(lineChopped[9]);
  }
  for(int i = 0; i < magnitude.size(); i ++){
    float rgnd = map((float)magnitude.get(i),0, 5, 1, 30);
    //float locy = map((float)latitude.get(i),90, -90, 0, height);
    //float locx = map((float)longitude.get(i),-180, 180, 0, width);
    
    float locy = map((float)latitude.get(i),70, 0, 0, height);
    float locx = map((float)longitude.get(i),-180, -80, 0, width);
    color colo = color(320-(magnitude.get(i)*50),20,20);
    //color colo = color(400-(magnitude.get(i)*50),10,30);
    //color colo = color(400-(magnitude.get(i)*50),5,10);
    String date = month.get(i) + "/" + day.get(i) + "/" + year.get(i);
    PVector p = new PVector (locx, locy);
    circles.add(new DataCircle(p,  rgnd, magnitude.get(i), latitude.get(i), longitude.get(i), 150, location.get(i), date, colo, false));
  }
    
  
  for(String s : location)
    println(s);
    
  }
  catch(Exception Exception){
    println("Not parsing :(");
  }
  
  
  
  
  
}



void draw(){
  background(0);
 
  for(DataCircle d : circles){
    d.display();
    d.collision(mouseX, mouseY);
  }

}
void keyPressed(){
  if(key == CODED){
    
  if(keyCode == RIGHT){
      //rightxPos += 20;
      //leftxPos += 20;
      for(DataCircle d: circles){
        d.loc.x -= 20;
        d.display();
        d.collision(mouseX, mouseY);
      }
     }
     if(keyCode == LEFT){
      //rightxPos += 20;
      //leftxPos += 20;
      for(DataCircle d: circles){
        d.loc.x += 20;
        d.display();
        d.collision(mouseX, mouseY);
      }
     }
   if(keyCode == UP){
     for(DataCircle d : circles){
       d.loc.y += 20;
       d.display();
       d.collision(mouseX, mouseY);
     }
   }
   if(keyCode == DOWN){
     for(DataCircle d : circles){
       d.loc.y -= 20;
       d.display();
       d.collision(mouseX, mouseY);
     }
   }
   
   }
  }
