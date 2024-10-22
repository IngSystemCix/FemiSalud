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
<div class="flex flex-col justify-center items-center w-full min-h-screen bg-gray-100 p-6 overflow-hidden">
    <div class="max-w-xl mx-auto bg-white p-6 rounded-lg shadow-lg mt-10">
        <img src="https://s3-alpha-sig.figma.com/img/259f/f3f4/6eaff72a53f264d526eee09c422af776?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fQHOETbVOItFUC6xSijDtDHS26MCVvkYAAlZXvLhzCyZUJQVvlDycVpf3TDO4COIRG~jEEr8Ux3BxE4k6RIlgtCbBMlK9JWiS8LR6tnEyizuJzk71OKzEoOoWdy2gMVAQILjKd3JXNfO~P7eUpxk5ceOPgxrXasHAu7Yb1sMfC-3YDm2tHDYVHagGa81vKDn~jGJJnRJULkTcHcvYo13m2T48FgM0cEoVFnnC~WCffACYIv3eYB0Z4lFF93MuLsEkhI-pdp7omoDbzPvkOlvzOnVesrlq9NPeC~tJkc6RJDsfiGTlhO728LWKd~LY-KqvFMwPBbo4~3rErcM4thaoQ__" alt="FemiSalud Logo" class="w-48 mx-auto mb-4">

        <h1 class="text-center text-2xl font-bold text-blue-600 mb-6">Atención médica en FemiSalud</h1>
        <p class="text-center text-gray-700 mb-6">Tu opinión es muy valiosa para nosotros, FemiLover. Ayúdanos a mejorar completando este breve formulario sobre la atención que recibiste en FemiSalud. ¡Gracias por confiar en nosotros!</p>

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
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/atentionForm.js" defer></script>
</body>
</html>