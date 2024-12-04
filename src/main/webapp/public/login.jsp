<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>
<body class="bg-white w-full h-screen p-10 overflow-hidden">
    <jsp:include page="/fragment/Loading.jsp" />
    <div class="w-full h-full flex justify-center items-center">
        <div class="w-full h-full flex flex-col justify-center items-center gap-6 p-6">
            <h1 class="title text-6xl sm:text-8xl text-femisalud-900 font-bold">FemiSalud</h1>
            <h2 class="text-inter text-femisalud-900 text-2xl sm:text-4xl font-bold">Inicio de sesión</h2>
            <form action="${pageContext.request.contextPath}/send-email" method="post" class="flex flex-col justify-center items-center gap-6" novalidate id="auth-form">
                <label>
                    <input type="text" id="dni" name="dni" placeholder="Ingrese DNI" class="text-inter bg-femisalud-300 text-femisalud-900 px-3 py-2 outline-none border-2 border-femisalud-600 rounded-lg text-2xl sm:text-4xl" required />
                </label>
                <c:if test="${not empty ERROR_MESSAGE}">
                    <p class="text-red-600 text-sm">${ERROR_MESSAGE}</p>
                </c:if>
                <button type="submit" id="button-get-code" onclick="showLoading()">Obtener código</button>
            </form>
        </div>
        <div class="w-full h-full hidden tablet-vertical:flex flex-col justify-center items-center gap-6">
            <div class="relative w-full h-full bg-femisalud-900 rounded-lg flex flex-col justify-center items-center gap-16 p-6">
                <h2 class="absolute top-4 left-1/2 transform -translate-x-1/2 text-inter text-white text-2xl font-bold text-center md:text-2xl lg:text-4xl">Especialistas en Salud de la Mujer</h2>
                <img src="${pageContext.request.contextPath}/assets/img/female_pregnant.png" alt="female pregnant" class="absolute -bottom-10 left-1/2 transform -translate-x-1/2 h-[400px] md:h-[500px] lg:h-[600px]"/>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/inputDNIValidation.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/loading.js"></script>
</body>
</html>
