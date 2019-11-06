
//= require_self
//= require_tree

this.App = {}

App.cable = ActionCable.createConsumer()

App.folder = App.cable.subscriptions.create('FolderChannel', {  
    received: function(data) {

    let current_user = $('#session-id').text();

    if (current_user === String(data.recipient)) {
        if (window.location.href.endsWith(`/uploads`)) {
        location.reload(true)
        } else {

        let key = Math.floor(Math.random()*100000)

        let  node = $(`
            <div id='notification-${key}' class="toast flex-grow-1 m-2" role="alert" aria-live="assertive" aria-atomic="true" style='opacity: 100;'>
            <div class="toast-header">
                <strong class="mr-auto">Folders Update</strong>
                <small class="text-muted">just now</small>
                <button id='close-${key}' type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
                <a href='/uploads'>${data.message}</a>
            </div>
            </div>`);

        $("#toast-box").append(node);

        $(`#close-${key}`).click( function() {
            $(`#notification-${key}`).fadeOut(350)
        })

        }
    }
}
});