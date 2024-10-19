<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 15/10/2024
  Time: 01:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="relative bg-white rounded-lg shadow-lg p-6 max-w-sm items-center">
    <!-- Fondo SVG -->
    <div class="absolute inset-0 flex items-center justify-center rounded-lg">
        <img src="${pageContext.request.contextPath}/assets/img/vector_file.svg" alt="Fondo de carpeta" class="w-full h-full object-cover" />
    </div>
    <!-- Contenido -->
    <div class="relative z-10 flex flex-col">
        <img src="${pageContext.request.contextPath}/assets/img/miniature_reproductor.png" alt="Miniatura de Reproductor" class="object-cover rounded mb-2 items-start">
        <div class="flex flex-col items-start w-full">
            <p class="font-bold text-gray-900">POST 1</p>
            <p class="text-gray-600">22/09/2024 12:12</p>
        </div>
    </div>
</div>