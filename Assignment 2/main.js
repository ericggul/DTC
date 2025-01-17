let myRequest = new Request("./beerlist.json");

fetch(myRequest)
    .then(function(resp){
        return resp.json();
    })
    .then(function(data){
        const locConverter = (ind) =>{
            if (ind === 1){
                return 'Itaewon';
            } else if (ind === 2){
                return 'Hannam';
            } else{
                return 'Gyeongridan';
            }
        }
        for (let i = 1; i<22; i++){
            document.getElementById(`_${i}`).addEventListener('click', ()=>{
                var thisSpot = data.spots[i-1];
                var thisRating = thisSpot.rating.toFixed(1);
                console.log(data.spots[i-1]);
                document.getElementById('Header').textContent = `${thisSpot.name}`;
                document.getElementById('Beer').textContent = `#${thisSpot.beer}`;
                document.getElementById('Genre').textContent = `#${thisSpot.genre}`;
                document.getElementById('Atmosphere').textContent = `#${thisSpot.atmosphere}`;
                //Ratting: Bottle of Beer
                roundedRate = Math.round(thisSpot.rating*2);
                for (let k = 1; k < roundedRate+1; k++){
                    document.getElementById(`B${k}`).style.opacity = 1;
                }
                if (roundedRate!= 10){
                    for (let j = roundedRate+1; j<11; j++){
                        document.getElementById(`B${j}`).style.opacity = 0;
                    }
                }
                document.getElementById('Rating').textContent = `${thisSpot.rating.toFixed(1)}/5.0`;
                document.getElementById('Location').textContent = locConverter(thisSpot.location);
                //Search in Google
                document.getElementById('SearchA').setAttribute('href', `https://www.google.com/search?q=${thisSpot.name}+itaewon`);
                

            })
        }
        console.log(data.spots);
        console.log(document.getElementById('Header').textContent);
        
        
    })
