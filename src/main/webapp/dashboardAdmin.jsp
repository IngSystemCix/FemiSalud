<%--
  Created by IntelliJ IDEA.
  User: JONATHAN
  Date: 22/10/2024
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>
<div class="flex justify-center items-center gap-6 w-full min-h-screen bg-white p-6">
    <div class="p-8">
        <div class="flex justify-between items-center mb-4">
            <h1 class="text-2xl font-bold">Inicio</h1>
            <div class="flex items-center space-x-4">
                <select class="border border-gray-300 rounded-md p-2">
                    <option>PDF</option>
                    <option>Excel</option>
                </select>
                <button class="bg-green-500 text-white px-4 py-2 rounded-md">
                    Descargar registro
                </button>
            </div>
        </div>

        <div class="flex flex-row mt-4 gap-4">
            <!-- Ecografías -->
            <div class="border border-solid w-auto" type="radialBar">
                <jsp:include page="fragment/reportUltrasound.jsp"/>
            </div>

            <div class="flex flex-col md-6">
                <!-- Consultas -->
                <div class="border border-solid">
                    <jsp:include page="fragment/reportQueries.jsp"/>
                </div>

                <!-- Revelaciones de Sexo -->
                <div class="border border-solid">
                    <jsp:include page="fragment/reportDisclousuresSex.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/reportUltrasound.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/reportQueries.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/reportDisclousuresSex.js"></script>
</body>
</html>
