#!/usr/bin/python

from os import path

from tornado import web, ioloop, gen
from tornado.options import options

from handlers import *
from openshiftparams import port, address, savedir

def load_app(port, root):
    settings = {
        "static_path": path.join(root, "static"),
        "template_path": path.join(root, "templates"),
        "debug": False,
        "gzip": True, # set this to true for gzip
        "globals": {
            "project_name": "nineshades"
        },
    }

    routers = [
        (r"/", HomeHandler),
        (r"/uploadphoto", UploadHandler),
        (r"/nineshades/(.*)", ImageHandler),
        (r"/privacy", PrivacyHandler),
        (r"/myshade/(.*)", tornado.web.StaticFileHandler, {'path': savedir})
    ]

    application = web.Application(
        routers,
        **settings
    )
    application.listen(port, address=address)
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    root = path.dirname(__file__)
    serverport = port
    tornado.options.parse_config_file(path.join(root, "logging.conf"))
    load_app(serverport, root)
