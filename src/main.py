
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__, template_folder='templates')

@app.route("/")
def index():
    return render_template('index.html', title="Flask in Wasmer Edge")

@app.route("/about")
def about():
    return render_template('about.html', title="About")

@app.route("/contact")
def contact():
    return render_template('contact.html', title="Contact")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
