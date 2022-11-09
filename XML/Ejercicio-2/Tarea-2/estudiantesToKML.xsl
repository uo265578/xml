<?xml version="1.0" encoding="UTF-8"?>
<!-- TRANSFORMO EL XML A KML CON ESTE ARCHIVO XSL UTILIZANDO LA PÁGINA
	https://www.freeformatter.com/xsl-transformer.html -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="estudiantes">
	<kml xmlns="http://www.opengis.net/kml/2.2">
		<Document>
			<xsl:for-each select="estudiante//datos">
				<Folder>
					<name><xsl:value-of select="@nombre"/></name>
					<Placemark>
						<name><xsl:value-of select="lugar_nacimiento"/></name>
						<Point>
							<coordinates><xsl:value-of select="coordenadas_nacimiento//longitud"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="coordenadas_nacimiento//latitud"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="coordenadas_nacimiento//altitud"/></coordinates>
						</Point>
					</Placemark>
                    <Placemark>
						<name><xsl:value-of select="lugar_residencia"/></name>
						<Point>
							<coordinates><xsl:value-of select="coordenadas_nacimiento//longitud"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="coordenadas_residencia//latitud"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="coordenadas_residencia//altitud"/></coordinates>
						</Point>
					</Placemark>
					<Placemark>
						<name><xsl:value-of select="@nombre"/></name>
						<LineString>
							<coordinates>
								<xsl:value-of select="coordenadas_nacimiento//longitud"/>
								<xsl:text>,</xsl:text>
								<xsl:value-of select="coordenadas_nacimiento//latitud"/>
								<xsl:text>,</xsl:text>
								<xsl:value-of select="coordenadas_nacimiento//altitud"/>
								<xsl:text>	</xsl:text>
                                <xsl:value-of select="coordenadas_residencia//longitud"/>
								<xsl:text>,</xsl:text>
								<xsl:value-of select="coordenadas_residencia//latitud"/>
								<xsl:text>,</xsl:text>
								<xsl:value-of select="coordenadas_residencia//altitud"/>
								<xsl:text>	</xsl:text>
								<xsl:for-each select="estudiantes//estudiante//datos">
									<xsl:value-of select="coordenadas//longitud"/>
									<xsl:text>,</xsl:text>
									<xsl:value-of select="coordenadas//latitud"/>
									<xsl:text>,</xsl:text>
									<xsl:value-of select="coordenadas//altitud"/>
									<xsl:text>	</xsl:text>
								</xsl:for-each>
							</coordinates>
						</LineString>
					</Placemark>
				</Folder>
			</xsl:for-each>
		</Document>
	</kml>
	</xsl:template>
</xsl:stylesheet>