<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 23/10/2024
  Time: 02:24
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
<div class="bg-white flex justify-center items-center relative w-full overflow-hidden">
    <!-- Contenedor del confeti -->
    <div id="confetti-container-blue" class="absolute inset-0 pointer-events-none z-10"></div>

    <!-- Contenedor principal -->
    <div class="container mx-auto px-4 z-20">
        <!-- Título alineado a la izquierda -->
        <h1 class="text-left text-3xl font-bold mb-4">Bebé | Revelación de sexo</h1>

        <!-- Texto alineado a la izquierda con fondo rosado tenue y degradado -->
        <div class="bg-gradient-to-r from-femisalud-300 to-white p-4 rounded-lg mb-6">
            <p class="text-left text-lg font-medium">Pronto serás madre de un <span class="text-blue-800">niño</span> y te agradecemos por dejarnos acompañarte en este increíble viaje de la maternidad. ¡Felicidades, querida futura mamá <span class="text-femisalud-900 font-bold">Brigitte</span>!</p>
        </div>

        <!-- Contenedor con imagen de fondo y elementos centrales -->
        <div class="bg-cover bg-center rounded-lg p-40 relative" style="background-image: url('https://static.vecteezy.com/system/resources/previews/006/589/487/non_2x/3d-product-podium-with-pastel-color-background-clouds-weather-with-empty-space-for-kids-or-baby-product-free-vector.jpg');">
            <!-- Texto e imagen del oso -->
            <div class="relative text-center">

                <!-- Imagen del oso con animación "bounce" -->
                <img src="https://i.pinimg.com/originals/17/9a/a8/179aa8620db33a34953426d0bcbabb1b.png" alt="Oso con globos" class="mx-auto mb-4 w-48 h-56 animate-bounce">

                <!-- Texto "Es niño" debajo del oso -->
                <div class="flex justify-center space-x-2 text-5xl font-bold text-black">
                    <span>Es</span>
                    <span class="text-femisalud-900">niño</span>
                </div>

                <!-- Texto "Felicidades" centrado debajo -->
                <h2 class="text-4xl font-bold text-black mt-4">¡Felicidades!</h2>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/createConfetiBlue.js"></script>
</body>
</html>