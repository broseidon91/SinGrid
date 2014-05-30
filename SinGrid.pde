


float across = 50;
float down = 50;
float total = across * down;
float hsp = 20;
float vsp = 20;
float degreeInc = 360 / total;
float numberOfOscillations = 29;
//float bx = (width - (hsp * across)) / 2;
//float by = (height - (vsp * down)) / 2;
float increment = 5;
float minScale = 3;
float maxScale = 54;
float minBrt = 1;
float maxBrt = 255;
float row = 0;
float column = 0;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup()
{
  size(1200,800, P2D);
  
  createBalls();
  
  
  
}

void draw()
{
  background(0);
  
  for (int i = 0; i < balls.size(); i++)
  {
    balls.get(i).draw();
    balls.get(i).undulate();
  }
  
}

void createBalls()
{
  row = 0;
  column = 0;
  for (int i = 0; i < total; i++)
  {
    Ball ball = new Ball();
    ball.x = 100 + column * vsp;
    ball.y = 100 + row * vsp;
    float offset = Math.abs(total / 2 - i);
    ball.increment = increment;
    ball.minScale = minScale;
    ball.maxScale = maxScale;
    ball.variance = ball.maxScale - ball.minScale;
    ball.minBrt = minBrt;
    ball.maxBrt = maxBrt;
    ball.colorVariance = ball.maxBrt - ball.minBrt;
    ball.degree = i * degreeInc * numberOfOscillations;
    balls.add(ball);
    column++;
    if (column == across)
    {
       column = 0;
       row++; 
    }
  }
  
}

void destroyBalls()
{
  balls = new ArrayList<Ball>();
}
void keyPressed()
{
  numberOfOscillations++;
  destroyBalls();
  createBalls();
  println(numberOfOscillations);
}



