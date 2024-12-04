<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="w-full bg-gradient-to-r from-sky-300 via-fuchsia-200 to-fuchsia-300 rounded-lg px-3 py-2">
    <p>Pronto serás madre de unos <strong class="text-[#115691]">mellizos</strong> y te agradecemos por dejarnos acompañarte en este increible viaje de la maternidad ¡Felicidades, querida futura mamá <strong class="text-[#be125d]">${namePatient}</strong></p>
</div>

<div class="relative w-full h-[90vh]">
    <img src="${pageContext.request.contextPath}/assets/img/background_twins.png" alt="background principal" class="w-full h-full object-cover">
    <div class="absolute top-1/4 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col gap-1 sm:gap-3 justify-center items-center">
        <h2 class="text-inter font-bold text-2xl md:text-8xl text-femisalud-900">Son</h2>
        <h2 class="text-inter font-bold text-2xl md:text-8xl"><strong class="text-[#115691]">Mell</strong><strong class="text-[#be125d]">izos</strong></h2>
    </div>
    <h2 class="absolute bottom-10 left-1/2 transform -translate-x-1/2 text-inter font-bold text-2xl md:text-4xl text-femisalud-900">¡Felicidades!</h2>
</div>
