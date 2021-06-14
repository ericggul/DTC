
import processing.pdf.*;

//Company Name
String company = "BTC";

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
float valueMain[][] = new float [maxValue*2][]; 
Coordinate timeValue[][] = new Coordinate [totalLength][];

float[] initialColor ={210, 210, 210};
float[] finalColor = {20, 20, 20};
float[] colorStep = {0,0,0};
float dollarStep = 0;
float xAxisStep = 0;

float categoryAdjuster = 0;
float axisAdjuster = 0;

public void setup(){
  //Getting csv file name: QCOM.csv for example
  String csv = String.format("%s.csv", company);
  table = loadTable(csv, "header");
  
  
  //Font
  
  //Data Retriving
  initialPriceListLow = table.getStringColumn("Low");
  initialPriceListHigh = table.getStringColumn("High");
  initialDate = table.getStringColumn("Date");

  totalLength = initialPriceListLow.length;
  
  priceListLow = new float [totalLength];
  priceListHigh = new float [totalLength];
  date = new String [totalLength];
  
  for(int i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[i]);
    priceListHigh[i] = parseFloat(initialPriceListHigh[i]);
    date[i] = initialDate[i];
  }
  
  //MaxValue of All Time
  maxValue = 70000;
  minValue = floor(sort(priceListHigh)[0]);
  
  //SBUX: $50(minValue)-$1(categoryAdjuster) is default
  //categoryAdjuster = (minValue + maxValue) * 0.003;
  categoryAdjuster = (minValue) * 0.3;
  
  //Array Creation to Store Values
  int valueMainArrayLength = ceil(maxValue*1.1/categoryAdjuster);
  valueMain = new float [valueMainArrayLength][]; 
  timeValue = new Coordinate [totalLength][];
  
  print(priceListHigh[35]);

  
  for(int i=0; i<totalLength; i++){
      int low = floor(priceListLow[i]/categoryAdjuster);
      int high = ceil(priceListHigh[i]/categoryAdjuster);
      float diff = (priceListHigh[i] - priceListLow[i])/categoryAdjuster;
      for(int j=low; j<high; j++){
        float min_diff = min(min(priceListHigh[i]/categoryAdjuster - j, 1), j - priceListLow[i]/categoryAdjuster + 1);
        float diff_result = min_diff/diff;
        
        if(diff_result > 2){
          diff_result = 2; 
        }
        
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
  
  size(2000,1000);
  background(210);

  
  //Color Setup
  for(int color_i = 0; color_i<3; color_i ++){
    colorStep[color_i] = (finalColor[color_i] - initialColor[color_i])/totalLength;
  }
  
  //Size Setup
  dollarStep = categoryAdjuster * 17/minValue ;

  xAxisStep = dollarStep;
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

  int circleSize =80;
  for(i = 0; i<totalLength; i++){
   
    noStroke();
    noStroke();
    if (timeValue[i] != null){
      int currentArrayLength = timeValue[i].length;
  
      for(int t=0; t<currentArrayLength; t++){
        
        //Retrive value of j, k coordinate
        int jVal = timeValue[i][t].j;
        int kVal = timeValue[i][t].k;
        float multiplier = pow(valueMain[jVal][kVal], 1/1.4);
        
        fill(color(initialColor[0] + colorStep[0]*i,initialColor[1] + colorStep[1]*i,initialColor[2] + colorStep[2]*i, 2));
        
        ellipse(jVal*xAxisStep,height-kVal*7,circleSize,circleSize);
      }
    }
  }
 
  
  //Saving
  String outputPath = String.format("output/%sStock3.jpg", company);
  saveFrame(outputPath);
}

void header(){
  String header = String.format("%s", company);
  textSize(20);
  text(header, 20, 30);
  //textSize(10);
  //text("Source: NASDAQ", 20, 50);
}

void axis(){
  stroke(255);

  //X-Axis-Label
  textSize(20);
  text("$", width-60, height-20);

  //Y-Axis-Label
  textSize(20);
  text("Days", 20, 90);
}
