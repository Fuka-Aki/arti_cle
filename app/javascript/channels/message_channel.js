import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const nickName = `${data.user.nickname}`
    const content = `${data.content.content}`
    const messageData = `${data.time}`
    const currentUser = `${data.user.id}`
    const sendUser = `${data.content.user_id}`
    if (currentUser == sendUser) {
      const HTML = `
      <div class="my-content">
        <div class="my-message">
          <div class="my-message-date">
          ${messageData}
          </div>
          <div class="my-message-content">
            ${content}
          </div>
        </div>
      </div>
      `
      const messages = document.getElementById('message')
      const newMessage = document.getElementById('content')
      messages.insertAdjacentHTML('beforeend', HTML)
      newMessage.value=''
    } else {
      const HTML = `
      <div class="content">
        <div class="upper-message">
          <div class="message-user">
            ${nickName}
          </div>
        </div>
        <div class="lower-message">
          <div class="message-content" >
            ${content}
          </div>
          <div class="message-date">
            ${messageData}
          </div>
        </div>
      </div>
      `
      const messages = document.getElementById('message')
      const newMessage = document.getElementById('content')
      messages.insertAdjacentHTML('beforeend', HTML)
      newMessage.value=''
    }
  }
});
