<%--
  Created by IntelliJ IDEA.
  User: JONATHAN
  Date: 22/10/2024
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>
<div class="flex justify-center items-center gap-6 w-full bg-white p-6">
    <div class="max-w-7xl mx-auto">

        <!-- Título principal -->
        <h1 class="text-3xl font-bold mb-2 text-start">Ecografías</h1>
        <!-- Contenedor principal -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Formulario de notas clínicas -->
            <div class="bg-femisalud-200 p-6 rounded-lg shadow-md max-h-screen overflow-y-auto">
                <h4 class="text-xl font-semibold mb-2 text-center">Registro de notas clínicas</h4>
                <p class="text-gray-600 text-start mb-6">Por favor, completa el formulario de notas clínicas de la ecografía realizada.</p>
                <div class="mb-4">
                    <label for="dni-paciente" class="block text-sm font-medium text-gray-700">DNI de la paciente:</label>
                    <input type="text" id="dni-paciente" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="id-ecografia" class="block text-sm font-medium text-gray-700">ID de la ecografía:</label>
                    <input type="text" id="id-ecografia" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="fecha-hora" class="block text-sm font-medium text-gray-700">Fecha y hora de la ecografía:</label>
                    <input type="datetime-local" id="fecha-hora" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="nota-clinica" class="block text-sm font-medium text-gray-700">Nota clínica de la ecografía:</label>
                    <textarea id="nota-clinica" rows="5" class="mt-1 block w-full border border-gray-300 no-resize rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></textarea>
                </div>

                <button class="bg-verde-400 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline justify-center">
                    Guardar datos
                </button>
            </div>

            <!-- Tabla de notas clínicas registradas -->
            <div class="flex flex-col">


                <!-- Nombre paciente -->
                <div class="bg-white p-4 rounded-lg shadow-md mb-4 flex justify-between items-center">
                    <select class="ml-4 border border-gray-300 rounded-md p-2">
                        <!-- Opciones de pacientes -->
                        <option>Briggite Martínez Vidaurre</option>
                        <option>Otro Paciente</option>
                    </select>
                    <button class="bg-femisalud-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Descargar
                    </button>
                </div>

                <!-- Tabla -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-lg font-semibold text-center mb-4">Notas clínicas registradas</h2>

                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white border border-gray-200">
                            <thead class="bg-femisalud-900 text-white">
                            <tr>
                                <th class="py-2 px-4 border-b">DNI de la paciente</th>
                                <th class="py-2 px-4 border-b">ID de la ecografía</th>
                                <th class="py-2 px-4 border-b">Fecha y hora de la ecografía</th>
                                <th class="py-2 px-4 border-b">Nota clínica</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="bg-blue-50">
                                <td class="py-2 px-4 border-b">87991810</td>
                                <td class="py-2 px-4 border-b">1</td>
                                <td class="py-2 px-4 border-b">22/06/2024 11:35</td>
                                <td class="py-2 px-4 border-b">Sin observación</td>
                            </tr>
                            <tr class="bg-white">
                                <td class="py-2 px-4 border-b">87991810</td>
                                <td class="py-2 px-4 border-b">2</td>
                                <td class="py-2 px-4 border-b">22/07/2024 09:50</td>
                                <td class="py-2 px-4 border-b">Sin observación</td>
                            </tr>
                            <tr class="bg-blue-50">
                                <td class="py-2 px-4 border-b">87991810</td>
                                <td class="py-2 px-4 border-b">3</td>
                                <td class="py-2 px-4 border-b">22/08/2024 10:10</td>
                                <td class="py-2 px-4 border-b">Sin observación</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <button class="bg-femisalud-900 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4 justify-center">
                        Editar datos
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</body>
</html>
