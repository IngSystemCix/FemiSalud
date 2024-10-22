<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 21/10/2024
  Time: 06:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>
<main class="flex flex-col justify-center items-center w-full bg-white">
    <div class="w-full p-6 rounded-lg">
        <div class="w-full flex justify-end items-end mb-4">
            <img src="${pageContext.request.contextPath}/assets/img/femisalud_blue.png" alt="FemiSalud Logo" class="w-48 mx-auto">
        </div>

        <h1 class="text-center text-2xl font-bold text-blue-600 mb-6">Atención médica en FemiSalud</h1>

        <div class="w-full flex flex-col justify-center items-start mb-6">
            <p class="text-center text-femisalud-600 font-bold">
                Tu opinión es muy valiosa para nosotros, FemiLover. Ayúdanos a mejorar completando este breve formulario sobre la atención que recibiste en FemiSalud.
            </p>
            <p class="text-center text-femisalud-600 font-bold">
                ¡Gracias por confiar en nosotros!
            </p>
        </div>

        <form>
            <!-- Pregunta 1 -->
            <div class="mb-4">
                <label class="block text-gray-700 font-semibold mb-2">
                    1. ¿Cómo calificarías la atención recibida por el médico?
                    <span class="text-gray-500 text-sm">(1 estrella = Muy insatisfecha, 5 estrellas = Muy satisfecha)</span>
                </label>
                <div class="flex space-x-1 stars" data-rating="0">
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="1">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="2">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="3">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="4">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="5">star</span>
                    <input type="hidden" name="atencion_medico" id="atencion_medico">
                </div>
            </div>

            <!-- Pregunta 2 -->
            <div class="mb-4">
                <label class="block text-gray-700 font-semibold mb-2">
                    2. ¿Cómo calificarías la empatía, respeto y atención del personal durante tu visita?
                    <span class="text-gray-500 text-sm">(1 estrella = Muy insatisfecha, 5 estrellas = Muy satisfecha)</span>
                </label>
                <div class="flex space-x-1 stars" data-rating="0">
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="1">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="2">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="3">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="4">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="5">star</span>
                    <input type="hidden" name="empatia_personal" id="empatia_personal">
                </div>
            </div>

            <!-- Pregunta 3 -->
            <div class="mb-4">
                <label class="block text-gray-700 font-semibold mb-2">
                    3. ¿Cómo calificarías la claridad de la comunicación del personal médico y de atención?
                    <span class="text-gray-500 text-sm">(1 estrella = Muy insatisfecha, 5 estrellas = Muy satisfecha)</span>
                </label>
                <div class="flex space-x-1 stars" data-rating="0">
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="1">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="2">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="3">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="4">star</span>
                    <span class="material-icons cursor-pointer text-gray-300 hover:text-yellow-400 star" data-value="5">star</span>
                    <input type="hidden" name="comunicacion_personal" id="comunicacion_personal">
                </div>
            </div>

            <!-- Pregunta 4 -->
            <div class="mb-4">
                <label class="block text-gray-700 font-semibold mb-2">
                    4. ¿Qué aspectos de la atención te parecieron más satisfactorios?
                </label>
                <div class="space-y-2">
                    <label class="block">
                        <input type="checkbox" name="aspectos_atencion" value="Amabilidad del personal" class="mr-2">
                        Amabilidad del personal
                    </label>
                    <label class="block">
                        <input type="checkbox" name="aspectos_atencion" value="Claridad de la explicación médica" class="mr-2">
                        Claridad de la explicación médica
                    </label>
                    <label class="block">
                        <input type="checkbox" name="aspectos_atencion" value="Tiempo de espera" class="mr-2">
                        Tiempo de espera
                    </label>
                    <label class="block">
                        <input type="checkbox" name="aspectos_atencion" value="Limpieza de las instalaciones" class="mr-2">
                        Limpieza de las instalaciones
                    </label>
                    <label class="block">
                        <input type="text" name="aspectos_atencion_otras" placeholder="Otras..." class="w-full border border-gray-300 rounded-md">
                    </label>
                </div>
            </div>

            <!-- Botones -->
            <div class="flex justify-between">
                <button type="button" class="bg-red-500 text-white px-4 py-2 rounded-md">Salir del formulario</button>
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-md">Enviar formulario</button>
            </div>
        </form>
    </div>
</main>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/atentionForm.js"></script>
</body>
</html>