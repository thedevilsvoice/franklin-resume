# -*- coding: utf-8 -*-

"""
  my_resume application
  
  Test like so: python3 -m pytest tests/
  :copyright: (c) by Franklin Diaz
  :license: MIT
"""

def test_myview(client):
    assert client.get('/').status_code == 200