<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 22/10/2024
  Time: 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <jsp:include page="fragment/head.jsp"/>
  <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
  <jsp:include page="fragment/sidebar.jsp"/>
</div>
<div class="flex justify-center items-center w-full min-h-screen bg-blue-50 h-screen p-6 overflow-hidden">
  <div class="w-full p-6">
    <!-- Título alineado a la izquierda -->
    <h1 class="text-4xl font-bold text-blue-700 mb-4 text-left">Bebé | Revelación de sexo</h1>

    <!-- Fila con texto y cigüeña -->
    <div class="bg-gradient-to-r from-blue-100 to-white rounded-lg p-4 mb-8 flex justify-between items-center">
      <!-- Texto alineado a la izquierda -->
      <p class="text-xl text-gray-700">Tu bebé será...</p>

      <!-- Imagen de la cigüeña alineada a la derecha -->
      <img src="https://s3-alpha-sig.figma.com/img/eed8/bc58/d516d723eddc56211c4efeebbd0c89cc?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oT-7byI~LxsLB3GFYQ~PSfPlW7g~ugJlASNlpdVETf99d2~69eLyUusfJIaaKonopHTSbMU996ZlRKqNzUbtJ~7A-2km6hIpqoyQiz6S0CASjjEssn7O1d0krPyDUDh7VizOShBwBYpj8jPGtmt-cwwyIR0zRahfDpuKF~NwtkZ60xCvKSCzDZSq~b4kRWs9YizTaYhJhZjZPVJZe1sQmt8Q9fFYIMzFT6QSiOIhMjW6wiDb2Qez1XGUOBiYSl85vaTyOhcLjYubE0Je2A-q4nHTAWBuvq1tlNdJoRlBdHQ5gJyoVip8UREhzXJRPTt5SoV9hexxirEZaVATk1TJsg__" alt="Cigüeña" class="w-24">
    </div>

    <!-- Contenedor con bordes redondeados, globos, pregunta y conteo -->
    <div class="bg-white shadow-lg rounded-lg p-40 relative overflow-hidden">
      <!-- Imagen de fondo (globos) -->
      <div class="absolute inset-0 bg-cover opacity-30 rounded-lg" style="background-image: url('https://s3-alpha-sig.figma.com/img/497a/2c47/9b2cbb66416f77c825c56e006039a52e?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BcxTG2IYLCvL9JdTrFUqn8ZQ2D78vIcPTH1EAQG2fj2ag395MvGOHS1O08hMGMKS9iqmci-WFuRmiUPezaADsIvPPWp6sOJO-QhUhLvglrlEuyqF7WCWKXzgj-PCwIu~hLSYHs5K8beqxl0iE-xfi5Iv2yUo1VReyFulV7fEv~dlg1m6zXln6XQO5Ksigw9stPzDz41AMf8EbF2H0TXIF0H58oZAd21IzXqi~oGb80pUb0G8gEdHkIyJdGkR9LoqSe83wg7Mj9AP7uN0eRWkbDpOA4RW7yj8igtVOCmwbIUWcx7V9vDUhYAZy3qzkwsYMjvY6HsZsZP~xRIMn6P10A__');"></div>

      <!-- Contenido del contenedor -->
      <div class="relative z-10">
        <!-- ¿Niño o Niña? -->
        <div class="flex justify-center items-center space-x-6 mt-8">
          <span class="text-blue-700 text-6xl font-bold">¿Niño</span>
          <span class="text-black text-6xl font-bold">o</span>
          <span class="text-pink-500 text-6xl font-bold">niña?</span>
        </div>

        <!-- Contador -->
        <div class="mt-16 text-center">
          <p class="text-gray-700 text-2xl">DESCUBRE EN</p>
          <div id="countdown" class="text-7xl font-bold text-gray-900">5</div>
        </div>
      </div>

      <!-- Margen inferior -->
      <div class="mt-16 mb-8"></div>
    </div>
  </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/countdownRevelation.js"></script>
</body>
</html>