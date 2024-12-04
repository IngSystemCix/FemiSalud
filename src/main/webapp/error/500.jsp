<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="ERROR 500" />
</jsp:include>
<body class="w-full h-screen flex flex-col justify-center items-center bg-femisalud-300 text-gray-800">
<header class="text-center mb-6">
    <h1 class="text-femisalud-900 font-extrabold text-4xl md:text-6xl">ERROR 500</h1>
    <p class="text-base md:text-lg font-semibold">¡Ups! Algo salió mal.</p>
</header>

<main class="flex flex-col items-center px-4">
    <img src="${pageContext.request.contextPath}/assets/img/500-Internal-Server-Error.svg" alt="Acceso denegado" class="mb-8 w-full max-w-xs md:max-w-sm">
    <p class="text-gray-600 text-center text-sm md:text-base max-w-md">Hemos encontrado un problema en el servidor. Estamos trabajando para solucionarlo. Por favor, inténtalo de nuevo más tarde.</p>
</main>

<footer class="mt-8">
    <a href="#" class="text-femisalud-900 hover:underline font-bold text-sm md:text-base">Volver a la página principal</a>
</footer>
</body>
</html>
