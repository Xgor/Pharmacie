void greenCross()
{
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      
      setPoint(i,j,true);
     
    }
  }
}

void blackLine()
{
  if(rowReturn)
  {
    if( topWidth>= currRow)
    {
      rowReturn =false;
    }
    currRow--;
  }
  else
  {
    if(currRow>= topWidth*2)
    {
      rowReturn =true;
    }
    currRow++;
  }
  
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      if(currRow== i)
      {
        setPoint(i,j,true);
      }
      else
      {
        setPoint(i,j,false);
      }
    }
  }
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      if(currRow== j)
      {
        setPoint(i,j,true);
      }
    }
  }
}

void greenLine()
{
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      if(frameCount%(topWidth*3)== i)
      {
        setPoint(i,j,true);
      }
      else
      {
        setPoint(i,j,false);
      }
    }
  }
}

void flashing()
{
  boolean isOn = frameCount % 10 > 5;
  
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      setPoint(i,j,isOn);
    }
  }
}

boolean fillDefill()
{
  byte fillPerFrame=(byte)(topWidth);
  for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {      
      if(cells[0][0] != cells[j][i])
      {
        cells[j][i] = !cells[j][i];
        fillPerFrame--;
        if(fillPerFrame==0)
        {
          return true;
        }
      }
    }
  }
  cells[0][0] = !cells[0][0];
  
  return true;
}

void dPad()
{
  clearCross();
  for(int i=0; i< topWidth*1.5;i++)
  {
    for(int j=i; j< topWidth*3-i;j++)
    {      
      switch((frameCount/5)%4)
      {
      case 0: 
        setPoint(i,j,true);
        break;
      case 1:
        setPoint(j,i,true);
        break;
      case 2:
        setPoint(topWidth*3-i-1,j,true);
        break;
      case 3:
        setPoint(j,topWidth*3-i-1,true);
        break;
      }
    }
  }
  
}

void scalingCross()
{
  clearCross();
  createMiniCross(topWidth*1.5,topWidth*1.5,frameCount/2%topWidth*3+1,
  frameCount/2%topWidth+1
  );
} 

void crossFlashes()
{
  clearCross();
  for(int i=0; i< topWidth*1.5;i++)
  {
    for(int j=i; j< topWidth*3-i;j++)
    {      
      switch((frameCount/5)%5)
      {
      case 0: 
        createMiniCross(topWidth*1.5,topWidth*0.5,topWidth,topWidth/3);
        break;
      case 1:
        createMiniCross(topWidth*2.5,topWidth*1.5,topWidth,topWidth/3);
        break;
      case 2:
        createMiniCross(topWidth*1.5,topWidth*2.5,topWidth,topWidth/3);
        break;
      case 3:
        createMiniCross(topWidth*0.5,topWidth*1.5,topWidth,topWidth/3);
        break;
      case 4:
        createMiniCross(topWidth*1.5,topWidth*1.5,topWidth,topWidth/3);
        break;
      }
    }
  }
}


void randomNoise()
{
   for(int i=0; i< topWidth*3;i++)
  {
    for(int j=0; j< topWidth*3;j++)
    {
      setPoint(i,j,random(2)>1);
    }
  }
}


void sinCross()
{
  clearCross();
  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*3,
  (int)((sin(frameCount/5.0)*0.5+0.5)  *topWidth+1)
  );
} 

void zoomingCross()
{
  clearCross();
  createMiniCross(topWidth*1.5,topWidth*1.5,frameCount/2%topWidth*3+1,
  frameCount/2%topWidth+1
  );
  createMiniCross(topWidth*1.5,topWidth*1.5,frameCount/2%topWidth+topWidth,(frameCount/2%topWidth)/2+1,false);
 // if(frameCount/2%topWidth*3+1> topWidth*1.5)
 // {
    createMiniCross(topWidth*1.5, topWidth*1.5, frameCount/2%topWidth, (frameCount/2%topWidth)/3+1);
  // }
} 

void edgePad()
{
  dPad();
  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*2,topWidth/2,frameCount % 12 > 6);
  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*2-2,topWidth/2-2,!(frameCount % 12 > 6));
}

void circleTest()
{
  clearCross();
  createCircle(topWidth*1.5,topWidth*1.5,(frameCount/20.0)%topWidth*2+1);
  if((frameCount/5.0+topWidth*3)%topWidth*2+1>topWidth+1)
  {
 //   createCircle(topWidth*1.5,topWidth*1.5,
  //  (frameCount/5.0)%topWidth+1
 //   5.0
 //   ,false);
  }
}

void circleBorder()
{
  clearCross();
  createCircle(topWidth*1.5,topWidth*1.5,(frameCount/2.0)%topWidth*2+1);
  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*2,topWidth/2,frameCount %10>5);
  
}

void ringZoom()
{
  clearCross();
  createCircle(topWidth*1.5,topWidth*1.5,((frameCount*1.0)%topWidth*2)+topWidth*1.5,true);
  createCircle(topWidth*1.5,topWidth*1.5,((frameCount*1.0)%topWidth*2)+topWidth,false);
  createCircle(topWidth*1.5,topWidth*1.5,((frameCount*1.0)%topWidth)+topWidth*0.5,true);
  createCircle(topWidth*1.5,topWidth*1.5,(frameCount*1.0)%topWidth,false);
  
//  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*2,topWidth/2,frameCount %10>5);
  
}

void ringBorder()
{
  ringZoom();
  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*2,topWidth/2,true);
  createMiniCross(topWidth*1.5,topWidth*1.5,topWidth*2-2,topWidth/2-2,false);
}

