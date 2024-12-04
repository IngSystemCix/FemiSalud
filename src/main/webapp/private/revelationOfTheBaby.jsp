<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Revelaciones" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full sm:w-[80%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <h2 class="text-4xl text-inter text-femisalud-900 font-bold">Revelaciones</h2>

        <div id="principal">
            <jsp:include page="/fragment/revelation/principalRevelation.jsp" />
        </div>

        <c:set var="firstTypeOfPregnancy" value="${genreAndTypePregnancy[0].typePregnancy}" />
        <c:forEach var="genreAndType" items="${genreAndTypePregnancy}">
            <c:choose>
                <c:when test="${firstTypeOfPregnancy == 'UNIQUE' &&  genreAndType.genre == 'Mujer'}">
                    <div id="girlRevelation" class="hidden">
                        <jsp:include page="/fragment/revelation/girlRevelation.jsp" />
                    </div>
                </c:when>
                <c:when test="${firstTypeOfPregnancy == 'UNIQUE' &&  genreAndType.genre == 'Hombre'}">
                    <div id="boyRevelation" class="hidden">
                        <jsp:include page="/fragment/revelation/boyRevelation.jsp" />
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${firstTypeOfPregnancy == 'TWINS'}">
                <div id="twinsRevelation" class="hidden">
                    <jsp:include page="/fragment/revelation/twinsRevelation.jsp" />
                </div>
            </c:when>
            <c:when test="${firstTypeOfPregnancy == 'TRIPLETS'}">
                <div id="tripletsRevelation" class="hidden">
                    <jsp:include page="/fragment/revelation/tripletsRevelation.jsp" />
                </div>
            </c:when>
            <c:when test="${firstTypeOfPregnancy == 'CUFFLINKS_F'}">
                <div id="cufflinksGirlsRevelation" class="hidden">
                    <jsp:include page="/fragment/revelation/cufflinksGirlsRevelation.jsp" />
                </div>
            </c:when>
            <c:when test="${firstTypeOfPregnancy == 'CUFFLINKS_M'}">
                <div id="cufflinksGirlsRevelation" class="hidden">
                    <jsp:include page="/fragment/revelation/cufflinksBoysRevelation.jsp" />
                </div>
            </c:when>
        </c:choose>

    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/countdown.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/revelationGenreAndPregnancy.js"></script>
</body>
</html>