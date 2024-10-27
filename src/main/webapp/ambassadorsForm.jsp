<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 14/10/2024
  Time: 05:38
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
<div class="flex flex-col ml-10 justify-center items-center gap-6 w-full min-h-screen bg-white p-6 overflow-hidden">
    <h1 class="text-3xl font-bold text-center text-black mb-2">Bienvenida, embajadora de la prevención</h1>
    <h2 class="text-center text-black text-sm mb-8">Ayuda a tus amigas a cuidar su salud y recibe beneficios exclusivos.</h2>

    <!-- Contenedor de formularios -->
    <div id="form-container" class="w-full h-auto flex overflow-x-auto overflow-hidden gap-3 pb-4">
        <div class="max-w-md mx-auto">
            <form class="w-96 bg-femisalud-300 border border-gray-300 text-gray-900 text-sm pt-12 pb-10 px-10 shadow-lg dark:bg-femisalud-600 dark:border-gray-600 dark:text-white rounded-b-lg rounded-t-[800px]">
                <h2 class="text-center font-bold text-3xl mb-5 text-femisalud-600 dark:text-femisalud-100">Invitada 1</h2>

                <div class="mb-6">
                    <label for="input_full_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nombre Completo</label>
                    <input type="text" id="input_full_name"
                           class="bg-femisalud-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </div>

                <div class="mb-6">
                    <label for="input_dni" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">DNI</label>
                    <input type="text" id="input_dni"
                           class="bg-femisalud-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </div>

                <div class="mb-6">
                    <label for="input_telefono" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Teléfono</label>
                    <input type="text" id="input_telefono"
                           class="bg-femisalud-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </div>

                <div class="mb-6">
                    <label for="input_email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Correo electrónico</label>
                    <input type="text" id="input_email"
                           class="bg-femisalud-100 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </div>
            </form>
        </div>
    </div>

    <!-- Botones de acción -->
    <div class="flex justify-center mt-8 space-x-4">
        <button class="bg-red-600 text-white px-6 py-2 rounded-lg">Salir del formulario</button>
        <button id="add-invitee-btn" class="bg-femisalud-900 text-white px-6 py-2 rounded-lg">Agregar invitada</button>
        <button class="bg-verde-400 text-white px-6 py-2 rounded-lg">Guardar datos</button>
    </div>
</div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/addForm.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</body>
</html>
