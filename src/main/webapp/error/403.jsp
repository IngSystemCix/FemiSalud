<%--
  Created by IntelliJ IDEA.
  User: IngSystemCix
  Date: 9/10/2024
  Time: 01:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
  <jsp:include page="../fragment/head.jsp"/>
  <title>ERROR 403 - Acceso Denegado</title>
</head>
<body class="w-full h-screen flex flex-col justify-center items-center bg-femisalud-100 text-gray-800">

<header class="text-center mb-6">
  <h1 class="text-femisalud-600 font-extrabold text-4xl md:text-6xl">ERROR 403</h1>
  <p class="text-base md:text-lg font-semibold">Acceso denegado</p>
</header>

<main class="flex flex-col items-center px-4">
  <img src="${pageContext.request.contextPath}/assets/img/403-access-denied.svg" alt="Acceso denegado" class="mb-8 w-full max-w-xs md:max-w-sm">
  <p class="text-gray-600 text-center text-sm md:text-base max-w-md">No tienes permiso para acceder a esta página. Si crees que esto es un error, por favor contacta al administrador.</p>
</main>

<footer class="mt-8">
  <a href="#" class="text-femisalud-600 hover:underline font-bold text-sm md:text-base">Volver a la página principal</a>
</footer>

</body>
</html>
