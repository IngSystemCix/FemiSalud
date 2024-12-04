<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>
<body class="bg-white w-full h-screen p-10 overflow-hidden">
<div class="w-full h-full flex justify-center items-center">
    <div class="w-full h-full flex flex-col justify-center items-center gap-6 p-6">
        <h1 class="title text-6xl sm:text-8xl text-femisalud-900 font-bold">FemiSalud</h1>
        <h2 class="text-inter text-femisalud-900 text-2xl sm:text-4xl font-bold">Inicio de sesión</h2>
        <form action="${pageContext.request.contextPath}/login_auth" method="post" class="flex flex-col justify-center items-center gap-6" novalidate id="auth-form">
            <label>
                <input type="text" id="dni" name="dni" placeholder="Ingrese DNI" class="text-inter bg-femisalud-300 text-femisalud-900 px-3 py-2 outline-none border-2 border-femisalud-600 rounded-lg text-2xl sm:text-4xl" value="<%= session.getAttribute("USER_DNI") != null ? session.getAttribute("USER_DNI") : "" %>" readonly />
            </label>
            <div class="w-full flex justify-center items-center gap-3" id="code-inputs">
                <div>
                    <label for="code-1" class="sr-only">First code</label>
                    <input type="text" maxlength="1" name="code-1" id="code-1" class="w-10 h-10 md:w-16 md:h-16 p-3 text-2xl rounded-lg text-center" data-focus-input-init data-focus-input-next="code-2" required />
                </div>
                <div>
                    <label for="code-2" class="sr-only">Second code</label>
                    <input type="text" maxlength="1" name="code-2" id="code-2" class="w-10 h-10 md:w-16 md:h-16 p-3 text-2xl rounded-lg text-center" data-focus-input-init data-focus-input-prev="code-1" data-focus-input-next="code-3" required />
                </div>
                <div>
                    <label for="code-3" class="sr-only">Third code</label>
                    <input type="text" maxlength="1" name="code-3" id="code-3" class="w-10 h-10 md:w-16 md:h-16 p-3 text-2xl rounded-lg text-center" data-focus-input-init data-focus-input-prev="code-2" data-focus-input-next="code-4" required />
                </div>
                <div>
                    <label for="code-4" class="sr-only">Fourth code</label>
                    <input type="text" maxlength="1" name="code-4" id="code-4" class="w-10 h-10 md:w-16 md:h-16 p-3 text-2xl rounded-lg text-center" data-focus-input-init data-focus-input-prev="code-3" data-focus-input-next="code-5" required />
                </div>
                <div>
                    <label for="code-5" class="sr-only">Fifth code</label>
                    <input type="text" maxlength="1" name="code-5" id="code-5" class="w-10 h-10 md:w-16 md:h-16 p-3 text-2xl rounded-lg text-center" data-focus-input-init data-focus-input-prev="code-4" data-focus-input-next="code-6" required />
                </div>
                <div>
                    <label for="code-6" class="sr-only">Sixth code</label>
                    <input type="text" maxlength="1" name="code-6" id="code-6" class="w-10 h-10 md:w-16 md:h-16 p-3 text-2xl rounded-lg text-center" data-focus-input-init data-focus-input-prev="code-5" required />
                </div>
            </div>
            <button type="submit" id="button-get-code">Iniciar Sesión</button>
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
<script src="${pageContext.request.contextPath}/assets/js/focusInputsCodeAuth.js"></script>
</body>
</html>
