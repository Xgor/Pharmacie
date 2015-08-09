
void clearCross()
{
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {      
      cells[i][j] = false;
      
    }
  }
}

// UNFINISHED
void createRect(float x,float y, int rectWidth,int rectHeight)
{
  
}


void createMiniCross(float x,float y, int size,int weight)
{
  createMiniCross(x,y,size,weight,true);
} 
void createMiniCross(float x,float y, int size,int weight,boolean colored)
{
  for(int i=(int)x-size/2 ;x+size/2 > i;i++)
  {
    for(int j=(int)y-weight/2; y+weight*0.5> j;j++)
    {
      setPoint(i,j,colored);
    }
  }
  
  for(int i=(int)y-size/2 ;y+size/2 > i;i++)
  {
    for(int j=(int)x-weight/2; x+weight*0.5> j;j++)
    {
      setPoint(j,i,colored);
    }
  }
} 

// sets a point in the grid. has failsafe
void setPoint(int x, int y, boolean colored)
{
  if(isInsideBounds(x,y))
  {
    cells[x][y] = colored;
  }
}



boolean isInsideBounds(int x, int y)
{
  return (x>=0 && y>=0 && x<topWidth*3 && y<topWidth*3);
}

void createCircle(float x, float y,float radius)
{
  createCircle(x,y,radius,true);
}


void createCircle(float x, float y,float radius, boolean colored)
{
  byte xWidth = (byte)radius;
  
  for(byte i = 0; i < radius;i++)
  {
    for(byte j = xWidth; j >= 0; j--)
    {
      if(i*i+j*j<radius*radius)
      {
        break;
      }
      else
      {
        xWidth--;
      }
    }
    
    for(byte j = xWidth; j >= 0; j--)
    {
      setPoint((int)x-i,(int)y-j,colored);
      setPoint((int)x-i,(int)y+j,colored);
      setPoint((int)x+i,(int)y+j,colored);
      setPoint((int)x+i,(int)y-j,colored);
    }
    
  }
}

// Pharmacie
void setText()
{
  clearCross();
  
}

