$('.dropdown-toggle').dropdown('toggle')
$('#notification').toast('hide')


function scrollSlow() {
    let objDiv = document.getElementById("message-window");
    let end = objDiv.scrollHeight;
    $('#message-window').animate({scrollTop: end}, 1500)
}

function scrollFast() {
    let objDiv = document.getElementById("message-window");
    objDiv.scrollTop = objDiv.scrollHeight;
}