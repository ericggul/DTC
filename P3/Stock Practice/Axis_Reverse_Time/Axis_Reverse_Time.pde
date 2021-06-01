Table table; 
PFont f;
int i;
import java.util.Stack;
import java.util.List;


String company = "CSCO";

public void setup(){
  //Getting csv file name: QCOM.csv for example
  String csv = String.format("%s.csv", company);
  table = loadTable(csv, "header");
  size(1250,700);
  background(40);
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
  
  //Intialize String
  String[] initialPriceListLow, initialPriceListHigh, initialDate;
  //Data Retriving
  initialPriceListLow = table.getStringColumn("Low");
  initialPriceListHigh = table.getStringColumn("High");
  initialDate = table.getStringColumn("Date");
  
  //Total Time Length of Data
  int totalLength = initialPriceListLow.length;
  
  //Min and Max Price of each time
  float[] priceListLow = new float [totalLength];
  float[] priceListHigh = new float [totalLength];
  String[] date = new String [totalLength];
  
  for(int i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[totalLength -1 - i].substring(1));
    priceListHigh[i] = parseFloat(initialPriceListHigh[totalLength- 1 - i].substring(1));
    date[i] = initialDate[totalLength-1-i];
  }
  
  //MaxValue of All Time
  int maxValue = ceil(reverse(sort(priceListHigh))[0]);
  
  //Intializing two important two-dimensional data arrays
  //valueMain: Stores j-k coordinate, j: price, k: amount of time/day, value: diff_result, the density of a price staying in certain categry
  float valueMain[][] = new float [maxValue*2][]; 
  //timeValue: Stores i-ctl coordinate, i: time, ctl: stack of (j,k), value: (j,k) coordinate value
  Coordinate timeValue[][] = new Coordinate [totalLength][];

  
  for(int i=0; i<totalLength; i++){
    int low = floor(priceListLow[i]);
    int high = ceil(priceListHigh[i]);
    float diff = priceListHigh[i] - priceListLow[i];

    for(int j=low; j<high; j++){
       float min_diff = min(min(priceListHigh[i]-j, 1),j-priceListLow[i]+1);
       float diff_result = min_diff/diff;

       if(valueMain[j] == null){
         valueMain[j] = new float[] {diff_result};
       }
       else{
         int currentjLength = valueMain[j].length;
         float newArray[] = new float[currentjLength+1];
         for(int k=0; k<currentjLength; k++){
           newArray[k] = valueMain[j][k];
           
           //Updating timeValue series
                  if(timeValue[i] == null){
                     timeValue[i] = new Coordinate[] {};
                   }
                   else{
                     int currentTimeLength = timeValue[i].length;
                     Coordinate newTimeArray[] = new Coordinate [currentTimeLength+1];
                     for(int ctl=0; ctl<currentTimeLength; ctl++){
                       newTimeArray[ctl] = timeValue[i][ctl];
                     }
                     newTimeArray[currentTimeLength] = new Coordinate(j,k);
                     timeValue[i] = newTimeArray;
                   }
              
         }
         newArray[currentjLength] = diff_result;
         valueMain[j] = newArray;
       }
       
  

    }
  }
  
  i ++;
  
  
  
  if(i<totalLength){
    if(i==1){
      //Getting csv file name: QCOM.csv for example
      String header = String.format("%s Stock Price", company);
      
      textSize(20);
      text(header, 20, 30);
      textSize(10);
      text("Source: NASDAQ", 20, 50);
    }
    fill(255);
    noStroke();
    if (timeValue[i] != null){
      int currentArrayLength = timeValue[i].length;
      for(int t=0; t<currentArrayLength; t++){
        
        //Retrive value of j, k coordinate
        int jVal = timeValue[i][t].j;
        int kVal = timeValue[i][t].k;
        
        
        ellipse(jVal*5,height-kVal*5,5*valueMain[jVal][kVal],5*valueMain[jVal][kVal]);
    }
    }
    
  }
  String outputPath = String.format("output/%sStock.jpg", company);
  saveFrame(outputPath);
}
