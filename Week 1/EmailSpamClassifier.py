def is_spam(email_text):
    spam_keywords = ["win", "prize", "free", "cash", "urgent"]
    for keyword in spam_keywords:
        if keyword in email_text.lower():
            return True
    return False

email = "Congratulations! You've won a free prize!"
print(is_spam(email))

email = "Hello Diwas, How are you?"
print(is_spam(email))


############################################
################ OUTPUT ####################
############################################
# python Week\ 1/EmailSpamClassifier.py 
# True
# False