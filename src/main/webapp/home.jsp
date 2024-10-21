<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud :: Inicio</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">

<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>

<main class="flex ml-10 justify-center items-start gap-6 w-full h-lvh">
    <!-- Sección principal -->
    <section class="flex flex-col gap-10 relative w-full p-6 bg-gradient-to-r from-white via-white to-transparent">
        <div class="flex flex-col gap-3">
            <h1 class="font-bold mt-6 text-2xl">INICIO</h1>
            <jsp:include page="fragment/slider.jsp"/>
        </div>
        <jsp:include page="fragment/welcome.jsp"/>
        <jsp:include page="fragment/recentPublication.jsp"/>
        <jsp:include page="fragment/footerHome.jsp"/>
        <jsp:include page="fragment/actionModeVertical.jsp"/>
    </section>

    <!-- Sección de notificaciones -->
    <section class="flex flex-col relative w-auto bg-white">
        <jsp:include page="fragment/notification.jsp"/>
    </section>
</main>
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/carousel.js" defer></script>
</html>
