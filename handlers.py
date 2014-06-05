"""
Handlers
"""

import tornado.web
from random import choice, random
from PIL import Image
from os import remove
from os.path import join
from openshiftparams import tempdir, savedir, templatefile
from base64 import b64decode
from time import time
import logging

logger = logging.getLogger(__name__)
MAXWIDTH = 340
MAXHEIGHT = 300
TEMPLATEDIM = 378

def getRandomGreeting():
    greetinglist = ['Haai', 'Hi', 'Namaste', 'Ni Hao', 'Hej', 'Salut', 'Guten Tag', 'Aloha', 'Hallo', 'Ciao', 'Konnichiwa', 'Wassup', 'Hei', 'Salaam', 'Ola', 'Hola']
    return choice(greetinglist)

def generateImage(key):
    rawtemplate = Image.open(templatefile)
    newtemplate = rawtemplate.copy()
    for i in range(0, 3):
        for j in range(0, 3):
            index = 3*i+j;
            filename = join(tempdir, key + "-" + str(index) + ".png")
            im = Image.open(filename)
            if (im.size[0] > im.size[1]):
                aspectratio = MAXWIDTH/im.size[0]
                thisheight = int(float(im.size[1])*aspectratio)
                im = im.resize((MAXWIDTH, thisheight), Image.ANTIALIAS)
            else:
                aspectratio = MAXHEIGHT/im.size[1]
                thiswidth = int(float(im.size[0])*aspectratio)
                im = im.resize((thiswidth, MAXHEIGHT), Image.ANTIALIAS)
            xoffset, yoffset = i*TEMPLATEDIM, j*TEMPLATEDIM
            xoffset += int((TEMPLATEDIM - im.size[0]) / 2)
            yoffset += 20
            newtemplate.paste(im, (xoffset, yoffset), mask = im)
            remove(filename)
    newtemplate.save(join (savedir, key+".png"))
    
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
        with open(join(tempdir, key + '-' + str(counter) + '.png'), 'wb') as imagefile:
            starttime = time()
            thisimage = b64decode(self.request.arguments['image'][0])
            endtime1 = time() - starttime
            imagefile.write(thisimage)
            endtime2 = time() - starttime
        if (counter == 8):
            generateImage(key)
            endtime3 = time() - starttime
            self.write({'status': 301, 'url': "/myshade/" + key+'.png', 'times': str(endtime1) + 's-' + str(endtime2) + 's-' + str(endtime3) + 's-'})
        else:
            self.write({'status': 201, 'times': str(endtime1) + 's-' + str(endtime2) + 's-'})