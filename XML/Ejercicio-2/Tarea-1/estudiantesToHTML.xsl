<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" version="5.0" encoding="utf-8" indent="yes"/>
    <xsl:template match="estudiantes">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html lang="es">
            <head>
                <title>
                    <xsl:text>Red social de estudiantes</xsl:text>
                </title>
                <meta name="description" content="Red social de estudiantes"/>
                <!-- PONER MAS-->
                <meta charset="UTF-8"/>
                <meta name="keywords" content="estudiantes, amigos, comentarios, residencia"/>
                <meta name="author" content="Santiago Fidalgo"/>
                <link rel="stylesheet" type="text/css" href="estilo.css"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:text>RED SOCIAL ESTUDIANTES</xsl:text>
                    </h1>
                    <h2>
                        <xsl:text>Listado de estudiantes</xsl:text>
                    </h2>
                </header>
                <main>
                    <xsl:for-each select="estudiante//datos">
                        <section class="estudiante">
                            <h3>
                                <xsl:value-of select="nombre"/>
                                <xsl:value-of select="apellido"/>
                            </h3>
                            <p>
                                <span class="subr">
                                    <xsl:text>Información de interés:</xsl:text>
                                </span>
                            </p>
                            <ul>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Apellido</xsl:text>
                                    </span>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="apellido"/>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Fecha de nacimiento</xsl:text>
                                    </span>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="fecha_nacimiento"/>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Lugar de nacimiento</xsl:text>
                                    </span>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="lugar_nacimiento"/>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Apellido</xsl:text>
                                    </span>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="apellido"/>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Coordenadas de nacimiento</xsl:text>
                                    </span>
                                    <xsl:text>:</xsl:text>
                                    <ul>
                                        <li>
                                            <xsl:text>Latitud: </xsl:text>
                                            <xsl:value-of select="coordenadas_nacimiento//latitud"/>
                                        </li>
                                        <li>
                                            <xsl:text>Longitud: </xsl:text>
                                            <xsl:value-of select="coordenadas_nacimiento//longitud"/>
                                        </li>
                                        <li>
                                            <xsl:text>Altitud: </xsl:text>
                                            <xsl:value-of select="coordenadas_nacimiento//altitud"/>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Lugar de residencia</xsl:text>
                                    </span>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="lugar_residencia"/>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Coordenadas de residencia</xsl:text>
                                    </span>
                                    <xsl:text>:</xsl:text>
                                    <ul>
                                        <li>
                                            <xsl:text>Latitud: </xsl:text>
                                            <xsl:value-of select="coordenadas_residencia//latitud"/>
                                        </li>
                                        <li>
                                            <xsl:text>Longitud: </xsl:text>
                                            <xsl:value-of select="coordenadas_residencia//longitud"/>
                                        </li>
                                        <li>
                                            <xsl:text>Altitud: </xsl:text>
                                            <xsl:value-of select="coordenadas_residencia//altitud"/>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Fotografías del estudiante</xsl:text>
                                    </span>
                                    <xsl:text>:</xsl:text>
                                    <p>
                                        Fotos:
                                    </p>
                                    <xsl:for-each select="fotografias//foto">
                                        <img src="{@url}" alt="{@url}" width="400" height="230"></img>
                                    </xsl:for-each>
                                </li>
                                <li>
                                    <span class="subr">
                                        <xsl:text>Comentario</xsl:text>
                                    </span>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="comentario"/>
                                </li>

                            </ul>
                            
						</section>
					</xsl:for-each>
				</main>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>