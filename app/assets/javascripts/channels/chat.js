
//= require_self
//= require_tree

this.App = {}

App.cable = ActionCable.createConsumer()

App.chat = App.cable.subscriptions.create('ChatChannel', {  
    received: function(data) {

      let current_user = $('#session-id').text();


    if (window.location.href.includes(`/chats/${data.sender.id}`)) {

      node = $(`
      <div class='col-12 d-flex flex-row justify-content-start'>
        <span class='col-3 border bg-secondary text-white p-1 rounded'>
            <p>${data.message}</p>
        </span>
      </div>
      <div class='col-12 d-flex flex-row justify-content-start'>
          <span class='col-3'>
              <p class='text-secondary small'>${data.time}</p>
          </span>
      </div>

      `)
      $('#message-window').append(node);
      scroll();
    } else if (current_user === String(data.recipient)) {
      node = $(`
      <a href='/chats/${data.sender.id}'>
      <div id='notification' class="toast flex-grow-1 m-2" role="alert" aria-live="assertive" aria-atomic="true" style='opacity: 100;' data-autohide='true' data-delay="3000">
        <div class="toast-header">
          <strong class="mr-auto">Message from ${data.sender.name}</strong>
          <small class="text-muted">just now</small>
          <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="toast-body">
          <p>${data.message}</p>
        </div>
      </div>
      <a>`);

      $("#toast-box").append(node);
    }
  }
});

