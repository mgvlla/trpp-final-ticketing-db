import os
import sys
sys.path.insert(0, os.path.abspath('../../'))

# Configuration file for the Sphinx documentation builder.

project = 'trpp-final-ticketing-db'
copyright = '2026, Магомедова Лолита, Багирян Марьям, Гаврилова Софья'
author = 'Магомедова Лолита, Багирян Марьям, Гаврилова Софья'
release = '1.0.0'

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
]

templates_path = ['_templates']
exclude_patterns = []

language = 'ru'

html_theme = 'alabaster'
html_static_path = ['_static']
