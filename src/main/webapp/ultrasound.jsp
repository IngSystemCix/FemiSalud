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
<body class="flex w-full h-screen bg-femisalud-300">

<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>

<main class="flex ml-10 justify-center items-start gap-6 w-full h-lvh">
    <section class="w-full h-full flex flex-col gap-6 bg-gradient-to-r from-white via-white to-transparent p-6">
        <h1 class="font-bold font-2xl">Ecografías</h1>
        <div class="bg-gradient-to-r from-purple-200 via-purple-200 to-transparent rounded-lg shadow-lg p-3 flex flex-col w-full">
            <h2 class="text-xl font-bold text-sky-800 mb-2">Nota clínica de la ecografía:</h2>
            <p class="text-black">
                Ecografía compatible con embarazo de 24 semanas, biometría fetal acorde a la edad gestacional, líquido amniótico y placenta sin alteraciones aparentes. Feto en presentación cefálica y actividad cardiaca normal.
            </p>
        </div>
        <div class="w-full h-full relative">
            <div class="absolute -top-2 left-0 h-6 w-24 bg-femisalud-600 rounded-t-md"></div>
            <div class="w-full h-full bg-femisalud-600 rounded-md shadow-md"></div>
        </div>
        <div class="flex justify-center mt-8 space-x-4">
            <button onclick="window.location.href='attentionForm.jsp'" class="bg-femisalud-900 text-white px-6 py-2 rounded-lg">Calificar atención</button>
            <button class="bg-lime-500 text-white px-6 py-2 rounded-lg">Descargar video</button>
        </div>
    </section>
    <jsp:include page="fragment/folders_ultrasound.jsp"/>
</main>
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</html>
