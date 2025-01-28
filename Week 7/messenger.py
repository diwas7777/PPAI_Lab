class User:
    def __init__(self, username, password):
        self.username = username
        self.__password = password 

    def check_password(self, password):
        return self.__password == password

    def get_username(self):
        return self.username


class Message:
    def __init__(self, sender, recipient, content):
        self.sender = sender
        self.recipient = recipient
        self.content = content
        self.timestamp = self.__generate_timestamp()

    def __generate_timestamp(self):
        from datetime import datetime
        return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def display_message(self):
        return f"{self.timestamp} - {self.sender.get_username()} to {self.recipient.get_username()}: {self.content}"


class MessagingSystem:
    def __init__(self):
        self.users = {}
        self.messages = []

    def add_user(self, username, password):
        if username not in self.users:
            self.users[username] = User(username, password)
        else:
            print("Username already taken!")

    def send_message(self, sender_username, recipient_username, password, content):
        sender = self.users.get(sender_username)
        recipient = self.users.get(recipient_username)
        
        if sender and recipient and sender.check_password(password):
            message = Message(sender, recipient, content)
            self.messages.append(message)
            print("Message sent!")
        else:
            print("Invalid sender or password.")

    def view_messages(self, username):
        for message in self.messages:
            if message.sender.get_username() == username or message.recipient.get_username() == username:
                print(message.display_message())



system = MessagingSystem()
system.add_user('alice', 'password123')
system.add_user('bob', 'password456')

system.send_message('alice', 'bob', 'password123', 'Hello, Bob!')
system.send_message('bob', 'alice', 'password456', 'Hi Alice!')

system.view_messages('alice')
