class Ball
{
  float x = 10;
  float y = 10;
  float hsbColor = 0;
  float hsbSat = 100;
  float hsbBright = 255;
  float increment = 1;
  float minScale = 1;
  float maxScale = 10;
  float variance = 9;
  float minBrt = 0;
  float maxBrt = 10;
  float colorVariance = 10;
  float degree = 1;
  float scaleX = 1;
  float scaleY = 1;
  
  Ball()
  {
     
  } 
  
  
  void draw()
  {
    colorMode(HSB);
    noStroke();
    fill(hsbColor, hsbSat, hsbBright);
    //scale(scaleX/10, scaleY/10);
    ellipse(x, y, scaleX, scaleY);
    //rect(x - scaleX  / 2,y - scaleY / 2, scaleX, scaleY);
    
  }
  
  
  void undulate()
  {
    degree += increment;
    float sinVal = (float)Math.sin(degree * Math.PI / 180);
    scaleX = minScale + (variance * 0.5f) + (variance * 0.5f) * sinVal;
    scaleY = scaleX;
    float brightness = minBrt + (0.5f * colorVariance) + (0.5f * colorVariance) * sinVal;
    //hsbBright = brightness;
    hsbColor = brightness ;
    
  }
  
  
}
