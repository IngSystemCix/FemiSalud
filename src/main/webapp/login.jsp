<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 21/10/2024
  Time: 04:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body>
<div class="flex h-screen items-center justify-center">
    <div class="bg-white rounded-lg shadow-md flex">
        <!-- Columna izquierda (Formulario de inicio de sesión) -->
        <div class="w-1/2 p-10"> <!-- Aumenté el padding -->
            <h1 class="text-5xl font-bold text-blue-700 mb-8">FemiSalud</h1> <!-- Aumenté el tamaño del texto -->
            <h2 class="text-2xl font-semibold mb-6">Inicio de sesión</h2> <!-- Aumenté el tamaño del texto -->
            <form action="#" method="POST" class="space-y-6"> <!-- Aumenté el espacio entre los elementos -->
                <input type="text" placeholder="Ingrese DNI" class="block w-full p-4 border rounded-lg text-xl focus:outline-none focus:ring-2 focus:ring-blue-500"> <!-- Aumenté el padding y el tamaño del texto -->
                <div class="flex space-x-6"> <!-- Aumenté el espacio entre botones -->
                    <button type="button" class="w-1/2 bg-gray-300 text-gray-500 py-3 text-lg rounded-lg">Obtener código</button> <!-- Aumenté el tamaño del botón -->
                    <button type="submit" class="w-1/2 bg-gray-300 text-gray-500 py-3 text-lg rounded-lg">Iniciar sesión</button> <!-- Aumenté el tamaño del botón -->
                </div>
                <button type="button" class="w-full bg-gray-300 text-gray-500 py-3 text-lg rounded-lg">Regresar</button> <!-- Aumenté el tamaño del botón -->
            </form>
        </div>
        <!-- Columna derecha (Imagen y título) -->
        <div class="relative w-1/2 bg-blue-700 flex flex-col items-center justify-center rounded-3xl m-5"> <!-- Aumenté el margen -->
            <!-- Título arriba -->
            <div class="absolute top-8 text-center text-white"> <!-- Ajusté la posición -->
                <h3 class="text-2xl font-semibold">Especialistas en Salud de la Mujer</h3> <!-- Aumenté el tamaño del texto -->
            </div>
            <!-- Imagen sobre el círculo blanco, centrado -->
            <div class="flex justify-center items-center h-full mt-20">
                <div class="bg-white rounded-full w-44 h-44 flex items-center justify-center">
                    <img src="https://s3-alpha-sig.figma.com/img/4682/1721/a59d6cdd74660e1e005268cb1eb66ee1?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=d97X9KKobXFT1AeKWDoY8KY6uXFR-0nYI6AazOnI1C2WlJML8kA2AI-5GjDRIgZe~mLEDXozqEagPCOW6sWw0~giHYsxYy2pFqmak2X6gx9W4KJ6zkX~STvBlqLVbHnJiXevjkP-2fqfMzTGkbO92sQf8vmnc4WBKBtbzKPqNEf3E0oUq9VrP2lg4CRw-WlheO5Y7zIJvGBGxllXEXY3JRqWw7OUNVT5AXYmBgtGErL7jr0gEI-SmglHQ5mFW4sAfPstwEfBKQU~RgbuOjKupCAxlppQoqvS6s2T~0Zvv4mfjTUMA-SNoVWruVnVNDBvc1B-Iy1aTuSdFEnHpi24bQ__" alt="Mamá" class=" absolute rounded-full w-92">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>