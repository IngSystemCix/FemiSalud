<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Mensajes" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-screen transition-transform duration-300 ease-in-out py-1 sm:py-10">
    <jsp:include page="/fragment/call/FloatSidebard.jsp" />
    <jsp:include page="/fragment/call/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-14rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto">
        <c:if test="${true}">
            <div class="w-full h-full flex flex-col justify-center items-center gap-6">
                <img src="${pageContext.request.contextPath}/assets/img/nextFunctionPage.png" alt="Próxima funcionalidad">
                <p class="text-femisalud-900 text-2xl font-bold">Próxima funcionalidad</p>
            </div>
        </c:if>
        <c:if test="${false}">
            <div class="w-full h-full flex justify-center items-start gap-3">
                <div id="client_contact" class="w-[30%] flex-grow h-[80vh] overflow-auto">
                    <div class="w-full">
                        <button id="toggleMenuBtn" class="sm:hidden fixed top-4 left-4 z-50 bg-femisalud-900 text-white p-3 rounded-full shadow-lg">
                            <i class="bi bi-list"></i>
                        </button>
                    </div>
                    <c:forEach var="i" begin="1" end="20">
                        <div class="notification-item mb-3 p-2 border-b border-gray-300 flex justify-start items-center cursor-pointer">
                            <img src="${pageContext.request.contextPath}/assets/img/female_home.png" alt="client" class="w-10 h-10 rounded-full aspect-square">
                            <div class="ml-3 w-full flex flex-col gap-2">
                                <p class="text-inter text-sm font-bold text-femisalud-900">Ana Fernández</p>
                                <p class="text-inter text-sm">Nueva cita programada para el 15 de noviembre.</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="chat" class="w-[70%] h-[80vh] flex-grow hidden md:flex md:flex-col">
                    <!-- Chat Header -->
                    <div class="w-full flex justify-start items-center border-b-2 border-femisalud-300 pb-4 mb-6">
                        <div class="w-full">
                            <button id="toggleMenuBtnClient" class="sm:hidden fixed top-4 left-4 z-50 bg-femisalud-900 text-white p-3 rounded-full shadow-lg">
                                <i class="bi bi-list"></i>
                            </button>
                        </div>
                        <h2 class="text-2xl font-semibold">Chat</h2>
                    </div>

                    <!-- Chat Messages -->
                    <div id="messages" class="flex-1 w-full h-[55vh] overflow-auto space-y-6 px-4 py-4">
                        <!-- Mensajes del chat se cargarán aquí dinámicamente -->
                    </div>

                    <!-- Chat Input -->
                    <div class="w-full flex items-center space-x-4 mt-6 border-t-2 border-femisalud-300 pt-4">
                        <input id="messageInput" type="text" placeholder="Escribe un mensaje..." class="w-full p-3 rounded-xl bg-femisalud-300 text-femisalud-900 placeholder:text-femisalud-900 focus:outline-none shadow-md transition-all duration-300" />
                        <input id="imageInput" type="file" accept="image/*" class="hidden" />
                        <button onclick="document.getElementById('imageInput').click()" class="px-6 py-2 bg-femisalud-900 text-white rounded-xl hover:bg-femisalud-500 transition-colors shadow-md transform hover:scale-105">
                            <i class="bi bi-card-image"></i>
                        </button>
                        <button id="sendMessageBtn" class="px-6 py-2 bg-femisalud-900 text-white rounded-xl hover:bg-femisalud-500 transition-colors shadow-md transform hover:scale-105">
                            <i class="bi bi-send"></i>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sendMessage.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/selectedClientChat.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/chatCallcenter.js"></script>
</body>
</html>
