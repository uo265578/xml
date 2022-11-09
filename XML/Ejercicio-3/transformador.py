import xml.etree.ElementTree as ET
import re
import numpy as np
import networkx as nx



G = nx.Graph()

tree_gxl = ET.parse(
    "/Users/HPwin11/Desktop/Informatica/Tercero/PrimerCuatri/SEW22y23/Practicas/XML/XML/Ejercicio3/archivo.gxl")
root_gxl = tree_gxl.getroot()
node_id = []
edge_attr = {}
# Parseamos los nodos
for i, node in enumerate(root_gxl.iter('node')):
    node_id += [node.get('id')]

node_id = np.array(node_id)
# Creamos matriz de adyacentes
am = np.zeros((len(node_id), len(node_id)))
# Parseamos edges
for edge in root_gxl.iter('edge'):
    s = np.where(node_id == edge.get('from'))[0][0]
    t = np.where(node_id == edge.get('to'))[0][0]

    # Obtiene el nodo de la actual edge para el valor nrl
    for node in edge:
        content = ET.tostring(node).decode("utf-8")
        # Obtiene el valor nrl via regex
        r1 = re.findall(r"\d.\d+", content)

        # Modifica el valor acorde a: (nlr*13.54)-13.54
        r1 = (float(r1[0])*13.54)-13.54

    # Añade el edge con el nodo original y el valor nlr al grafo
    G.add_edge(node_id[s], node_id[t], nlr=r1)   

print("\nNodos:\t")
print(G. nodes)
print("\nAristas:\t")
print(G. edges)