<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 13/10/2024
  Time: 04:16
  Este es un archivo JSP para la página de bienvenida de FemiSalud.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="relative bg-gradient-to-r from-purple-200 to-transparent rounded-lg p-6 flex w-full">
    <div class="w-[70%]">
        <h2 class="text-2xl font-bold text-femisalud-900 mb-2">Bienvenida a FemiSalud</h2>
        <p>
            Querida futura mamá,
        </p>
        <p>
            Sabemos que estás viviendo uno de los momentos más emocionantes y transformadores de tu vida.
            En FemiSalud, queremos acompañarte en cada paso de este hermoso viaje.
        </p>
    </div>

    <img src="${pageContext.request.contextPath}/assets/img/mom_welcome.png"
         alt="Ilustración de bienvenida para madres en FemiSalud"
         title="Bienvenida a FemiSalud"
         class="h-64 absolute bottom-0 -right-32">
</div>