<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen">
<!-- Ajusta el contenedor principal para que sidebar y main se distribuyan correctamente -->
<div class="flex w-full h-full">
    <!-- Sidebar con ancho fijo -->
    <div class="relative h-full w-64">
        <jsp:include page="fragment/sidebar.jsp"/>
    </div>

    <!-- Contenedor principal ajustado para ocupar el resto del espacio disponible -->
    <main class="flex-1 h-full overflow-hidden flex gap-3">
        <section class="gap-5 flex flex-col relative w-full">
            <div class="flex flex-col gap-3">
                <h1 class="font-bold">INICIO</h1>
                <jsp:include page="fragment/slider.jsp"/>
            </div>
            <jsp:include page="fragment/welcome.jsp"/>
            <jsp:include page="fragment/recentPublication.jsp"/>
            <jsp:include page="fragment/footerHome.jsp"/>
            <jsp:include page="fragment/actionModeVertical.jsp"/>
        </section>

        <section class="flex flex-col">
            <jsp:include page="fragment/notification.jsp"/>
        </section>
    </main>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/carousel.js" defer></script>
</html>
