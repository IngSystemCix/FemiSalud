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
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>
<div class="flex justify-center items-center gap-6 w-full min-h-screen bg-white p-6">
    <div class="p-8">
        <div class="flex justify-between items-center mb-4">
            <h1 class="text-2xl font-bold">Ecografías | Dashboard</h1>
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

        <div class="grid grid-cols-4 gap-4">
            <!-- Gráfico circular de ejemplo -->
            <div class="col-span-1">
                <svg class="w-32 h-32" viewBox="0 0 32 32">
                    <circle r="16" cx="16" cy="16" fill="#E0E7FF"></circle>
                    <path d="M16 16 L16 0 A16 16 0 0 1 32 16 Z" fill="#C7D2FE"></path>
                    <path d="M16 16 L32 16 A16 16 0 0 1 16 32 Z" fill="#A5B4FC"></path>
                </svg>
            </div>

            <!-- Leyenda -->
            <div class="col-span-1">
                <div class="space-y-4">
                    <div class="flex items-center">
                        <div class="w-4 h-4 bg-indigo-200 mr-2"></div>
                        <span>Ecografías visualizadas</span>
                    </div>
                    <div class="flex items-center">
                        <div class="w-4 h-4 bg-indigo-300 mr-2"></div>
                        <span>Ecografías no visualizadas</span>
                    </div>
                    <div class="flex items-center">
                        <div class="w-4 h-4 bg-indigo-500 mr-2"></div>
                        <span>Ecografías descargadas</span>
                    </div>
                </div>
            </div>

            <!-- Gráfico de área de ejemplo -->
            <div class="col-span-2">
                <svg viewBox="0 0 100 50" class="w-full h-40">
                    <path fill="#E0E7FF" d="M0 40 L10 30 L20 35 L30 25 L40 30 L50 20 L60 25 L70 15 L80 20 L90 10 L100 15 L100 50 L0 50 Z"></path>
                    <path fill="#C7D2FE" d="M0 40 L10 25 L20 30 L30 20 L40 25 L50 15 L60 20 L70 10 L80 15 L90 5 L100 10 L100 50 L0 50 Z"></path>
                    <path fill="#A5B4FC" d="M0 40 L10 20 L20 25 L30 15 L40 20 L50 10 L60 15 L70 5 L80 10 L90 0 L100 5 L100 50 L0 50 Z"></path>
                </svg>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</body>
</html>
