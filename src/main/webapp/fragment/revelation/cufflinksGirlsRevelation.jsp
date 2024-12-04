<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="w-full bg-gradient-to-r from-fuchsia-300 via-fuchsia-200 to-transparent rounded-lg px-3 py-2">
    <p>Pronto serás madre de unas <strong class="text-[#be125d]">gemelas</strong> y te agradecemos por dejarnos acompañarte en este increible viaje de la maternidad ¡Felicidades, querida futura mamá <strong class="text-[#be125d]">${namePatient}</strong></p>
</div>

<div class="relative w-full h-[90vh]">
    <img src="${pageContext.request.contextPath}/assets/img/background_cufflinks_girl.png" alt="background principal" class="w-full h-full object-cover">
    <div class="absolute top-[60%] left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col gap-1 sm:gap-3 justify-center items-center">
        <h2 class="text-inter font-bold text-2xl md:text-8xl text-femisalud-900">son</h2>
        <h2 class="text-inter font-bold text-2xl md:text-8xl text-[#be125d]">gemelas</h2>
    </div>
    <h2 class="absolute bottom-4 sm:bottom-10 left-1/2 transform -translate-x-1/2 text-inter font-bold text-2xl md:text-4xl text-femisalud-900">¡Felicidades!</h2>
</div>
