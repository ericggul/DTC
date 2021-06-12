
//Company Name
let company = "GOOG";


let i = 0;
let totalLength;
let dateText;


//Intialize let
let initialPriceListLow, initialPriceListHigh, initialDate;
let priceListLow, priceListHigh;
let date;

let maxValue;
let minValue;
let valueMain;
let timeValue;

let initialColor =[130, 200, 200];
let finalColor = [200, 30, 50];
let colorStep = [0,0,0];
let dollarStep = 0;
let xAxisStep = 0;

let categoryAdjuster = 0;
let axisAdjuster = 0;

function preload(){
  table = loadTable(`GOOG.csv`, "header");
}

function setup(){
  //Getting csv file name: QCOM.csv for example
  
  smooth(2);
  
  
  //Data Retriving
  initialPriceListLow = table.getColumn("Low");
  initialPriceListHigh = table.getColumn("High");
  initialDate = table.getColumn("Date");
  


  totalLength = initialPriceListLow.length;
  
  priceListLow = new Array(totalLength);
  priceListHigh = new Array(totalLength);
  date = new Array(totalLength);
  
  for(let i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[totalLength -1 - i].substring(1));
    priceListHigh[i] = parseFloat(initialPriceListHigh[totalLength- 1 - i].substring(1));
    date[i] = initialDate[totalLength-1-i];
  }
  
  //MaxValue of All Time
  maxValue = ceil(reverse(sort(priceListHigh))[0]);
  minValue = floor(sort(priceListHigh)[0]);
  
  //SBUX: $50(minValue)-$1(categoryAdjuster) is default
  //categoryAdjuster = (minValue + maxValue) * 0.003;
  categoryAdjuster = (minValue) * 0.02;
  // categoryAdjuster = (maxValue) * 0.004;
  
  //Array Creation to Store Values
  let valueMainArrayLength = ceil(maxValue*1.1/categoryAdjuster);

  valueMain = new Array(valueMainArrayLength); 
  timeValue = new Array(totalLength);
  
  
  for(let i=0; i<totalLength; i++){
      let low = floor(min(priceListLow[i], priceListHigh[i])/categoryAdjuster);
      let high = ceil(max(priceListLow[i], priceListHigh[i])/categoryAdjuster);
      let diff = abs(priceListHigh[i] - priceListLow[i])/categoryAdjuster;

      for(let j=low; j<high; j++){
        let min_diff = min(min(max(priceListLow[i], priceListHigh[i])/categoryAdjuster - j, 1), j - min(priceListLow[i], priceListHigh[i])/categoryAdjuster + 1);
        let diff_result = diff>1 ?  min_diff/diff: 1;

        console.log(diff_result);
        if(!timeValue[i]){
          timeValue[i] = []
        }
        if(!valueMain[j]){
          valueMain[j] = []
        }
        let currentjLength = valueMain[j].length;
        for(let k=0; k<currentjLength; k++){
          timeValue[i].push(new Coordinate(j, valueMain[j].length)); 
        }
        valueMain[j].push(diff_result);
      }
  }

  createCanvas(1250,800);
  smooth();
  frameRate(30);
  pixelDensity(10);
  background(40);
  
  //Color Setup
  for(let color_i = 0; color_i<3; color_i ++){
    colorStep[color_i] = (finalColor[color_i] - initialColor[color_i])/totalLength;
  }
  
  //Size Setup
  dollarStep = categoryAdjuster * 0.2/minValue ;

  xAxisStep = dollarStep * width;

  console.log(valueMain);


}

//Define Coordinate Class to store the (j,k) coordinate value per time
class Coordinate{
  constructor(j,k){
    this.j = j;
    this.k = k;
  }
}



//Draw Function
function draw(){

  i ++;

  
  if(i<totalLength){
  
    
    // noStroke();
    // fill(40);
    // rect(width-200, 0, width,200);
    // fill(255);
    // text(date[i], width-120, 40);
    // let priceText = let.format("$%d", let(priceListHigh[i]+priceListLow[i])/2);
    // text(priceText, width-120, 90);



    noStroke();
    if (timeValue[i] != null){
      let currentArrayLength = timeValue[i].length;
  
      for(let t=0; t<currentArrayLength; t++){
      
        
        //Retrive value of j, k coordinate
        let jVal = timeValue[i][t].j;
        let kVal = timeValue[i][t].k;

        fill(color(initialColor[0] + colorStep[0]*i,initialColor[1] + colorStep[1]*i,initialColor[2] + colorStep[2]*i));
        circle(jVal*xAxisStep, height-kVal*5, float(5*Math.pow(valueMain[jVal][kVal],1/1.4)));
      }
    }
  }
  

}

