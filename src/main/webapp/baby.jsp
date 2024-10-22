<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 21/10/2024
  Time: 07:04
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
<main class="flex ml-10 justify-center items-start gap-6 w-full h-lvh">
    <!-- Sidebar de Filtros -->
    <div class="w-full p-6 bg-gradient-to-r from-white via-white to-transparent">
        <h1 class="text-2xl font-bold mb-4">Bebé</h1>
        <p class="text-gray-600 mb-6">Filtra y escoge el nombre ideal para tu bebé.</p>

        <div>
            <h2 class="font-bold mb-2">Filtrar por</h2>

            <!-- Seleccionar -->
            <div class="mb-4">
                <h3 class="font-semibold">Seleccionar</h3>
                <button class="bg-blue-500 text-white py-2 px-4 rounded mt-2 mr-2">Todos los nombres</button>
                <button class="border border-gray-300 text-blue-500 py-2 px-4 rounded">Favoritos</button>
            </div>

            <!-- Género -->
            <div class="mb-4">
                <h3 class="font-semibold">Género</h3>
                <button class="bg-blue-500 text-white py-2 px-4 rounded mt-2 mr-2">Niña</button>
                <button class="border border-gray-300 text-blue-500 py-2 px-4 rounded">Niño</button>
            </div>

            <!-- Tema -->
            <div class="mb-4">
                <h3 class="font-semibold">Tema</h3>
                <div class="grid grid-cols-3 gap-2">
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/tierno.png" alt="Tierno" class="mx-auto w-16 h-16">
                        Tierno</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/biblico.png" alt="Bíblico" class="mx-auto w-16 h-16">
                        Bíblico</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/realeza.png" alt="Realeza" class="mx-auto w-16 h-16">
                        Realeza</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/literatura.png" alt="Literatura" class="mx-auto w-16 h-16">
                        Literatura</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/colores.png" alt="Colores" class="mx-auto w-16 h-16">
                        Colores</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/flores.png" alt="Flores" class="mx-auto w-16 h-16">
                        Flores</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/mitologia.png" alt="Mitología" class="mx-auto w-16 h-16">
                        Mitología</button>
                    <button class="border border-gray-300 p-2 text-center rounded">
                        <img src="${pageContext.request.contextPath}/assets/img/naturaleza.png" alt="Naturaleza" class="mx-auto w-16 h-16">
                        Naturaleza</button>
                </div>
            </div>

            <div class="mb-4">
                <h3 class="font-semibold">Empieza con la letra</h3>
                <select id="startLetter" class="w-full border border-gray-300 rounded p-2 mt-2"></select>
            </div>

            <div class="mb-4">
                <h3 class="font-semibold">Termina con la letra</h3>
                <select id="endLetter" class="w-full border border-gray-300 rounded p-2 mt-2"></select>
            </div>
        </div>
    </div>

    <!-- Resultados -->
    <div class="w-full flex flex-col justify-center items-center gap-12 bg-white p-6">
        <h1 class="text-2xl font-bold">Resultados</h1>
        <table class="w-full bg-white rounded-lg shadow-lg overflow-hidden">
            <thead class="bg-blue-700 text-white">
            <tr>
                <th class="py-2 px-4">Favoritos</th>
                <th class="py-2 px-4">Género</th>
                <th class="py-2 px-4">Nombre del bebé</th>
                <th class="py-2 px-4">Cantidad</th>
            </tr>
            </thead>
            <tbody>
            <!-- Fila 1 -->
            <tr class="bg-white">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center text-2xl font-bold">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">María</td>
                <td class="py-2 px-4 text-center">67</td>
            </tr>
            <!-- Fila 2 -->
            <tr class="bg-blue-100">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Martha</td>
                <td class="py-2 px-4 text-center">45</td>
            </tr>
            <!-- Fila 3 -->
            <tr class="bg-white">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Marcia</td>
                <td class="py-2 px-4 text-center">38</td>
            </tr>
            <!-- Fila 4 -->
            <tr class="bg-blue-100">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold text-start">Martina</td>
                <td class="py-2 px-4 text-center">36</td>
            </tr>
            <!-- Fila 5 -->
            <tr class="bg-white">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Mariela</td>
                <td class="py-2 px-4 text-center">29</td>
            </tr>
            <!-- Fila 6 -->
            <tr class="bg-blue-100">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Matilda</td>
                <td class="py-2 px-4 text-center">18</td>
            </tr>
            <!-- Fila 7 -->
            <tr class="bg-white">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Macarena</td>
                <td class="py-2 px-4 text-center">16</td>
            </tr>
            <!-- Fila 8 -->
            <tr class="bg-blue-100">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Magdalena</td>
                <td class="py-2 px-4 text-center">13</td>
            </tr>
            <!-- Fila 9 -->
            <tr class="bg-white">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Mariana</td>
                <td class="py-2 px-4 text-center">11</td>
            </tr>
            <!-- Fila 10 -->
            <tr class="bg-blue-100">
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/star.svg" alt="Favorito" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/femenino.png" alt="Femenino" class="w-6 mx-auto">
                </td>
                <td class="py-2 px-4 text-blue-700 font-semibold">Mía</td>
                <td class="py-2 px-4 text-center">9</td>
            </tr>
            </tbody>
        </table>
        <div class="w-full flex flex-col gap-12 mt-6">
            <div class="w-full relative p-6 bg-purple-200 text-femisalud-600">
                <img src="${pageContext.request.contextPath}/assets/img/siguena.png" alt="sigüeña" class="absolute left-0 -top-8" />
                <span class="block text-end font-bold">¿Te gustaría saber el sexo de tu bebé?</span>
            </div>
            <div class="w-full flex justify-center items-center gap-3">
                <button
                        id="revealSexButton"
                        type="button"
                        class="w-full text-white bg-gray-600 hover:bg-gray-700 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2 dark:bg-gray-600 dark:hover:bg-gray-700 focus:outline-none"
                        disabled>
                    Revelar sexo del bebé
                </button>
                <div class="w-full flex flex-col justify-center items-center gap-3">
                    <span class="text-femisalud-600 font-bold">¿Estás segura de ver la revelación de sexo?</span>
                    <div class="w-full flex gap-3">
                        <button
                                id="noButton"
                                type="button"
                                class="w-full focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">
                            No
                        </button>
                        <button
                                id="yesButton"
                                type="button"
                                class="w-full focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">
                            Sí
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/letter.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/revealSex.js"></script>
</body>
</html>