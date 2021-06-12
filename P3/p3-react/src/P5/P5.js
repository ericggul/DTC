import React from 'react'
import Sketch from 'react-p5'

function P5() {

    let company = "GOOG";
    let i = 0;
    let table;
    let initialPriceListLow, initialPriceListHigh;

    const preload = (p5) => {
        table = p5.loadTable(`FB.csv`, 'header');

    }

    const loadData = (p5) =>{
        console.log(table);
        const data = table.getRows();
        const length = table.getRowCount();
        initialPriceListLow = table.getColumn("Low");
        console.log(initialPriceListLow);
    }


    const setup = (p5, canvasParentRef) => {
        p5.createCanvas(500, 400).parent(canvasParentRef)
        loadData(p5)
    }
    
    const draw = p5 => {
        
        p5.background(255, 130, 20)
        p5.ellipse(100, 100, 100)
        p5.ellipse(300, 100, 100)

    }
    
    return <Sketch preload={preload} setup={setup} draw={draw} />
}

export default P5