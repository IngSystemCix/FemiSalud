<%--
  Created by IntelliJ IDEA.
  User: JONATHAN
  Date: 25/10/2024
  Time: 15:37
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
<div class="flex justify-center items-center gap-6 w-full min-h-screen bg-femisalud-100 p-6">
    <div class="max-w-7xl mx-auto">
        <!-- Título principal -->
        <h1 class="text-3xl font-bold mb-4">Pacientes</h1>
        <p class="text-gray-600 mb-6">Por favor, completa el formulario del registro de pacientes.</p>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Formulario de registro de pacientes -->
            <div class="bg-femisalud-200 p-6 rounded-lg shadow-md">
                <div class="mb-4">
                    <label for="dni" class="block text-sm font-medium text-gray-700">DNI de la paciente:</label>
                    <input type="text" id="dni" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre:</label>
                    <input type="text" id="nombre" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="apellido-paterno" class="block text-sm font-medium text-gray-700">Apellido paterno:</label>
                    <input type="text" id="apellido-paterno" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="apellido-materno" class="block text-sm font-medium text-gray-700">Apellido materno:</label>
                    <input type="text" id="apellido-materno" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Correo Electrónico:</label>
                    <input type="email" id="email" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <div class="mb-4">
                    <label for="fecha-nacimiento" class="block text-sm font-medium text-gray-700">Fecha de nacimiento:</label>
                    <input type="date" id="fecha-nacimiento" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <button onclick="guardarDatos()" class="bg-verde-400 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full">
                    Guardar datos
                </button>
            </div>

            <!-- Sección de pacientes registradas y botón -->
            <div>
                <div class="flex justify-end mb-4">
                    <button class="bg-femisalud-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Registrar ecografía
                    </button>
                </div>

                <!-- Tabla de pacientes registrados -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-lg font-semibold text-center mb-4">Pacientes registradas</h2>

                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white border border-gray-200">
                            <thead class="bg-blue-500 text-white">
                            <tr>
                                <th class="py-2 px-4 border-b">DNI de la paciente</th>
                                <th class="py-2 px-4 border-b">Nombre</th>
                                <th class="py-2 px-4 border-b">Apellido paterno</th>
                                <th class="py-2 px-4 border-b">Apellido materno</th>
                                <th class="py-2 px-4 border-b">Correo Electrónico</th>
                            </tr>
                            </thead>
                            <tbody id="tabla-pacientes">
                            <tr class="bg-blue-50">
                                <td class="py-2 px-4 border-b">87991810</td>
                                <td class="py-2 px-4 border-b">Briggite</td>
                                <td class="py-2 px-4 border-b">Martínez</td>
                                <td class="py-2 px-4 border-b">Vidaurre</td>
                                <td class="py-2 px-4 border-b">briggite@example.com</td>
                            </tr>
                            <!-- Las nuevas filas se insertarán aquí -->
                            </tbody>
                        </table>
                    </div>

                    <button class="bg-femisalud-900 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4 w-[30%]">
                        Editar datos
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/savePatientAdmin.js" defer></script>
</body>
</html>
