<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="relative w-full h-[90vh]">
    <img src="${pageContext.request.contextPath}/assets/img/background_principal.png" alt="background principal" class="w-full h-full object-cover">
    <h2 class="absolute top-4 sm:top-10 left-4 sm:left-10 transform text-inter font-bold text-2xl md:text-4xl text-femisalud-900">¡Estás listo!!!</h2>
    <div class="absolute bottom-4 sm:bottom-10 right-4 sm:right-10 transform">
        <div id="countdown" class="text-2xl md:text-4xl text-inter font-bold">5</div>
    </div>
    <canvas id="confetti" class="absolute top-0 left-0 w-full h-full z-10 pointer-events-none"></canvas>
</div>
