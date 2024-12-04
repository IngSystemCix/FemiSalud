<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Ecografías" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full sm:w-[80%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-y-auto gap-3">
        <!-- Título -->
        <h2 class="text-2xl sm:text-4xl text-inter text-femisalud-900 font-bold">Ecografía</h2>

        <!-- Contenedor del video -->
        <c:if test="${ultrasoundCount == 0}">
            <div class="w-full h-full flex flex-col justify-center items-center gap-6">
                <img src="${pageContext.request.contextPath}/assets/img/baby.png" alt="No tienes aun ecografías registradas">
                <p class="text-gray-500 text-2xl">Aún no cuentas con ecografías registradas</p>
            </div>
        </c:if>
        <c:if test="${ultrasoundCount > 0}">
            <!-- Contenedor de nota clínica -->
            <div id="clinical-note-container" class="w-full bg-gradient-to-r from-purple-300 via-purple-200 to-transparent px-3 py-2 my-2 sm:my-6">
                <p class="text-lg sm:text-2xl font-bold">Nota clínica de la ecografía:</p>
                <p id="clinical-note-preview" class="text-sm sm:text-base truncate overflow-hidden whitespace-nowrap">
                    <!-- Aquí se insertará la nota clínica truncada si está disponible -->
                </p>
            </div>

            <!-- Modal -->
            <div id="clinical-note-modal" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center hidden z-50">
                <div class="bg-white p-6 rounded shadow-lg w-11/12 max-w-lg">
                    <div class="flex justify-between items-center">
                        <h2 class="text-lg sm:text-2xl font-bold">Nota clínica completa</h2>
                        <button id="close-modal" class="text-red-500 font-bold text-lg">&times;</button>
                    </div>
                    <p id="modal-clinical-note" class="text-sm sm:text-base mt-4">
                        <!-- Aquí se insertará la nota clínica completa -->
                    </p>
                </div>
            </div>

            <div class="relative w-full sm:w-[70%] h-auto bg-femisalud-900 rounded-lg mt-4 sm:mt-10 flex flex-col justify-center items-center p-6 sm:p-10">
                <div class="absolute w-16 sm:w-96 h-10 sm:h-16 -top-4 sm:-top-8 left-0 rounded-t-lg bg-femisalud-900"></div>

                <div id="player-container" class="rounded-lg overflow-hidden w-full">
                    <video id="player" controls class="w-full rounded-lg">
                        <source type="video/mp4" id="video-source" src="#">
                        Your browser does not support the video tag.
                    </video>
                    <div class="watermark">
                        <h2 class="text-lg sm:text-2xl title text-white font-bold">Femisalud</h2>
                    </div>
                </div>
                <div class="w-full py-2 px-3 font-bold text-white text-sm sm:text-base" id="date-time-ultrasound"></div>
            </div>
        </c:if>

        <c:if test="${surveyCount > 0 && ultrasoundCount > 0}">
            <a href="${pageContext.request.contextPath}/u/attention-medical" class="w-full text-white font-bold bg-femisalud-900 rounded-lg p-3 text-center">Responder la encuesta</a>
        </c:if>

        <!-- Galería de miniaturas -->
        <div class="w-full h-32 flex overflow-x-auto gap-4 scrollbar-thin scrollbar-thumb-gray-400 scrollbar-track-gray-100">
            <c:if test="${ultrasoundCount == 0}">
                <div class="w-full h-full flex justify-center items-center">
                    <p class="text-inter text-sm text-gray-500">No tienes aún ecografías</p>
                </div>
            </c:if>
            <c:if test="${ultrasoundCount > 0}">
                <c:forEach var="i" begin="1" end="${ultrasoundCount}">
                    <div class="relative flex-shrink-0 w-32 h-[5rem] sm:w-48 bg-femisalud-300 rounded-lg flex justify-center items-center p-3 cursor-pointer mt-4 sm:mt-6"
                         data-id="${i}"
                         onclick="loadVideoAndClinicalNote(${i})">
                        <div class="absolute w-12 sm:w-16 h-4 -top-2 sm:-top-8 left-0 rounded-t-lg bg-femisalud-300"></div>
                        <img src="${pageContext.request.contextPath}/assets/img/miniature_ultrasound.png" alt="miniature"
                             class="w-[80%] h-auto object-contain rounded-lg">
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </section>

    <section class="w-[20%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] hidden sm:flex flex-col justify-start items-center p-6 bg-gradient-to-l from-white via-white to-transparent overflow-auto rounded-lg shadow-xl">
        <c:if test="${ultrasoundCount == 0}">
            <div class="w-full h-full flex justify-center items-center">
                <p class="text-inter text-sm text-gray-500">No tienes aún ecografías</p>
            </div>
        </c:if>
        <c:if test="${ultrasoundCount > 0}">
            <c:forEach var="i" begin="1" end="${ultrasoundCount}">
                <div class="relative w-full h-auto bg-femisalud-300 rounded-lg flex justify-center items-center p-3 cursor-pointer mt-6"
                     data-id="${i}"
                     onclick="loadVideoAndClinicalNote(${i})">
                    <div class="absolute w-24 h-4 -top-2 left-0 rounded-t-lg bg-femisalud-300"></div>
                    <img src="${pageContext.request.contextPath}/assets/img/miniature_ultrasound.png" alt="miniature" class="w-[80%] h-auto object-contain rounded-lg">
                </div>
            </c:forEach>
        </c:if>
    </section>
</main>

<!-- Scripts -->
<script src="https://cdn.plyr.io/3.7.8/plyr.polyfilled.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/videoPlayer.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/loadVideoUltrasoundAndClinicalNotes.js"></script>

</body>
</html>
