<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Inicio" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-screen transition-transform duration-300 ease-in-out py-10">
    <jsp:include page="/fragment/admin/FloatSidebard.jsp" />
    <jsp:include page="/fragment/admin/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-14rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <h2 class="text-inter text-femisalud-900 text-4xl font-bold">Inicio</h2>

        <!-- Contenedor principal para los gráficos y leyendas -->
        <div class="w-full flex flex-col md:flex-row justify-center items-center gap-6">
            <!-- Gráfico radial -->
            <div class="w-full md:w-1/2 h-full flex justify-center items-start">
                <jsp:include page="/fragment/RadialChart.jsp" />
            </div>

            <!-- Contenedor de leyendas y gráfico de barras -->
            <div class="w-full md:w-1/2 h-full flex flex-col justify-center items-center gap-6">
                <jsp:include page="/fragment/LegendsChart.jsp" />
                <jsp:include page="/fragment/BarChart.jsp" />
            </div>
        </div>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/radialChart.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/legendsChart.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/barChart.js"></script>
</body>
</html>
