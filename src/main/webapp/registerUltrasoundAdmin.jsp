<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 27/10/2024
  Time: 04:32
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
    <div class="flex space-x-8">
        <h1 class="text-3xl font-bold mb-2 text-start">Pacientes</h1>
        <!-- Formulario de Registro -->
        <div class="bg-blue-100 p-6 rounded-lg w-1/3">
            <h2 class="text-xl font-bold text-blue-700 mb-4 text-center">Registro de ecografías</h2>
            <p class="text-sm mb-4 text-start">Por favor, completa el formulario del registro de ecografías de la paciente.</p>

            <form id="ecografiaForm">
                <label class="block mb-2 text-sm">Fecha y hora de la ecografía:</label>
                <input type="datetime-local" id="fecha" class="w-full p-2 mb-4 border rounded" required>

                <label class="block mb-2 text-sm">Tipo de evaluación:</label>
                <input type="text" id="evaluacion" class="w-full p-2 mb-4 border rounded" required>

                <label class="block mb-2 text-sm">Tipo de ecografía:</label>
                <input type="text" id="tipo" class="w-full p-2 mb-4 border rounded" required>

                <label class="block mb-2 text-sm">URL de la ecografía:</label>
                <input type="url" id="url" class="w-full p-2 mb-4 border rounded" required>

                <label class="block mb-2 text-sm">DNI de la paciente:</label>
                <select id="dni" class="w-full p-2 mb-4 border rounded" required>
                    <option value="" disabled selected>Seleccione un DNI</option>
                    <option value="87991810">87991810</option>
                    <option value="76834522">76834522</option>
                    <option value="65473829">65473829</option>
                    <!-- Agrega más opciones de DNI aquí -->
                </select>

                <button type="button" onclick="guardarDatos()" class="w-full bg-green-500 text-white py-2 rounded hover:bg-green-600">
                    Guardar datos
                </button>
            </form>
        </div>

        <!-- Tabla de Ecografías Registradas -->
        <div class="w-2/3">
            <h2 class="text-xl font-bold text-blue-700 mb-4">Ecografías registradas</h2>
            <div class="overflow-x-auto bg-white rounded-lg shadow">
                <table class="min-w-full bg-white">
                    <thead>
                    <tr class="w-full bg-blue-600 text-white">
                        <th class="py-2 px-4 text-left">Fecha y hora de la ecografía</th>
                        <th class="py-2 px-4 text-left">URL de la ecografía</th>
                        <th class="py-2 px-4 text-left">DNI de la paciente</th>
                    </tr>
                    </thead>
                    <tbody id="tablaEcografias" class="text-gray-700">
                    <!-- Los datos se agregarán aquí -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/registerUltrasoundAdmin.js" defer></script>
</body>
</html>