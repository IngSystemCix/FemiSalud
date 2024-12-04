<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Perfil" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-screen transition-transform duration-300 ease-in-out py-1 sm:py-10">
    <jsp:include page="/fragment/call/FloatSidebard.jsp" />
    <jsp:include page="/fragment/call/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-14rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <h2 class="text-inter text-femisalud-900 text-4xl font-bold">Perfil</h2>
        <p class="text-sm sm:text-2xl text-inter">
            Si deseas cambiar algún dato de tu registro por motivos de robo u otra causa, a continuación, puedes editar tu perfil.
        </p>
        <form action="${pageContext.request.contextPath}/update-data-user" method="post" class="bg-femisalud-300 flex flex-col gap-6 p-6 rounded-lg max-w-lg mx-auto">
            <h2 class="w-full text-center text-femisalud-900 text-2xl font-bold text-inter">Mis datos</h2>

            <c:forEach var="data" items="${PROFILE_CALL_CENTER}">
                <!-- Dividir la cadena en partes -->
                <c:set var="fields" value="${fn:split(data, ',')}" />

                <!-- Nombre -->
                <div class="w-full flex flex-col sm:flex-row justify-between items-center">
                    <span class="w-full sm:w-32 text-femisalud-900 text-inter font-bold">Nombre:</span>
                    <span class="w-full text-inter">${fields[1]}</span> <!-- El nombre está en el índice 1 -->
                </div>

                <!-- DNI -->
                <div class="w-full flex flex-col sm:flex-row justify-between items-center">
                    <span class="w-full sm:w-32 text-femisalud-900 text-inter font-bold">DNI:</span>
                    <span class="w-full text-inter">${fields[0]}</span> <!-- El DNI está en el índice 0 -->
                </div>

                <!-- Teléfono -->
                <div class="w-full flex flex-col sm:flex-row justify-between items-center">
                    <label for="tel" class="w-full text-femisalud-900 text-inter font-bold">Teléfono:</label>
                    <input value="${fields[2]}" type="tel" id="tel" name="tel" class="w-full rounded-lg w-full sm:w-48 p-2 mt-2 sm:mt-0" readonly />
                </div>

                <!-- Correo Electrónico -->
                <div class="w-full flex flex-col sm:flex-row justify-between items-center">
                    <label for="email" class="w-full text-femisalud-900 text-inter font-bold">Correo electrónico:</label>
                    <input value="${fields[3]}" type="email" id="email" name="email" class="w-full rounded-lg w-full sm:w-48 p-2 mt-2 sm:mt-0" readonly />
                </div>
            </c:forEach>

            <!-- Botones -->
            <div class="w-full flex flex-col sm:flex-row justify-center items-center gap-6 mt-4">
                <button type="button" id="edit">
                    Editar perfil
                </button>
                <button type="submit" id="save">
                    Guardar datos
                </button>
            </div>
        </form>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/editProfile.js"></script>
</body>
</html>
