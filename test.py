# -*- coding: utf-8 -*-                                                                       
import unittest
import sys,os
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

def httpd():
    """trivial server for client testing"""
    addr=('127.0.0.1', 8888)
    print >>sys.stderr, 'listening:', ':'.join(map(str,addr))
    BaseHTTPServer.HTTPServer(addr, SimpleHTTPRequestHandler).serve_forever()

class TestOurl(unittest.TestCase):

    def setUp(self):
        pass

    # TODO: setup an oauth server to test against.

if __name__=='__main__':

    if 'httpd' in sys.argv:
        httpd()
    else:
        unittest.main()

