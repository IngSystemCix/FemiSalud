<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Embajadoras" />
</jsp:include>
<body class="px-6 py-1 w-full min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <form action="${pageContext.request.contextPath}/add-ambassador" method="post" class="w-full sm:w-[80%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto rounded-lg shadow-xl">
        <h1 class="text-femisalud-900 text-inter text-2xl sm:text-4xl font-extrabold mb-4">Bienvenida, embajadora de la prevención</h1>
        <h2 class="text-femisalud-900 text-sm sm:text-xl text-center mb-6">Ayuda a tus amigas a cuidar su salud y recibe beneficios exclusivos.</h2>

        <div class="w-full sm:w-[80%] max-w-md space-y-4">
            <div class="space-y-2">
                <label class="font-semibold text-femisalud-900" for="name">Nombre Completo</label>
                <input type="text" id="name" name="name" class="w-full p-3 border-2 border-femisalud-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-femisalud-500 transition duration-200" placeholder="Ingresa tu nombre completo"/>
            </div>
            <div class="space-y-2">
                <label class="font-semibold text-femisalud-900" for="dni">DNI</label>
                <input type="text" id="dni" name="dni" class="w-full p-3 border-2 border-femisalud-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-femisalud-500 transition duration-200" placeholder="Ingresa tu DNI"/>
            </div>
            <div class="space-y-2">
                <label class="font-semibold text-femisalud-900" for="tel">Teléfono</label>
                <input type="tel" id="tel" name="tel" class="w-full p-3 border-2 border-femisalud-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-femisalud-500 transition duration-200" placeholder="Ingresa tu número de teléfono"/>
            </div>
            <div class="space-y-2">
                <label class="font-semibold text-femisalud-900" for="email">Correo electrónico</label>
                <input type="email" id="email" name="email" class="w-full p-3 border-2 border-femisalud-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-femisalud-500 transition duration-200" placeholder="Ingresa tu correo electrónico"/>
            </div>
        </div>

        <div class="flex space-x-4 mt-6">
            <a href="${pageContext.request.contextPath}/home" class="w-40 h-12 bg-red-600 text-white rounded-lg shadow-md hover:bg-red-700 transition duration-300 font-bold flex justify-center items-center">Cancelar</a>
            <button type="submit" class="w-40 h-12 bg-green-600 text-white rounded-lg shadow-md hover:bg-green-700 transition duration-300 font-bold">Agregar</button>
        </div>
    </form>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ambassadorForm.js"></script>
</body>
</html>
