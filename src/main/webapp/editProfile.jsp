<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 19/10/2024
  Time: 01:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen">
<!-- Ajusta el contenedor principal para que sidebar y main se distribuyan correctamente -->
<div class="flex w-full h-full bg-femisalud-300">
    <!-- Sidebar con ancho fijo -->
    <div class=" h-full w-64">
        <jsp:include page="fragment/sidebar.jsp"/>
    </div>

    <!-- Contenedor principal ajustado para ocupar el resto del espacio disponible -->
    <main class="bg-white h-full w-full flex justify-center items-center h-screen ">
        <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-lg">

            <!-- Título de la sección -->
            <h2 class="text-xl font-bold mb-4 text-blue-700 text-start">Perfil</h2>
            <p class="text-sm text-gray-600 mb-8 text-start">
                Si deseas cambiar algún dato de tu registro por motivos de robo u otra causa, a continuación puedes editar tu perfil.
            </p>

            <!-- Sección de datos personales con fondo ovalado y centrado -->
            <div class="bg-blue-100 p-6 rounded-3xl">
                <h3 class="text-lg font-bold text-blue-700 mb-6 text-center">Mis datos</h3>

                <!-- Nombre Completo -->
                <div class="flex justify-between items-center mb-4">
                    <label class="block font-semibold">Nombre completo:</label>
                    <p class="text-gray-800">Briggite Martinez Vidaurre</p>
                </div>

                <!-- DNI -->
                <div class="flex justify-between items-center mb-4">
                    <label class="block font-semibold">DNI:</label>
                    <p class="text-gray-800">87991810</p>
                </div>

                <!-- Teléfono (Editable) -->
                <div class="flex justify-between items-center mb-4">
                    <label for="telefono" class="block font-semibold">Teléfono:</label>
                    <input type="text" id="telefono" placeholder="Ingrese su teléfono" class="ml-4 p-2 w-1/2 border border-gray-300 rounded">
                </div>

                <!-- Correo Electrónico (Editable) -->
                <div class="flex justify-between items-center mb-6">
                    <label for="email" class="block font-semibold">Correo electrónico:</label>
                    <input type="email" id="email" placeholder="Ingrese su correo" class="ml-4 p-2 w-1/2 border border-gray-300 rounded">
                </div>

                <!-- Botones de acción centrados -->
                <div class="flex justify-center space-x-4">
                    <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Editar perfil</button>
                    <button class="bg-gray-300 text-gray-600 px-4 py-2 rounded cursor-not-allowed" disabled>Guardar datos</button>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</html>
