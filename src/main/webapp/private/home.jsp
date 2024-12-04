<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Dashboard" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <!-- Sección principal (80%) -->
    <section class="w-full sm:w-[75%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <jsp:include page="/fragment/Carousel.jsp" />

        <div class="w-full h-48 bg-gradient-to-r from-purple-300 via-purple-200 to-transparent flex justify-center items-center p-4 md:p-6 rounded-xl my-4 md:my-10">
            <div class="w-full text-inter">
                <h2 class="text-femisalud-900 font-bold text-lg md:text-2xl">Bienvenida a FemiSalud</h2>
                <p class="text-sm md:text-base">Querida futura mamá,</p>
                <p class="text-sm md:text-base">
                    Sabemos que estás viviendo uno de los momentos más emocionantes y transformadores de tu vida. En FemiSalud, queremos acompañarte en cada paso de este hermoso viaje.
                </p>
            </div>
            <img src="${pageContext.request.contextPath}/assets/img/female_home.png" alt="female home" class="w-1/5 h-auto max-w-full md:block hidden">
        </div>

        <c:if test="${ultrasoundCount == 0}">
            <div class="w-full h-full flex flex-col justify-center items-center gap-6">
                <img src="${pageContext.request.contextPath}/assets/img/baby.png" alt="No tienes aun ecografías registradas">
                <p class="text-gray-500 text-2xl">Aún no cuentas con ecografías registradas</p>
            </div>
        </c:if>
        <c:if test="${ultrasoundCount > 0}">
            <div class="relative w-full sm:w-[70%] h-auto bg-femisalud-300 rounded-lg mt-5 md:mt-10 flex justify-center items-center p-10">
                <div class="absolute w-16 sm:w-96 h-16 -top-4 sm:-top-8 left-0 rounded-t-lg bg-femisalud-300"></div>

                <div id="player-container" class="rounded-lg overflow-hidden">
                    <video id="player" controls>
                        <source src="${url}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                    <div class="watermark">
                        <h2 class="text-2xl title text-white font-bold">Femisalud</h2>
                    </div>
                </div>
            </div>
        </c:if>

        <div class="w-full relative bg-purple-300 rounded-full px-3 py-2 my-2 md:my-6">
            <h2 class="text-inter font-bold text-xs md:text-2xl">¡Invita y sé una embajadora de la prevención!</h2>
            <a href="${pageContext.request.contextPath}/u/ambassador" class="absolute top-0 right-0 text-inter font-bold text-white bg-femisalud-900 rounded-lg px-4 py-2 text-xs md:text-base">¡Registra aquí!</a>
        </div>
    </section>

    <!-- Panel de notificaciones (20%) -->
    <section class="w-[25%] h-[calc(100vh-5rem)] bg-white overflow-auto hidden md:flex flex-col p-4 rounded-lg shadow-lg">
        <div class="w-full flex justify-between items-center">
            <h3 class="text-femisalud-900 font-bold text-lg mb-4">Panel de Notificaciones</h3>
            <div class="relative">
                <svg width="30" height="35" viewBox="0 0 40 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M40 34.9855V37.2186C40 37.4784 39.8891 37.7275 39.6917 37.9112C39.4943 38.0949 39.2265 38.1981 38.9474 38.1981H1.05263C0.773457 38.1981 0.505716 38.0949 0.30831 37.9112C0.110903 37.7275 8.42721e-07 37.4784 8.42721e-07 37.2186V34.9855C-0.000579342 34.2661 0.298439 33.5744 0.834271 33.0558C1.3701 32.5371 2.10107 32.2318 2.87369 32.2039C3.02308 31.9522 3.11954 31.6763 3.1579 31.391V19.7063C3.15175 17.4028 3.71197 15.1285 4.79571 13.0574C5.87945 10.9863 7.45798 9.17331 9.41053 7.75715C11.3907 6.32054 13.698 5.32472 16.1557 4.84597C18.6134 4.36722 21.1563 4.41824 23.5895 4.99513C30.3158 6.52306 35.7895 13.1832 35.7895 19.8336V31.1363C36.1062 31.5791 36.5321 31.9452 37.0316 32.2039C37.8208 32.2091 38.5758 32.5044 39.1319 33.0255C39.688 33.5466 40 34.2512 40 34.9855ZM19.4947 3.54556C20.7262 3.55399 21.9535 3.67869 23.1579 3.91775V2.93831C23.1579 2.15902 22.8252 1.41165 22.233 0.860612C21.6407 0.309571 20.8375 0 20 0C19.1625 0 18.3593 0.309571 17.767 0.860612C17.1748 1.41165 16.8421 2.15902 16.8421 2.93831V3.74145C17.7198 3.6147 18.6065 3.54922 19.4947 3.54556ZM12.7158 39.1775C12.9814 40.798 13.8622 42.2763 15.1985 43.3445C16.5348 44.4127 18.2383 45 20 45C21.7617 45 23.4652 44.4127 24.8015 43.3445C26.1378 42.2763 27.0186 40.798 27.2842 39.1775H12.7158Z" fill="#115691"></path>
                </svg>
                <div class="absolute -top-2 -right-2 bg-red-600 text-white rounded-full w-6 h-6 flex justify-center items-center aspect-square border-2 border-white">${notificationsCount > 9 ? "+9" : notificationsCount}</div>
            </div>
        </div>
        <c:if test="${notificationsCount == 0}">
            <div class="w-full h-full flex justify-center items-center">
                <p class="text-inter text-sm text-gray-500">No tienes notificaciones pendientes</p>
            </div>
        </c:if>
        <c:if test="${notificationsCount > 0}">
            <c:forEach var="notification" items="${notifications}">
                <div class="notification-item mb-3 p-2 border-b border-gray-300 flex justify-center items-center gap-3">
                    <img src="${pageContext.request.contextPath}/assets/img/${notification.typeNotification}"
                         alt="Notificación" class="w-8 h-8"/>
                    <div class="flex flex-col justify-center items-start gap-3">
                        <p class="text-inter text-sm font-bold">${notification.description}</p>
                        <p class="text-gray-500">${notification.dateNotification}</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!-- Agrega más notificaciones según sea necesario -->
    </section>
</main>

<script src="https://cdn.plyr.io/3.7.8/plyr.polyfilled.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/videoPlayer.js"></script>
</body>
</html>
