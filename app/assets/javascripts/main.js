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

let notificationBuilder = function (title, message, link, key) {
    
    if (key === 0) key = Math.floor(Math.random()*100000)

    let  node = $(`
        <div id='notification-${key}' class="toast flex-grow-1 m-2" role="alert" aria-live="assertive" aria-atomic="true" style='opacity: 100;'>
        <div class="toast-header">
            <strong class="mr-auto">${title}</strong>
            <small class="text-muted">just now</small>
            <button id='close-${key}' type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            <a href='${link}'>${message}</a>
        </div>
        </div>`);

    $("#toast-box").append(node);

    $(`#close-${key}`).click( function() {
        $(`#notification-${key}`).fadeOut(350)
    })
}