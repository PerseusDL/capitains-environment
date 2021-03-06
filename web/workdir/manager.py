from app import app, nautilus
from capitains_nautilus.flask_ext import FlaskNautilusManager
from flask.ext.script import Manager

manager = Manager(app)
manager.add_command("nautilus", FlaskNautilusManager(nautilus, app=app))

if __name__ == "__main__":
    manager.run()