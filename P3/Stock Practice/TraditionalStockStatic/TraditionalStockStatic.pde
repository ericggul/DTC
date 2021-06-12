
//Company Name
String company = "AMZN";

Table table; 
PFont font;
int i = 0;
int totalLength;
String dateText;
import java.util.Stack;
import java.util.List;


//Intialize String
String[] initialPriceListLow, initialPriceListHigh, initialDate;
float [] priceListLow, priceListHigh;
String[] date;

int maxValue;
int minValue;
int graphMax;
float valueMain[][] = new float [maxValue*2][]; 
Coordinate timeValue[][] = new Coordinate [totalLength][];

float[] initialColor ={220, 230, 230};
float[] finalColor = {200, 40, 60};
float[] colorStep = {0,0,0};
float dollarStep = 0;
float xAxisStep = 0;

float categoryAdjuster = 0;
float axisAdjuster = 0;

public void setup(){
  //Getting csv file name: QCOM.csv for example
  String csv = String.format("%s.csv", company);
  table = loadTable(csv, "header");
  
  smooth(2);
  
  //Font
  font = loadFont("HelveticaNeue-48.vlw");
  textFont (font, 20);
  
  //Data Retriving
  initialPriceListLow = table.getStringColumn("Low");
  initialPriceListHigh = table.getStringColumn("High");
  initialDate = table.getStringColumn("Date");

  totalLength = initialPriceListLow.length;
  
  priceListLow = new float [totalLength];
  priceListHigh = new float [totalLength];
  date = new String [totalLength];
  
  for(int i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[totalLength -1 - i].substring(1));
    priceListHigh[i] = parseFloat(initialPriceListHigh[totalLength- 1 - i].substring(1));
    
    if(priceListLow[i]>priceListHigh[i]){
      float dummyPrice = priceListLow[i];
      priceListLow[i] = priceListHigh[i];
      priceListHigh[i] = dummyPrice;
    }
    date[i] = initialDate[totalLength-1-i];
  }
  
  //MaxValue of All Time
  maxValue = ceil(reverse(sort(priceListHigh))[0]);
  minValue = floor(sort(priceListHigh)[0]);
  
  //SBUX: $50(minValue)-$1(categoryAdjuster) is default
  //categoryAdjuster = (minValue + maxValue) * 0.003;
  categoryAdjuster = (minValue) * 0.02;
  //categoryAdjuster = (maxValue) * 0.004;
  graphMax = (maxValue)+(minValue);
  
  //Array Creation to Store Values
  int valueMainArrayLength = ceil(maxValue*1.1/categoryAdjuster);
  valueMain = new float [valueMainArrayLength][]; 
  timeValue = new Coordinate [totalLength][];
  
  
  for(int i=0; i<totalLength; i++){
      int low = floor(priceListLow[i]/categoryAdjuster);
      int high = ceil(priceListHigh[i]/categoryAdjuster);
      float diff = (priceListHigh[i] - priceListLow[i])/categoryAdjuster;
      for(int j=low; j<high; j++){
        float min_diff = min(min(priceListHigh[i]/categoryAdjuster - j, 1), j - priceListLow[i]/categoryAdjuster + 1);
        float diff_result = min_diff/diff;
        
        if(valueMain[j] == null){
           valueMain[j] = new float[] {diff_result};
         }
         
         else{
           int currentjLength = valueMain[j].length;
           float newArray[] = new float[currentjLength+1];
           for(int k=0; k<currentjLength; k++){
             newArray[k] = valueMain[j][k];
             
              //Updating timeValue seriesn
              if(timeValue[i] == null){
                 timeValue[i] = new Coordinate[] {};
               }
               
               else{
                 int currentTimeLength = timeValue[i].length;
                 Coordinate newTimeArray[] = new Coordinate [currentTimeLength+1];
                 for(int ctl=0; ctl<currentTimeLength; ctl++){
                   newTimeArray[ctl] = timeValue[i][ctl];
                 }
                 newTimeArray[currentTimeLength] = new Coordinate(j,currentjLength);
                 timeValue[i] = newTimeArray;
               }
           }
           newArray[currentjLength] = diff_result;
           valueMain[j] = newArray;
          }
      }
  }

  size(700,700);
  frameRate(120);
  background(40);
  
  
  //Color Setup
  for(int color_i = 0; color_i<3; color_i ++){
    colorStep[color_i] = (finalColor[color_i] - initialColor[color_i])/totalLength;
  }
  
  //Size Setup
  dollarStep = categoryAdjuster /(minValue +maxValue);

  xAxisStep = dollarStep * width;
  print(xAxisStep);
}

//Define Coordinate Class to store the (j,k) coordinate value per time
class Coordinate{
  int j, k;
  Coordinate(int _j, int _k){
    j = _j;
    k = _k;
  }
}



//Draw Function
void draw(){

  i ++;
  
  fill(255);

  if(i<90){
    //Rotation
    background(40);
    renderAllStocksRotate(totalLength, radians(i));
  }
  if(i==90){
  background(40);
    renderAllStocksRotated(totalLength);
  }
  if(i>100 ){
    renderBubble(totalLength, (i-100));
  }
  
  //Saving
  String outputPath = String.format("output/%sStock.jpg", company);
  saveFrame("test_static.jpg");
}

void singleStock(int j) {
    noStroke();
    fill(color(initialColor[0] + colorStep[0]*j,initialColor[1] + colorStep[1]*j,initialColor[2] + colorStep[2]*j));
    rect(width*j/totalLength, height*(1 - priceListHigh[j]/graphMax)-10, 1, (priceListHigh[j] - priceListLow[j])/graphMax*height);
}


void singleStockRotated(int j){
    fill(color(initialColor[0] + colorStep[0]*j,initialColor[1] + colorStep[1]*j,initialColor[2] + colorStep[2]*j));
    rect(height*( priceListHigh[j]/graphMax), width*j/totalLength, (priceListHigh[j] - priceListLow[j])/graphMax*height, 1);
}

void renderAllStocksRotated(int givenLength){
    for(int j=0; j<givenLength; j++){
      noStroke();
      singleStockRotated(j);
    }
}

void renderAllStocksRotate(int givenLength, float angle){
  pushMatrix();  
    translate((1-cos(angle)+sin(angle))*width/2,(1-cos(angle)-sin(angle))*width/2);
    rotate(angle);

    for(int j=0; j<givenLength; j++){
      noStroke();
      singleStock(j);
    }

  popMatrix();
}

void singleStockBubble(int i, int pos){
    //ellipse(width*( priceListHigh[i]/maxValue), height*i/totalLength, (priceListHigh[i] - priceListLow[i])/maxValue*width, );

    if (timeValue[i] != null){
      int currentArrayLength = timeValue[i].length;
      for(int t=0; t<currentArrayLength; t++){
        //Retrive value of j, k coordinate
        int jVal = timeValue[i][t].j;
        int kVal = timeValue[i][t].k;
        //(height*i/totalLength)*(1-pos/100)
        float currentYPos = height*i/totalLength*(1-pos/10.0) + (height-kVal*5)*(pos/10.0);   
        fill(color(initialColor[0] + colorStep[0]*i,initialColor[1] + colorStep[1]*i,initialColor[2] + colorStep[2]*i));
        ellipse(jVal*xAxisStep, currentYPos, 1.1*xAxisStep*pow(valueMain[jVal][kVal], 1/1.4), 1.1*xAxisStep*pow(valueMain[jVal][kVal], 1/1.4));
      }
    }
}

void renderBubble(int givenLength, int time){
  for(int j=0; j<givenLength; j++){
      for(int k=0; k<11; k++){
        if(time-k>0){
            
            singleStockBubble(time-k,k);
        }
      }
  }
}
