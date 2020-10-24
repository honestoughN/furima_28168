import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    if ( current_user.id == data.content.user_id ) {
      const html = `<div class="comment-output seller"><p>☆&lt;${data.content.user_id.nickname}&gt;</p><p>${data.content.text}</p></div>`;
      const messages = document.getElementById('comments');
      const newMessage = document.getElementById('comment_text');
      messages.insertAdjacentHTML('afterbegin', html);
      newMessage.value='';
    } else {
      const html = `<div class="comment-output viewer"><p>&lt;${data.content.user_id.nickname}&gt;</p><p>${data.content.text}</p></div>`;
      const messages = document.getElementById('comments');
      const newMessage = document.getElementById('comment_text');
      messages.insertAdjacentHTML('afterbegin', html);
      newMessage.value='';
    }
  }
});