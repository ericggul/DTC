Table table; 
PFont f;
int i;
import java.util.Stack;
import java.util.List;

public void setup(){
  table = loadTable("Apple.csv", "header");
  size(1250,500);
  background(40);
 
}

void draw(){
  String[] initialPriceListLow, initialPriceListHigh, initialDate;
  initialPriceListLow = table.getStringColumn("Low");
  initialPriceListHigh = table.getStringColumn("High");
  initialDate = table.getStringColumn("Date");
  
  int totalLength = initialPriceListLow.length;
  
  float[] priceListLow = new float [totalLength];
  float[] priceListHigh = new float [totalLength];
  String[] date = new String [totalLength];
  
  for(int i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[totalLength -1 - i].substring(1));
    priceListHigh[i] = parseFloat(initialPriceListHigh[totalLength- 1 - i].substring(1));
    date[i] = initialDate[totalLength-1-i];
  }
  
  int maxValue = ceil(reverse(sort(priceListHigh))[0]);
  print(maxValue);
  print("Max Value");
  float valueMain[][] = new float [maxValue*2][]; 

  
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
         }
         newArray[currentjLength] = diff_result;
         valueMain[j] = newArray;
       }
       //int currentjLength = valueMain[j].length;
       //valueMain[j][currentjLength] = diff_result;

    }
  }
  
  i ++;
  
  if(i<maxValue){
    if(i==1){
      textSize(20);
      text("Apple(AAPL) Stock Price", 20, 30);
      textSize(10);
      text("Source: NASDAQ", 20, 50);
    }
    fill(255);
    noStroke();
    if (valueMain[i] != null){
      int currentArrayLength = valueMain[i].length;
      for(int t=0; t<currentArrayLength; t++){
        ellipse(i*5,height-t*5,5*valueMain[i][t],5*valueMain[i][t]);
    }
    }
    
  }
  saveFrame("AAPLStock.jpg");
}
