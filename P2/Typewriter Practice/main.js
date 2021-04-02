var speed = 50;
var text = 'An announcement: It is never percieved that we will be able to go back to the good old days';
var i = 0;
var blackCounter = 0;
var target = document.getElementById('writer');

const writer = () =>{
    if ( i< text.length ) {
        document.getElementById('writer').innerHTML += text.charAt(i);
        i++;
        if (text.charAt(i) == ' '){
            setTimeout(writer, 100);
        }
        else{
            setTimeout(writer, 50);
        }
    }
}

document.addEventListener('DOMContentLoaded', writer, false);


//Graph

