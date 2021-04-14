public class DataCircle{

  PVector loc;
  float size;
  float brightness;
  String country;
  float magnitude;
  double longitude;
  double latitude;
  String date;
  color c;
  boolean collision;
  
  public DataCircle(PVector p, float s,float m, double la, double lo, float b, String cou, String d, color col, boolean coll){
    loc = p;
    size = s;
    magnitude = m;
    brightness = b;
    latitude = la;
    longitude = lo;
    country = cou;
    date = d;
    c = col;
    collision = coll;
  }
  
  public void display(){
    if (collision == false){
      noStroke();
      fill(c);
      circle(loc.x, loc.y, size);
      
    }
    
    else {
      PVector p = new PVector (loc.x, loc.y);
      stroke(255,0,0);
      float newr = brightness + red(c);
      float newg = brightness + green(c);
      float newb = brightness + blue(c);
      
      newr = constrain(newr, 0, 255);
      newg = constrain(newg, 0, 255);
      newb = constrain(newb, 0, 255);
      
      color newc = color(newr, newg, newb);
      fill(newc);
      int newsizetemp = 200;
      
      if(loc.x - newsizetemp<-100)
        p.x = p.x + newsizetemp/2;
      
      if(loc.x + newsizetemp>width+100)
        p.x = p.x - newsizetemp/2;
       
      if(loc.y - newsizetemp <0)
        p.y = p.y + newsizetemp/2;
        
       if(loc.y + newsizetemp >height+100)
        p.y = p.y - newsizetemp/2;
        
       
        
      circle(p.x, p.y, newsizetemp);
      fill(0);
      //if(country.length() > 12)
      //  textSize(newsizetemp/12);
      //else if(country.length()>16)
      //  textSize(newsizetemp/16);
      //else if(country.length()>20)
      // textSize(newsizetemp/20);
      //else
      //  textSize(newsizetemp/8);
      
      if(newsizetemp/country.length() > 20)
        textSize(20);
       else
         textSize((newsizetemp/country.length())*1.25);
      textAlign(CENTER, CENTER);
      text(country, p.x-newsizetemp/10, p.y-newsizetemp/4);
      fill(0);
      textSize(newsizetemp/12);
      textAlign(CENTER, CENTER);
      text(str(magnitude), p.x-newsizetemp/5, p.y);
      text("(" + str((float)latitude) + ", " + str((float)latitude) + ")", p.x-newsizetemp/20, p.y-newsizetemp/8);
      
      
      
      
    }
  }
  
  void collision (int x, int y){
    float dis = dist(x,y,loc.x,loc.y);
    if(dis < size/2)
      collision = true;
     else
     collision = false;
  }
  
}
