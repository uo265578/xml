import xml.etree.ElementTree as ET
import codecs
import os

listaLineas = []
listaCirculos = []
destino = os.path.dirname(os.path.abspath(__file__))



def encontrarHijos(hijo, tam, nivel, centro, lineas):
    padre = True
    firstLevel = True
    for estudiante in hijo:
        if estudiante.tag == "estudiante":
            x = centro
            if padre:
                x -= tam - 200
                padre = False
            elif firstLevel and not(padre):
                x = centro
                nivel -= 300
                firstLevel = False
            elif not(firstLevel) and not(padre):
                x += tam - 200
                nivel += 300
            if lineas != None:
                listaLineas.append((nivel, x, lineas[0], lineas[1]))
            listaCirculos.append((x, nivel, estudiante))
            encontrarHijos(estudiante, tam / 2, nivel - 400, x, (x, nivel))

def procesarXML():
    arbol = ET.parse("/Users/HPwin11/Desktop/Informatica/Tercero/PrimerCuatri/SEW22y23/Practicas/XML/XML/Ejercicio2/Tarea2/estudiantes.xml")

    raiz = arbol.getroot()
    svg = """<?xml version="1.0" encoding="utf-8"?>
            <svg width="2500" height="1100" style="overflow:visible" version="1.1" xmlns="http://www.w3.org/2000/svg">"""
    encontrarHijos(raiz.findall("estudiante"), 1000, 800, 1600, None)
    for circulo in listaCirculos[::-1]:
        i = -100
        svg += (
            '<g><circulo cx="'
            + str(circulo[0])
            + '" cy="'
            + str(circulo[1])
            + '" r="80" style="fill:rgb(0, 26, 255);"/><text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i)
            + '" text-anchor="middle" font-size="14" style="fill:black">'
            + circulo[2].find("datos/nombre").text
            + " "
            + circulo[2].find("datos/apellido").text
            + "</text>"
            + '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i + 15)
            + '" text-anchor="middle" font-size="14" style="fill:black">'
        )

        svg += "</text>"
        i += 45
        svg += (
            '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + "</text>"
            '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i + 20)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + circulo[2].find("datos/lugar_nacimiento").text
            + "</text>"
            + '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i + 40)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + circulo[2]
            .find("datos/coordenadas_nacimiento/longitud").text
            + ","
            + circulo[2]
            .find("datos/coordenadas_nacimiento/latitud").text
            + " "
            + circulo[2]
            .find("datos/coordenadas_nacimiento/altitud").text
            + " m"
            + "</text>"
        )

        i += 70
        svg += (
            '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + "</text>"
            '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i + 20)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + circulo[2].find("datos/lugar_residencia").text
            + "</text>"
            + '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i + 40)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + circulo[2]
            .find("datos/coordenadas_residencia/longitud").text
            + ","
            + circulo[2]
            .find("datos/coordenadas_residencia/latitud").text
            + " "
            + circulo[2]
            .find("datos/coordenadas_residencia/altitud").text
            + " m"
            + "</text>"
        )

        i += 60
        svg += (
            '<a href="'
            + circulo[2].find("datos/fotografias").text.replace("&", "&amp;")
            + '"> '
            + '<text x="'
            + str(circulo[0])
            + '" y="'
            + str(circulo[1] + i)
            + '" text-anchor="middle" font-size="16" style="fill:black">'
            + "</text>"
            + "</a>"
        )

        if(circulo[2].find("datos/videos") != None):
            i += 20
            svg += (
                '<a href="'
                + circulo[2].find("datos/videos").text.replace("&", "&amp;")
                + '"> '
                + '<text x="'
                + str(circulo[0])
                + '" y="'
                + str(circulo[1] + i)
                + '" text-anchor="middle" font-size="16" style="fill:black">'
                + "</text>"
                + "</a>"
            )

        svg += "</g>"
    for line in listaLineas:
        svg += (
            '<line x1="'
            + str(line[2])
            + '" y1="'
            + str(line[3] - 135)
            + '" x2="'
            + str(line[1])
            + '" y2="'
            + str(line[0] + 135)
            + '" stroke="blue"/>'

        )

    svg += "</svg>"
    file = codecs.open(os.path.join(destino, "estudiantes.svg"), "w", "utf-8")
    file.write(svg)
    file.close()

    
    

def main():
    procesarXML()

if __name__ == '__main__':
    main()