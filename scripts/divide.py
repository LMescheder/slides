import xml.etree.ElementTree as ET
import re
from argparse import ArgumentParser

parser = ArgumentParser('Divide svg into layers.')
parser.add_argument('input', type=str)
parser.add_argument('output', type=str)
args = parser.parse_args()


tree = ET.parse(args.input)
root = tree.getroot()

layers = [el for el in root if re.match('^({[^{}]*})+g$', el.tag)]

for layer in layers:
        root.remove(layer)

for i, layer in enumerate(layers):
    root.append(layer)
    tree.write(args.output % i)
    root.remove(layer)
