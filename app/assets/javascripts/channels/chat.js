
//= require_self
//= require_tree

this.App = {}

App.cable = ActionCable.createConsumer()

App.chat = App.cable.subscriptions.create('ChatChannel', {
	received: function(data) {

		let current_user = $('#session-id').text();

		if (current_user === String(data.recipient)) {
			if (window.location.href.includes(`/chats/${data.sender.id}`)) {

			let node = $(`
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
			scrollSlow();

			} else {

			notificationBuilder(data.title, data.message, data.link, data.key)

			}
		}     
	}
});
