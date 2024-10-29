<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
  List<String> codes = new ArrayList<>();
  for (int i = 1; i <= 6; i++) {
    codes.add("code-" + i);
  }
  request.setAttribute("codes", codes);
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
  <jsp:include page="fragment/head.jsp"/>
  <title>FemiSalud :: Login</title>
</head>
<body class="w-full h-screen flex justify-center items-center">
<form action="${pageContext.request.contextPath}/send_code" method="post" class="w-full h-full flex flex-col justify-center items-center gap-6 p-6">
  <h1 class="text-8xl font-bold text-blue-800">FemiSalud</h1>
  <h2 class="text-4xl font-semibold text-blue-800">Iniciar sesión</h2>
  <div class="mb-6 w-full">
    <label for="dni" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">DNI</label>
    <input type="text" id="dni" name="dni" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-base focus:ring-blue-500 focus:border-blue-500 text-2xl" placeholder="Ingrese su DNI">
  </div>

  <div id="container_code" class="flex mb-2 space-x-2 rtl:space-x-reverse hidden">
    <c:forEach var="codeId" items="${codes}" varStatus="status">
      <div>
        <label for="${codeId}" class="sr-only">Código ${status.index + 1}</label>
        <input type="text" maxlength="1"
               data-focus-input-init
               data-focus-input-prev="${status.index > 0 ? codes[status.index - 1] : ''}"
               data-focus-input-next="${status.index < codes.size() - 1 ? codes[status.index + 1] : ''}"
               id="${codeId}"
               name="${codeId}"
               class="block w-20 h-20 py-3 text-2xl font-bold text-center text-blue-900 bg-white border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500"/>
      </div>
    </c:forEach>
  </div>

  <input type="submit" value="Obtener código" class="w-full cursor-pointer bg-blue-600 hover:bg-blue-700 text-white font-bold px-3 py-2 rounded-lg">
</form>
<div class="w-full h-full bg-femisalud-900 flex flex-col justify-center items-center gap-6">
  <h2 class="text-white font-bold text-4xl">Especialistas en Salud de la Mujer</h2>
  <figure class="relative bg-white rounded-full w-[70%] h-[70%] flex items-center justify-center">
    <img src="${pageContext.request.contextPath}/assets/img/embarazada-login.webp" alt="embarazada" class="absolute bottom-0 left-0 h-full w-full filter-drop-shadow-50">
  </figure>
</div>
<script src="${pageContext.request.contextPath}/assets/js/formLogin.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/stepInput.js"></script>
</body>
</html>