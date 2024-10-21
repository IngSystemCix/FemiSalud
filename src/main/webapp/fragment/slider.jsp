<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 13/10/2024
  Time: 04:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="slider" class="flex flex-col justify-center items-center relative w-full rounded-lg">
  <!-- Slider images -->
  <div id="slider-content" class="w-[731px] overflow-hidden relative rounded-lg">
    <div class="w-full flex transition-transform duration-500">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="${pageContext.request.contextPath}/assets/img/banner_1.png" alt="img 1">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="${pageContext.request.contextPath}/assets/img/banner_2.png" alt="img 2">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="${pageContext.request.contextPath}/assets/img/banner_3.png" alt="img 3">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="${pageContext.request.contextPath}/assets/img/banner_4.png" alt="img 4">
    </div>
  </div>

  <!-- Dots for slide indication (below the images) -->
  <div id="slider-dots" class="flex justify-center mt-2">
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(0)"></button>
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(1)"></button>
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(2)"></button>
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(3)"></button>
  </div>
</div>
