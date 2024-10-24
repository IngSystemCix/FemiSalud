<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 22/10/2024
  Time: 02:45
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
<div class="bg-white flex justify-center items-center relative w-full">
    <!-- Contenedor del confeti -->
    <div id="confetti-container" class="absolute inset-0 pointer-events-none z-10"></div>

    <!-- Contenedor principal -->
    <div class="container mx-auto px-4 z-20">
        <!-- Título alineado a la izquierda -->
        <h1 class="text-left text-3xl font-bold mb-4">Bebé | Revelación de sexo</h1>

        <!-- Texto alineado a la izquierda con fondo rosado tenue y degradado -->
        <div class="bg-gradient-to-r from-pink-200 to-white p-4 rounded-lg mb-6">
            <p class="text-left text-lg font-medium">Pronto serás madre de una <span class="text-pink-500">niña</span> y te agradecemos por dejarnos acompañarte en este increíble viaje de la maternidad. ¡Felicidades, querida futura mamá <span class="text-pink-500 font-bold">Brigitte</span>!</p>
        </div>

        <!-- Contenedor con imagen de fondo y elementos centrales -->
        <div class="bg-cover bg-center rounded-lg p-40 relative" style="background-image: url('https://img.freepik.com/vector-premium/fondo-cielo-cuento-hadas-rosa-estrellas-arco-iris-nubes-color-blanco-pastel-mundo-imaginario-fantasia-fondo-magico-tierra-hermosa-noche-fabulosa-ilustracion-vector-cielo_102902-3383.jpg');">
            <!-- Texto e imagen del oso -->
            <div class="relative text-center">

                <!-- Imagen del oso con animación "bounce" -->
                <img src="https://png.pngtree.com/png-clipart/20230101/original/pngtree-cute-pink-girl-bear-with-balloon-png-image_8849941.png" alt="Oso con globos" class="mx-auto mb-4 w-48 h-48 animate-bounce">

                <!-- Texto "Es niña" debajo del oso -->
                <div class="flex justify-center space-x-2 text-5xl font-bold text-black">
                    <span>Es</span>
                    <span class="text-pink-600">niña</span>
                </div>

                <!-- Texto "Felicidades" centrado debajo -->
                <h2 class="text-4xl font-bold text-black mt-4">¡Felicidades!</h2>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/createConfeti.js"></script>
</body>
</html>