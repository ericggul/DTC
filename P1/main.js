$(document).ready(function() {

    for (let i = 1; i<13; i++){
        
        var domRect = document.getElementById(`P${i}`).getBoundingClientRect();
        
        var width = $(`#T${i}`).width();
        var height = $(`#T${i}`).height();
        
        $(`#T${i}`).offset({top: domRect.y-height/1.73, left: domRect.x- width/2});

    

        $(`#O${i}`).click(function() {
            $(`#L${i}`).toggleClass('clicked');
            $(`#T${i}`).toggleClass('visible');
        })

        $(`#T${i}`).click(function() {
            $(`#L${i}`).toggleClass('clicked');
            $(`#T${i}`).toggleClass('visible');
        })

        //resizing
        /*window.addEventListener('resize',()=>{
            var position =  $(`#P${i}`).offset();
            var width = $(`#T${i}`).width();
            var height = $(`#T${i}`).height();
            $(`#T${i}`).offset({top: position.top-height/1.76, left: position.left - width/2});
        })*/
        
    }

    $("#wrap_loader").click(function(){
        console.log('clicked');
        $(".wrapper").toggleClass("wrapclicked");
    })
})
