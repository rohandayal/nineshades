#!/usr/bin/python

from os import path, environ

from tornado import web, ioloop, gen

from handlers import *

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
    ]

    application = web.Application(
        routers,
        **settings
    )
    application.listen(port)
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    root = path.dirname(__file__)
    port = 10101
    load_app(port, root)
