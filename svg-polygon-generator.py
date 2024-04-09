# Bibliotheken importieren
import math

# Fünfeck-Generator
def fiveStar(x_centerPoint, y_centerPoint):
    FiveStarPoints = []
    radius = int(input("\nWie groß soll der Radius vom Fünfeck sein? Bitte in einer Ganzzahl angeben.\nRadius:"))
    svg_points = ""
    for i in range(5):
        angle = math.radians(72 * i)
        x = x_centerPoint + radius * math.cos(angle)
        y = y_centerPoint + radius * math.sin(angle)
        FiveStarPoints.append(round(x))
        FiveStarPoints.append(round(y))
        svg_points = svg_points + str(round(x, 1)) + " " + str(round(y, 1)) + " "
    fivestar_svg_notation = "<polygon points=\"" + svg_points + "\"/>"
    return fivestar_svg_notation

# Funktion, welche jegliche regelmäßigen Polygone mit beliebigen Eckenanzahlen generiert
def anyPolygon(x_centerPoint, y_centerPoint, sides, radius): # sides sind hier die Ecken
    points = []
    # radius = int(input(f"\nWie groß soll der Radius vom {sides}-Eck sein? Bitte in einer Ganzzahl angeben.\nRadius: "))
    svg_points = ""
    angle_step = 360 / sides
    for i in range(sides):
        angle = math.radians(angle_step * i)
        x = x_centerPoint + radius * math.cos(angle)
        y = y_centerPoint + radius * math.sin(angle)
        points.append(x)
        points.append(y)
        svg_points = svg_points + str(round(x, 1)) + " " + str(round(y, 1)) + " "
    polygon_svg_notation = "<polygon points=\"" + svg_points + "\"/>"
    return polygon_svg_notation

# Funktion, welche jegliche Sterne mit beliebigen Eckenanzahlen generiert
def anyStar(x_centerPoint, y_centerPoint, sides, inner_radius, outer_radius): # sides sind hier die Ecken
    svg_points = ""
    angle_step = math.pi / sides
    for i in range(sides * 2):
        if i % 2 == 0:
            radius = outer_radius
        else:
            radius = inner_radius
        angle = angle_step * i
        x = x_centerPoint + radius * math.cos(angle)
        y = y_centerPoint + radius * math.sin(angle)
        svg_points = svg_points + str(round(x, 1)) + " " + str(round(y, 1)) + " "
    polygon_svg_notation = "<polygon points=\"" + svg_points + "\"/>"
    return polygon_svg_notation


# Anfang der .svg-Datei
finalSVGcode = "<svg width='1000' height='1000'>"

# verschiedene regelmäßige Polygone
# anyPolygon(x-Koordinate vom Mittelpunkt, y-Koordinate vom Mittelpunkt, Eckenanzahl, Radius)
finalSVGcode += "\n\t" + anyPolygon(100, 100, 8, 50)
finalSVGcode += "\n\t" + anyPolygon(550, 500, 10, 150)
finalSVGcode += "\n\t" + anyPolygon(200, 800, 15, 150)
finalSVGcode += "\n\t" + anyPolygon(800, 200, 18, 150)
finalSVGcode += "\n\t" + anyPolygon(200, 500, 30, 150)

# verschiedene regelmäßige Sterne
# anyStar(x-Koordinate vom Mittelpunkt, y-Koordinate vom Mittelpunkt, Eckenanzahl, innerer Radius, äußerer Radius)
finalSVGcode += "\n\t" + anyStar(300, 200, 5, 50, 100)
finalSVGcode += "\n\t" + anyStar(850, 550, 30, 100, 150)
finalSVGcode += "\n\t" + anyStar(850, 830, 30, 100, 130)

# Ende der .svg-Datei
finalSVGcode += "\n</svg>"
print(finalSVGcode)

add_stars = ""
# add_stars += "\n\t" + anyStar(100, 100, 15, 30, 60) 
# add_stars += "\n\t" + anyStar(300, 300, 5, 25, 50)
# add_stars += "\n\t" + anyStar(500, 225, 10, 50, 100)
# add_stars += "\n\t" + anyStar(750, 150, 10, 70, 100) 
# add_stars += "\n\t" + anyStar(1000, 200, 15, 50, 70) 
# add_stars += "\n\t" + anyStar(1300, 100, 7, 35, 70) 
# add_stars += "\n\t" + anyStar(1600, 300, 30, 60, 80) 
# add_stars += "\n\t" + anyStar(1800, 150, 8, 50, 70) 

# SVG-Code in eine .svg-Datei schreiben und speichern
with open('generatedSVG.svg','w') as file:
    file.write(finalSVGcode)


# einfachste lösung, die Sterne zur Datei, hinzuzufügen, man muss aber immer den svg-Tag von vorher löschen und die bereits hinzugefügten Sterne auskommentieren. 
with open("ueb5_nuernberg.svg", "a") as file:
    # file.write(add_stars)
    file.write("\n</svg>")