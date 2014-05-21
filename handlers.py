"""
Handlers
"""

import tornado.web
from random import choice

def getRandomGreeting():
    greetinglist = ['Haai', 'Hi', 'Namaste', 'Ni Hao', 'Hej', 'Salut', 'Guten Tag', 'Aloha', 'Hallo', 'Ciao', 'Konnichiwa', 'Wassup', 'Hei', 'Salaam', 'Ola', 'Hola']
    return choice(greetinglist)

class HomeHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("index.tpl",
                    moduleName="NineShades",
                    greeting = getRandomGreeting(), 
                    )