
//= require_self
//= require_tree

this.App = {}

App.cable = ActionCable.createConsumer()

App.folder = App.cable.subscriptions.create('FolderChannel', {  
    received: function(data) {

      let current_user = $('#session-id').text();

      if (window.location.href.endsWith(`/uploads`)) {
        location.reload(true)
      } else if (current_user === String(data.recipient)) {
      
      let  node = $(`
      <a href='/uploads'>
      <div id='notification' class="toast flex-grow-1 m-2" role="alert" aria-live="assertive" aria-atomic="true" style='opacity: 100;'>
        <div class="toast-header">
          <strong class="mr-auto">Folders Update</strong>
          <small class="text-muted">just now</small>
        </div>
        <div class="toast-body">
          <p class='text-dark'>${data.message}</p>
        </div>
      </div>
      </a>`);

      $("#toast-box").append(node);


    }
  }
  });