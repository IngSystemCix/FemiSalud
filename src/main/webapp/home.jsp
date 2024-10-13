<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen">
    <div class="relative h-full">
        <jsp:include page="fragment/sidebar.jsp"/>
    </div>

    <main class="w-full h-full overflow-hidden flex gap-3">
        <section class="gap-5 flex flex-col relative">
            <div class="flex flex-col gap-3">
                <h1>INICIO</h1>
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
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
</html>