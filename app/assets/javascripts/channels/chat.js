
//= require_self
//= require_tree

this.App = {}

App.cable = ActionCable.createConsumer()

App.chat = App.cable.subscriptions.create('ChatChannel', {
	received: function(data) {

		let current_user = $('#session-id').text();
		// hacky, but lets JS know who is currently logged in, easy to duplicate in browser but worked well for now

		if (current_user === String(data.recipient)) {
			if (window.location.href.includes(`/chats/${data.sender.id}`)) {

			newChatDisplay('incoming', data.message, data.time)
			// defined in app/assets/javascripts/main.js

			} else {

			notificationBuilder(data.title, data.message, data.link, data.key)
			// defined in app/assets/javascripts/main.js

			}
		}     
	}
});
