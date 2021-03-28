var srcEl = null;

function paraDragStart(ev){
    if (ev.target.classList.contains('box')){
        ev.target.style.opacity = '0.4';
        srcEl = this;
        ev.dataTransfer.setData("application/my-app",srcEl.innerHTML);
        /*ev.dataTransfer.setData("application/my-app",ev.target.id);*/
    }

}
function paraDragOver(ev){
    ev.preventDefault();
    ev.dataTransfer.dropEffect = "move";
}

function paraDrop(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("application/my-app");
    /*ev.target.appendChild(document.getElementById(data));*/
    if (srcEl!= this){
        console.log(this);
        console.log(ev.target);
        srcEl.innerHTML = ev.target.innerHTML;
        ev.target.innerHTML = data;
    }
}

function paraDragEnd(ev){
    ev.target.style.opactiy = '1';
    this.style.opacity = '1';
    srcEl.style.opacity = '1';
}

function dragStart(ev){
    ev.target.style.opacity = '0.4';
    srcEl = this;
    ev.dataTransfer.setData("application/my-app",srcEl.innerHTML);
    /*ev.dataTransfer.setData("application/my-app",ev.target.id);*/

}
function dragOver(ev){
    ev.preventDefault();
    ev.dataTransfer.dropEffect = "move";
}

function drop(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("application/my-app");
    /*ev.target.appendChild(document.getElementById(data));*/
    if (srcEl!= this){
        console.log(this);
        console.log(ev.target);
        srcEl.innerHTML = ev.target.innerHTML;
        ev.target.innerHTML = data;
    }
}

function parentDrop(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("application/my-app");
    ev.target.appendChild(document.getElementById(data));
    /*if (srcEl!= this){
        console.log(this);
        console.log(ev.target);
        srcEl.innerHTML = ev.target.innerHTML;
        ev.target.innerHTML = data;
    }*/
}

function dragEnd(ev){
    ev.target.style.opactiy = '1';
    this.style.opacity = '1';
    srcEl.style.opacity = '1';
}

let boxes = document.querySelectorAll('#main .box');
boxes.forEach(function(item){
    item.addEventListener('dragstart', paraDragStart);
    item.addEventListener('dragover', paraDragOver);
    item.addEventListener('drop', paraDrop);
    item.addEventListener('dragend', paraDragEnd);
})


let innerboxes = document.querySelectorAll('#main .innerbox');
innerboxes.forEach(function(item){
    item.addEventListener('dragstart', dragStart);
    item.addEventListener('dragover', dragOver);
    item.addEventListener('drop', drop);
    item.addEventListener('dragend', dragEnd);
})


