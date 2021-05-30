Table table; 
PFont f;
int i;

public void setup(){
  table = loadTable("Apple.csv", "header");
  size(1250,200);
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
  
  i ++;
  
  if(i<totalLength){
    if(i==1){
      textSize(20);
      text("Apple(AAPL) Stock Price", 20, 30);
      textSize(10);
      text("Source: NASDAQ", 20, 50);
    }
    if((i-100)%200 == 0){
      String priceString = String.format("$%f", priceListHigh[i]);
      text(priceString, 1*i-30, height- priceListHigh[i]-15);
      text(date[i], 1*i-30, height-10); 
    }
    fill(255);
    noStroke();
    rect( 1*i, height - priceListHigh[i] ,1, priceListHigh[i] - priceListLow[i]);
    
  }
  saveFrame("AAPLStock.jpg");
}
