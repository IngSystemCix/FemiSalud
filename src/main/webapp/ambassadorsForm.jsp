<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 14/10/2024
  Time: 05:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="bg-gray-100">
    <!-- Contenedor principal que incluye el sidebar -->
    <div class="flex">
        <!-- Incluir el sidebar -->
        <jsp:include page="fragment/sidebar.jsp" />

        <!-- Contenedor derecho para los formularios -->
        <div class="flex-1 max-w-7xl mx-auto px-4 py-10">
            <!-- Título principal -->
            <h1 class="text-3xl font-bold text-center text-black mb-2">Bienvenida, embajadora de la prevención</h1>
            <!-- Subtítulo -->
            <p class="text-center text-blue-600 text-sm mb-8">Ayuda a tus amigas a cuidar su salud y recibe beneficios exclusivos.</p>

            <!-- Contenedor de las invitadas -->
            <div id="form-container" class="flex overflow-x-auto space-x-4 pb-4">
                <!-- Formularios generados dinámicamente aparecerán aquí -->
            </div>

            <!-- Botones -->
            <div class="flex justify-center mt-8 space-x-4">
                <button class="bg-red-600 text-white px-6 py-2 rounded-lg">Salir del formulario</button>
                <button class="bg-blue-600 text-white px-6 py-2 rounded-lg">Guardar datos</button>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/addForm.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</html>
