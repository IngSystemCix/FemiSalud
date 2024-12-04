<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Bebé" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full sm:w-[80%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <h2 class="text-4xl text-inter text-femisalud-900 font-bold">Bebé</h2>
        <div class="w-full bg-gradient-to-r from-purple-300 via-purple-200 to-transparent text-femisalud-900 px-3 py-2">
            Filtra y escoge el nombre ideal para tu bebé.
        </div>
        <div class="w-full px-3 border-b border-gray-300">
            <h2 class="text-2xl text-inter text-femisalud-900 font-bold">Filtrar por</h2>
        </div>
        <details class="w-full" open>
            <summary class="text-inter text-femisalud-900 font-bold select-none cursor-pointer">Seleccionar</summary>
            <div class="w-full flex justify-start items-center gap-3 px-3 py-2">
                <button id="loadAllNames" class="active font-bold px-3 py-2">Todos los nombres</button>
                <button id="favoriteNames" class="text-femisalud-900 border-2 border-femisalud-600 font-bold px-3 py-2">favoritos</button>
            </div>
        </details>
        <details class="w-full" open>
            <summary class="text-inter text-femisalud-900 font-bold select-none cursor-pointer">Género</summary>
            <div class="w-full flex justify-start items-center gap-3 px-3 py-2">
                <button id="filterGirls" class="active font-bold px-3 py-2">Niña</button>
                <button id="filterBoys" class="text-femisalud-900 border-2 border-femisalud-600 font-bold px-3 py-2">Niño</button>
            </div>
        </details>
        <details class="w-full" open>
            <summary class="text-inter text-femisalud-900 font-bold select-none cursor-pointer">Tema</summary>
            <div class="w-full grid grid-cols-3 md:grid-cols-4 gap-3 px-3 py-2">
                <!-- Botón: Tierno -->
                <button id="filter-tierno" data-type="tierno" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/rainbow.png" alt="Icono de Tierno" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Tierno</span>
                </button>

                <!-- Botón: Bíblico -->
                <button id="filter-biblico" data-type="biblico" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/pigeon.png" alt="Icono de Bíblico" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Bíblico</span>
                </button>

                <!-- Botón: Realeza -->
                <button id="filter-realeza" data-type="realeza" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/royalty.png" alt="Icono de Realeza" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Realeza</span>
                </button>

                <!-- Botón: Literatura -->
                <button id="filter-literatura" data-type="literatura" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/literature.png" alt="Icono de Literatura" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Literatura</span>
                </button>

                <!-- Botón: Colores -->
                <button id="filter-colores" data-type="colores" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/colors.png" alt="Icono de Colores" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Colores</span>
                </button>

                <!-- Botón: Flores -->
                <button id="filter-flores" data-type="flores" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/flower.png" alt="Icono de Flores" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Flores</span>
                </button>

                <!-- Botón: Mitología -->
                <button id="filter-mitologia" data-type="mitologia" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/mythology.png" alt="Icono de Mitología" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Mitología</span>
                </button>

                <!-- Botón: Naturaleza -->
                <button id="filter-naturaleza" data-type="naturaleza" class="flex flex-col items-center justify-center text-white font-bold px-3 py-2 border-2 border-femisalud-600">
                    <img src="${pageContext.request.contextPath}/assets/img/nature.png" alt="Icono de Naturaleza" class="w-12 h-12 mb-2">
                    <span class="text-femisalud-900 font-bold">Naturaleza</span>
                </button>
            </div>
        </details>
        <div class="w-full flex justify-center items-center gap-3">
            <details class="w-full" open>
                <summary class="text-inter text-femisalud-900 font-bold select-none cursor-pointer">Empieza con la letra</summary>
                <div class="w-full flex justify-start items-center gap-3 px-3 py-2">
                    <select id="start_letter" name="start_letter" class="block w-full px-3 py-2 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-femisalud-300 focus:border-femisalud-300">
                        <option value="" disabled selected>Elige una opción</option>
                    </select>
                </div>
            </details>
            <details class="w-full" open>
                <summary class="text-inter text-femisalud-900 font-bold select-none cursor-pointer">Termina con la letra</summary>
                <div class="w-full flex justify-start items-center gap-3 px-3 py-2">
                    <select id="end_letter" name="end_letter" class="block w-full px-3 py-2 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-femisalud-300 focus:border-femisalud-300">
                        <option value="" disabled selected>Elige una opción</option>
                    </select>
                </div>
            </details>
        </div>
    </section>
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-6 bg-gradient-to-l from-white via-white to-transparent overflow-auto rounded-lg shadow-xl">
        <div class="w-full h-[24rem] max-h-[24rem] overflow-y-auto rounded-lg">
            <table class="min-w-full bg-white shadow-md rounded-lg">
                <thead class="bg-femisalud-900 text-white text-left text-sm uppercase font-semibold">
                <tr>
                    <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Favorito</th>
                    <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Género</th>
                    <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Nombre</th>
                </tr>
                </thead>
                <tbody id="name-table-body" class="text-gray-700">

                </tbody>
            </table>
        </div>
        <div class="relative w-full bg-gradient-to-r from-purple-300 via-purple-200 to-transparent flex justify-center items-center rounded-lg px-3 py-2 my-6">
            <img src="${pageContext.request.contextPath}/assets/img/stork.png" alt="cigüeña" class="absolute -top-4 size-16 sm:size-24 left-0">
            <p class="w-full text-femisalud-900 font-bold text-right text-xs sm:text-base">
                ¿Te gustaría saber el sexo de tu bebé?
            </p>
        </div>
        <div class="w-full flex justify-center items-center gap-3">
            <a id="revealLink"
               href="${pageContext.request.contextPath}/u/revelation-of-the-baby"
               class="w-full text-white bg-femisalud-900 font-bold px-3 py-2 rounded-lg text-xs sm:text-base cursor-pointer opacity-50 pointer-events-none">
                Revelar sexo del bebé
            </a>
            <div class="w-full flex flex-col gap-3">
                <h2 class="w-full text-inter text-xs sm:text-base font-bold text-femisalud-900">
                    ¿Estás segura de ver la revelación de sexo?
                </h2>
                <div class="w-full flex justify-center items-center gap-3">
                    <button id="yesButton"
                            class="w-full text-white bg-femisalud-900 font-bold px-3 py-2 rounded-lg text-xs sm:text-base">
                        Sí
                    </button>
                    <button id="noButton"
                            class="w-full text-white bg-red-600 font-bold px-3 py-2 rounded-lg text-xs sm:text-base">
                        No
                    </button>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/filterTypeName.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/revelationOfTheBaby.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/toggleButton.js"></script>
</body>
</html>
