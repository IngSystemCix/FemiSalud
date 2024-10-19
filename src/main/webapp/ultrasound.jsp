<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 15/10/2024
  Time: 02:09
  To change this template use File | Settings | File Templates.
--%>
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
                <h1 class="font-bold font-xl">Ecografías</h1>
            </div>
            <jsp:include page="fragment/clinicalNote.jsp"/>
            <div class="w-full items-center justify-center">
                <jsp:include page="fragment/ultrasoundVideo.jsp"/>
            </div>
            <!-- Botones -->
            <div class="flex justify-center mt-8 space-x-4">
                <button class="bg-femisalud-900 text-white px-6 py-2 rounded-lg">Calificar atención</button>
                <button class="bg-lime-500 text-white px-6 py-2 rounded-lg">Descargar video</button>
            </div>
        </section>

        <section class="flex flex-col">
            <jsp:include page="fragment/folders_ultrasound.jsp"/>
        </section>
    </main>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</html>
