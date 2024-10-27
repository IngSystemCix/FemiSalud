<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <jsp:include page="fragment/head.jsp"/>
  <title>FemiSalud</title>
</head>
<body class="flex justify-center items-center w-full h-screen bg-femisalud-200">
<form id="loginForm" action="verify_dni" method="post" class="w-full h-full flex flex-col justify-center items-start p-6 gap-6">
  <div class="w-full text-center">
    <h1 class="text-8xl text-center font-semibold mb-10 text-femisalud-600">FemiSalud</h1>
    <h2 class="text-4xl font-bold">Inicio de sesión</h2>
  </div>
  <div class="w-full h-full flex flex-col justify-center items-start gap-6">
    <div class="w-full">
      <label for="input_dni" class="block mb-2 text-femisalud-600 text-2xl font-bold">DNI</label>
      <input type="text" id="input_dni" name="dni" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-femisalud-400 text-2xl focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="72315678" required>
    </div>

    <div id="secction_code" class="w-full hidden">
      <p id="helper-text-explanation" class="mb-2 text-sm text-femisalud-600 dark:text-gray-400">Por favor, introduzca el código de 6 dígitos que le enviamos por correo electrónico.</p>
      <div class="flex justify-center items-center mb-2 space-x-2 rtl:space-x-reverse">
        <% for (int i = 1; i <= 6; i++) { %>
        <div>
          <label for="code-<%= i %>" class="sr-only">Código <%= i %></label>
          <input type="text" maxlength="1" data-focus-input-init data-focus-input-prev="code-<%= i == 1 ? "" : (i - 1) %>" data-focus-input-next="code-<%= i == 6 ? "" : (i + 1) %>" id="code-<%= i %>" class="block w-20 h-20 py-3 text-2xl font-extrabold text-center text-gray-900 bg-femisalud-400 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required />
        </div>
        <% } %>
      </div>
    </div>

    <div class="w-full flex justify-center items-center gap-6">
      <button type="button" id="button-return" class="w-full focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900 hidden">Regresar</button>
      <button type="submit" id="button-get_code" class="w-full text-white bg-blue-800 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2">Obtener código</button>
    </div>
  </div>
</form>

<div class="relative w-full h-full bg-femisalud-900 flex flex-col items-center justify-center rounded-l-3xl">
  <h3 class="text-2xl text-white font-semibold mb-10">Especialistas en Salud de la Mujer</h3>

  <div class="relative w-[70%] h-[70%] rounded-full bg-white">
    <img src="${pageContext.request.contextPath}/assets/img/embarazada-login.webp" alt="Mamá" class="absolute -bottom-20 h-full object-cover filter-drop-shadow-50">
  </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/formLogin.js"></script>
</body>
</html>
