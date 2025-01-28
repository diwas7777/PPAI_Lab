def diagnose(symptoms):
    if "fever" in symptoms and "cough" in symptoms:
        return "You may have the flu."
    elif "headache" in symptoms and "nausea" in symptoms:
        return "You may have a migraine."
    else:
        return "Symptoms not recognized. Please consult a doctor."

symptoms = ["fever", "cough"]
print(diagnose(symptoms))

symptoms = ["headache", "nausea"]
print(diagnose(symptoms))

symptoms = ["fever", "headache"]
print(diagnose(symptoms))