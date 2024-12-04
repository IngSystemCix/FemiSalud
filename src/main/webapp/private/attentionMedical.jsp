<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Atención medica" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-full transition-transform duration-300 ease-in-out">
    <jsp:include page="/fragment/FloatSidebard.jsp" />
    <jsp:include page="/fragment/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-10rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <form action="${pageContext.request.contextPath}/response-survey" method="post" class="w-full sm:w-[80%] h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-start p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <h1 class="w-full text-right title text-4xl font-bold text-femisalud-900">FemiSalud</h1>
        <h2 class="w-full text-center text-inter text-femisalud-900 text-4xl font-bold">Atención médica en FemiSalud</h2>
        <p class="text-justify text-inter text-femisalud-900 text-lg">Tu opinión es muy valiosa para nosotros, FemiLover. Ayúdanos a mejorar completando este breve formulario sobre la atención que recibiste en FemiSalud.</p>
        <p class="text-justify text-inter text-femisalud-900 text-lg">¡Gracias por confiar en nosotros!</p>
        <em>1.- ¿Cómo calificarías la atención recibida por el médico? <span class="text-inter text-gray-500">(1 estrella = Muy insatisfecha, 5 estrellas = Muy satisfecha)</span></em>
        <div>
            <div class="container-rating">
                <input type="radio" name="rating_question1" id="star1_question1" class="star" value="5" />
                <label for="star1_question1" class="star-label"></label>

                <input type="radio" name="rating_question1" id="star2_question1" class="star" value="4" />
                <label for="star2_question1" class="star-label"></label>

                <input type="radio" name="rating_question1" id="star3_question1" class="star" value="3" />
                <label for="star3_question1" class="star-label"></label>

                <input type="radio" name="rating_question1" id="star4_question1" class="star" value="2" />
                <label for="star4_question1" class="star-label"></label>

                <input type="radio" name="rating_question1" id="star5_question1" class="star" value="1" />
                <label for="star5_question1" class="star-label"></label>
            </div>
        </div>
        <em>2.- ¿Cómo calificarias la empatía, respeto y atención del personal durante tu visita? <span class="text-inter text-gray-500">(1 estrella = Muy insatisfecha, 5 estrellas = Muy satisfecha)</span></em>
        <div>
            <div class="container-rating">
                <input type="radio" name="rating_question2" id="star1_question2" class="star" value="5" />
                <label for="star1_question2" class="star-label"></label>

                <input type="radio" name="rating_question2" id="star2_question2" class="star" value="4" />
                <label for="star2_question2" class="star-label"></label>

                <input type="radio" name="rating_question2" id="star3_question2" class="star" value="3" />
                <label for="star3_question2" class="star-label"></label>

                <input type="radio" name="rating_question2" id="star4_question2" class="star" value="2" />
                <label for="star4_question2" class="star-label"></label>

                <input type="radio" name="rating_question2" id="star5_question2" class="star" value="1" />
                <label for="star5_question2" class="star-label"></label>
            </div>
        </div>
        <em>3.- ¿Cómo calificarias la claridad de la comunicación del personal médico y de atención? <span class="text-inter text-gray-500">(1 estrella = Muy insatisfecha, 5 estrellas = Muy satisfecha)</span></em>
        <div>
            <div class="container-rating">
                <input type="radio" name="rating_question3" id="star1_question3" class="star" value="5" />
                <label for="star1_question3" class="star-label"></label>

                <input type="radio" name="rating_question3" id="star2_question3" class="star" value="4" />
                <label for="star2_question3" class="star-label"></label>

                <input type="radio" name="rating_question3" id="star3_question3" class="star" value="3" />
                <label for="star3_question3" class="star-label"></label>

                <input type="radio" name="rating_question3" id="star4_question3" class="star" value="2" />
                <label for="star4_question3" class="star-label"></label>

                <input type="radio" name="rating_question3" id="star5_question3" class="star" value="1" />
                <label for="star5_question3" class="star-label"></label>
            </div>
        </div>
        <em>4.- ¿Qué aspectos de la atención te parecieron más satisfactorios? <span class="text-inter text-gray-500">(Selecciona todas las opciones que correspondan)</span></em>
        <div>
            <div class="flex flex-col gap-3 justify-center items-start">
                <label class="flex gap-3 justify-start items-center">
                    <input type="checkbox" name="question4" value="amabilidad_personal" id="check1-question4">
                    <span>Amabilidad del personal</span>
                </label>
                <label class="flex gap-3 justify-start items-center">
                    <input type="checkbox" name="question4" value="claridad_explicacion_medica" id="check2-question4">
                    <span>Claridad de la explicación médica</span>
                </label>
                <label class="flex gap-3 justify-start items-center">
                    <input type="checkbox" name="question4" value="tiempo_espera" id="check3-question4">
                    <span>Tiempo de espera</span>
                </label>
                <label class="flex gap-3 justify-start items-center">
                    <input type="checkbox" name="question4" value="limpieza_instalaciones" id="check4-question4">
                    <span>Limpieza de las instalaciones</span>
                </label>
                <label class="flex gap-3 justify-start items-center">
                    <input type="checkbox" name="question4" value="otras" id="check5-question4" onclick="toggleInput()">
                    <span>Otras:</span>
                    <input type="text" name="response-question4" class="px-3 py-2 text-inter rounded-lg bg-femisalud-300">
                </label>
            </div>
        </div>
        <div class="w-full flex justify-center items-center gap-6">
            <a href="${pageContext.request.contextPath}/u/ultrasound" class="px-3 py-2 bg-red-600 text-white text-inter text-2xl font-bold rounded-lg">Salir del formulario</a>
            <button type="submit" class="px-3 py-2 text-white bg-green-600 text-inter text-2xl font-bold rounded-lg">Enviar formulario</button>
        </div>
    </form>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/toggelInputChekList.js"></script>
</body>
</html>
