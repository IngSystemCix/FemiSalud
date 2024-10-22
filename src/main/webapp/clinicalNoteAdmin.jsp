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
<div class="flex justify-center items-center gap-6 w-full min-h-screen bg-gray p-6">
    <div class="max-w-6xl mx-auto bg-white p-8 shadow-lg rounded-lg">
        <h1 class="text-2xl font-bold mb-6">Ecografías</h1>
        <p class="mb-4">Por favor, completa el formulario de notas clínicas de la ecografía realizada, asegurando que las observaciones relevantes estén correctamente registradas.</p>

        <div class="flex justify-between space-x-8">
            <!-- Formulario de ecografía -->
            <div class="bg-blue-50 p-6 rounded-lg w-1/2">
                <form>
                    <div class="mb-4">
                        <label for="dni" class="block text-sm font-medium text-gray-700">DNI de la paciente:</label>
                        <select id="dni" class="mt-1 block w-full px-3 py-2 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option>87991810</option>
                            <!-- Puedes agregar más opciones aquí -->
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="id-ecografia" class="block text-sm font-medium text-gray-700">ID de la ecografía:</label>
                        <input type="text" id="id-ecografia" class="mt-1 block w-full px-3 py-2 border border-gray-300 bg-gray-100 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" readonly value="Auto generado">
                    </div>

                    <div class="mb-4">
                        <label for="fecha-ecografia" class="block text-sm font-medium text-gray-700">Fecha y hora de la ecografía:</label>
                        <input type="text" id="fecha-ecografia" class="mt-1 block w-full px-3 py-2 border border-gray-300 bg-gray-100 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" readonly value="Auto generado">
                    </div>

                    <div class="mb-4">
                        <label for="nota-clinica" class="block text-sm font-medium text-gray-700">Nota clínica de la ecografía:</label>
                        <textarea id="nota-clinica" rows="5" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">Ecografía compatible con embarazo de 24 semanas, biometría fetal acorde a la edad gestacional, líquido amniótico y placenta sin alteraciones aparentes. Feto en presentación cefálica y actividad cardiaca normal.</textarea>
                    </div>

                    <div class="flex justify-between">
                        <button type="button" class="bg-green-500 text-white px-4 py-2 rounded-lg shadow hover:bg-green-600">Guardar datos</button>
                        <button type="button" class="bg-red-500 text-white px-4 py-2 rounded-lg shadow hover:bg-red-600">Regresar</button>
                    </div>
                </form>
            </div>

            <!-- Tabla de notas clínicas registradas -->
            <div class="">
                <h2 class="text-xl font-semibold mb-4">Notas clínicas registradas</h2>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white border border-gray-200 shadow-lg rounded-lg">
                        <thead class="bg-blue-800 text-white uppercase text-sm leading-normal">
                        <tr>
                            <th class="py-3 px-6 text-left">DNI de la paciente</th>
                            <th class="py-3 px-6 text-left">ID de la ecografía</th>
                            <th class="py-3 px-6 text-left">Fecha y hora de la ecografía</th>
                            <th class="py-3 px-6 text-left">Nota clínica</th>
                        </tr>
                        </thead>
                        <tbody class="text-black text-sm font-bold">
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left">87991810</td>
                            <td class="py-3 px-6 text-left">1</td>
                            <td class="py-3 px-6 text-left">22/06/2024 11:35</td>
                            <td class="py-3 px-6 text-left">Ninguna</td>
                        </tr>
                        <tr class="border-b border-gray-200 bg-blue-100 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left">87991810</td>
                            <td class="py-3 px-6 text-left">2</td>
                            <td class="py-3 px-6 text-left">22/07/2024 09:50</td>
                            <td class="py-3 px-6 text-left">Ninguna</td>
                        </tr>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left">87991810</td>
                            <td class="py-3 px-6 text-left">3</td>
                            <td class="py-3 px-6 text-left">22/08/2024 10:10</td>
                            <td class="py-3 px-6 text-left">Ninguna</td>
                        </tr>
                        <!-- Agrega más filas aquí según sea necesario -->
                        </tbody>
                    </table>
                </div>

                <!-- Botón de editar datos -->
                <div class="mt-6">
                    <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-lg shadow hover:bg-blue-600">Editar datos</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</body>
</html>
