"""
Handlers
"""

import tornado.web
from random import choice, random
from base64 import decodestring
from PIL import Image
from os import remove

coords = [(63, 41), (367, 41), (670, 41), (63, 250), (367, 250), (670, 250), (63, 458), (367, 458), (670, 458)]

def getRandomGreeting():
    greetinglist = ['Haai', 'Hi', 'Namaste', 'Ni Hao', 'Hej', 'Salut', 'Guten Tag', 'Aloha', 'Hallo', 'Ciao', 'Konnichiwa', 'Wassup', 'Hei', 'Salaam', 'Ola', 'Hola']
    return choice(greetinglist)

def generateImage(key):
    rawtemplate = Image.open("static/img/template.png")
    newtemplate = rawtemplate.copy()
    for i in range(0, len(coords)):
        filename = key + "-" + str(i) + ".png"
        im = Image.open(filename)
        im = im.resize((228, 171), Image.ANTIALIAS)
        newtemplate.paste(im, coords[i])
        remove(filename)
    newtemplate.save("static/shades/" + key+".png")
    
def S4():
    rd = int((1+random())*0x10000)
    return format(rd, '04x')[1:]

def generateUUID():
    return (S4()+"-"+S4()+"-"+S4()+"-"+S4())

class HomeHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("index.tpl",
                    moduleName="NineShades",
                    greeting = getRandomGreeting(),
                    uuid = generateUUID()
                    )

class UploadHandler(tornado.web.RequestHandler):
    def post(self):
        key = self.get_argument('key')
        counter = int(self.get_argument('counter'))
        image = decodestring(self.get_argument('image').encode())
        with open(key + '-' + str(counter) + '.png', 'wb') as imagefile:
            imagefile.write(image)
        if (counter == 8):
            generateImage(key)
            self.write({'status': 301, 'url': "/static/shades/" + key+'.png'})
        else:
            self.write({'status': 201})