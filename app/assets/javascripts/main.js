$('.dropdown-toggle').click(function() {
    console.log('something')

    this.dropdown('toggle')
    // I think that this adds the JS to make the on Uploads page show/hide, but when clicked the above console.log is not showing, so maybe I'm wrong
    // seperating this out so that I can attempt to add a scrollTop to make the pop-up always entirely visible
    // commenting this out still has the buttons toggle.... this is final fine-tuning, leaving for now
})


function scrollSlow() {
    // scroll quickly to bottom of messages-div, used when receiving a message or changing chat window, etc
    let objDiv = document.getElementById("message-window");
    let end = objDiv.scrollHeight;
    $('#message-window').animate({scrollTop: end}, 1000)

    console.log('hit')
}

function scrollFast() {
    // scroll immediately to bottom of messages-div, only used for message-send
    let objDiv = document.getElementById("message-window");
    objDiv.scrollTop = objDiv.scrollHeight;
}


let notificationBuilder = function (title, message, link, key) {
// unified toasts creation between all notifications

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

let newChatDisplay = function (direction, message, time, messageId) {
 // created this to facilitate easier adding of zero-refresh message sending later
 // called from app/assets/javascripts/channels/chat.js and the chats_controller.rb
    let node;

    if (direction === 'incoming') {
        node = $(`
        <div class='col-12 d-flex flex-row justify-content-start'>
            <span class='col-3 border bg-secondary text-white p-1 rounded'>
                <p>${message}</p>
            </span>
        </div>
        <div class='col-12 d-flex flex-row justify-content-start'>
            <span class='col-3'>
                <p class='text-secondary small'>${time}</p>
            </span>
        </div>`)

    } else if (direction === 'outgoing') {
        node = $(`
        <div class='col-12 d-flex flex-row justify-content-end'>
            <span class='col-3 border bg-primary text-white p-1 rounded'>
                <p>${message}</p>
            </span>
        </div>
        <div class='col-12 d-flex flex-row justify-content-end'>
            <span class='col-3'>
                <p class='text-secondary small'>${time}</p>
            </span>
        </div>`)    
    } else {
        return
    }

    $('#message-window').append(node);
    scrollSlow();
}