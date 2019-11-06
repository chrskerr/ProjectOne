
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
      node = $(`
      <a href='/uploads'>
      <div id='notification' class="toast flex-grow-1 m-2" role="alert" aria-live="assertive" aria-atomic="true" style='opacity: 100;' data-autohide='true' data-delay="3000">
        <div class="toast-header">
          <strong class="mr-auto">Folders Update</strong>
          <small class="text-muted">just now</small>
          <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="toast-body">
          <p>${data.message}</p>
        </div>
      </div>
      </a>`);

      $("#toast-box").append(node);
    }
  }
  });