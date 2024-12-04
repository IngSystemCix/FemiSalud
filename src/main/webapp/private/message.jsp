<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Mensajes" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <c:if test="${true}">
            <div class="w-full h-full flex flex-col justify-center items-center gap-6">
                <img src="${pageContext.request.contextPath}/assets/img/nextFunctionPage.png" alt="Próxima funcionalidad">
                <p class="text-femisalud-900 text-2xl font-bold">Próxima funcionalidad</p>
            </div>
        </c:if>
        <c:if test="${false}">
            <!-- Chat Header -->
            <div class="w-full flex justify-start items-center border-b-2 border-femisalud-300 pb-4 mb-6">
                <h2 class="text-2xl font-semibold">Chat</h2>
            </div>

            <!-- Chat Messages -->
            <div id="messages" class="flex-1 w-full h-full overflow-auto space-y-6 px-4 py-4">
                <!-- Mensajes del chat se cargarán aquí dinámicamente -->
            </div>

            <!-- Chat Input -->
            <div class="w-full flex items-center space-x-4 mt-6 border-t-2 border-femisalud-300 pt-4">
                <input id="messageInput" name="messageInput" type="text" placeholder="Escribe un mensaje..." class="w-full p-3 rounded-xl bg-femisalud-300 text-femisalud-900 placeholder:text-femisalud-900 focus:outline-none shadow-md transition-all duration-300" />
                <input id="imageInput" type="file" accept="image/*" class="hidden" disabled />
                <button onclick="document.getElementById('imageInput').click()" class="px-6 py-2 bg-femisalud-900 text-white rounded-xl hover:bg-femisalud-500 transition-colors shadow-md transform hover:scale-105" disabled>
                    <i class="bi bi-card-image"></i>
                </button>
                <button id="sendMessageBtn" class="px-6 py-2 bg-femisalud-900 text-white rounded-xl hover:bg-femisalud-500 transition-colors shadow-md transform hover:scale-105">
                    <i class="bi bi-send"></i>
                </button>
            </div>
        </c:if>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sendMessage.js"></script>
</body>
</html>
