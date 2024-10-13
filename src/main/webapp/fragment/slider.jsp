<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 13/10/2024
  Time: 04:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="slider" class="flex flex-col justify-center items-center relative w-full">
  <!-- Slider images -->
  <div id="slider-content" class="w-[731px] overflow-hidden relative">
    <div class="w-full flex transition-transform duration-500">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="https://areajugones.sport.es/wp-content/uploads/2023/10/dragon-ball-daima-origen-del-nombre-1-1560x880.png.webp" alt="img 1">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="https://www.rdn.com.py/wp-content/uploads/2024/10/2-0f05578da98f85960edb20ef9c82f92d.jpg" alt="img 2">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxEVf6CsnFYd45h2JKm5jfiN6d8OxJ_GkYkQ&s" alt="img 3">
      <img class="object-cover h-[189px] w-full flex-shrink-0" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtKsqnDR8olLG3gCJ_dznnOonIj-zmaIDaUQ&s" alt="img 4">
    </div>
  </div>

  <!-- Dots for slide indication (below the images) -->
  <div class="flex justify-center mt-2">
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(0)"></button>
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(1)"></button>
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(2)"></button>
    <button class="w-3 h-3 rounded-full bg-gray-400 focus:outline-none mx-1" onclick="goToSlide(3)"></button>
  </div>
</div>
