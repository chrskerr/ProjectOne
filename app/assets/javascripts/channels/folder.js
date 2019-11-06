
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

        notificationBuilder('Folder Update', data.message, '/uploads', 0)
        
        }
    }
}
});