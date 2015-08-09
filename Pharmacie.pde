byte cellSize = 8;
byte topWidth = 16;
int currRow= topWidth;
boolean cells[][] = new boolean[topWidth*3][topWidth*3];

boolean rowReturn;

byte patternAmount =14;
byte currPattern=patternAmount;

void setup()
{
  
}
// Changes pattern when screen touch
void mousePressed()
{
  currPattern++;
}

void draw()
{
  background(111,111,255);
  
  // draw fps counter
  fill(255);
  textSize(16);
  text("Frame rate: " + int(frameRate),10,20);
  
  // Set the pattern to be drawn
  if(currPattern > patternAmount)
  {
    currPattern = 0;
  }
  
  switch(currPattern)
  {
  case 0:
    greenCross();
    break;
    
  case 1:
    greenLine();
    break;
    
  case 2:
    blackLine();
    break;
  
  case 3:
    flashing();
    break;
    
  case 4:
    fillDefill();
    break;
    
  case 5:
    dPad();
    break;
    
  case 6:
    scalingCross();
    break;
    
  case 7:
    crossFlashes();
    break;
    
  case 8:
    sinCross();
    break;
    
  case 9:
    edgePad();
    break;
    
  case 10:
    randomNoise();
    break;
    
  case 11: 
    circleTest();
    break;
    
  case 12:
    ringZoom();
    break;
    
  case 13:
    circleBorder();
    break;
    
  case 14:
    ringBorder();
    break;
  }
  
  
  
  
  DrawCross(width/5,height/4);
}

// Draws a cross based on the pattern decided in cells with a black border
void DrawCross(float x, float y)
{
  fill(0);
  rect(x+topWidth*cellSize*2-25,y-25,
  topWidth*cellSize*2+50,topWidth*cellSize*6+50);
  
  rect(x-25,y+topWidth*cellSize*2-25,
  topWidth*cellSize*6+50,topWidth*cellSize*2+50);
  
  
  fill(0,255,0);
  
  for(int i=topWidth; i< topWidth*2;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      if(cells[i][j])
      {
        rect(i*cellSize*2+x,
        j*cellSize*2+y,cellSize,cellSize);
      }
      if(cells[j][i]  && j/2%topWidth*2<topWidth
      )
      {
        rect(j*cellSize*2+x,
        i*cellSize*2+y,cellSize,cellSize);
      }
    }
  }
}