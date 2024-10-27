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
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Formulario de registro de pacientes -->
            <div class="bg-femisalud-200 p-6 rounded-lg shadow-md">
                <h4 class="text-xl font-semibold mb-2 text-center">Registro de pacientes</h4>
                <p class="text-gray-600 text-start mb-6">Por favor, completa el formulario de notas clínicas de la ecografía realizada.</p>
                <!-- DNI de la paciente -->
                <div class="mb-4">
                    <label for="dni" class="block text-sm font-medium text-gray-700">DNI de la paciente:</label>
                    <input type="text" id="dni" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Nombre de la paciente -->
                <div class="mb-4">
                    <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre de la paciente:</label>
                    <input type="text" id="nombre" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Apellido paterno de la paciente -->
                <div class="mb-4">
                    <label for="apellido-paterno" class="block text-sm font-medium text-gray-700">Apellido paterno de la paciente:</label>
                    <input type="text" id="apellido-paterno" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Apellido materno de la paciente -->
                <div class="mb-4">
                    <label for="apellido-materno" class="block text-sm font-medium text-gray-700">Apellido materno de la paciente:</label>
                    <input type="text" id="apellido-materno" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Teléfono de la paciente -->
                <div class="mb-4">
                    <label for="telefono" class="block text-sm font-medium text-gray-700">Teléfono de la paciente:</label>
                    <input type="tel" id="telefono" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Email de la paciente -->
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email de la paciente:</label>
                    <input type="email" id="email" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Fecha de nacimiento de la paciente -->
                <div class="mb-4">
                    <label for="fecha-nacimiento" class="block text-sm font-medium text-gray-700">Fecha de nacimiento de la paciente:</label>
                    <input type="date" id="fecha-nacimiento" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Bebé en gestión -->
                <div class="mb-4">
                    <label for="bebe-gestion" class="block text-sm font-medium text-gray-700">Bebé en gestión:</label>
                    <select id="bebe-gestion" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                        <option value="UNICO">ÚNICO</option>
                        <option value="TRILLIZOS">TRILLIZOS</option>
                        <option value="MELLIZOS">MELLIZOS</option>
                        <option value="GEMELOS">GEMELOS</option>
                    </select>
                </div>

                <button onclick="guardarDatos()" class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full">
                    Guardar datos
                </button>
            </div>

            <!-- Sección de pacientes registradas y botón -->
            <div>
                <div class="flex justify-end mb-4">
                    <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
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
                                <th class="py-2 px-4 border-b">DNI</th>
                                <th class="py-2 px-4 border-b">Nombre</th>
                                <th class="py-2 px-4 border-b">Apellido paterno</th>
                                <th class="py-2 px-4 border-b">Apellido materno</th>
                                <th class="py-2 px-4 border-b">Teléfono</th>
                                <th class="py-2 px-4 border-b">Email</th>
                                <th class="py-2 px-4 border-b">Bebé en gestión</th>
                            </tr>
                            </thead>
                            <tbody id="tabla-pacientes">
                            <!-- Las nuevas filas se insertarán aquí -->
                            </tbody>
                        </table>
                    </div>

                    <button class="bg-blue-700 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4 w-[30%]">
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
