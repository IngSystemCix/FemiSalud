<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 12/10/2024
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="h-[calc(100vh-2rem)] absolute left-4 top-4 bg-femisalud-900 rounded-full p-6 flex flex-col justify-start  gap-6" id="navbar">
    <img class="cursor-pointer w-12 h-12" id="logo" src="${pageContext.request.contextPath}/assets/img/F_logo.png" alt="Logo">
    <ul class="h-full flex flex-col gap-3">
        <li class="flex justify-start items-center gap-3">
            <a href="#" class="button-sidebar rounded-full border border-solid border-white bg-femisalud-900 p-4">
                <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_273_494)">
                        <path class="icon-button" d="M27.5 15.8333C27.3903 15.8339 27.2816 15.8129 27.1801 15.7715C27.0786 15.73 26.9862 15.6689 26.9084 15.5916L15 3.67498L3.09169 15.5916C2.93227 15.7282 2.72721 15.7995 2.51748 15.7914C2.30775 15.7833 2.1088 15.6964 1.96039 15.5479C1.81197 15.3995 1.72503 15.2006 1.71693 14.9909C1.70883 14.7811 1.78017 14.5761 1.91669 14.4166L14.4167 1.91664C14.5728 1.76143 14.784 1.67432 15.0042 1.67432C15.2243 1.67432 15.4356 1.76143 15.5917 1.91664L28.0917 14.4166C28.2064 14.5336 28.284 14.6818 28.3149 14.8427C28.3458 15.0036 28.3287 15.17 28.2655 15.3211C28.2024 15.4723 28.0961 15.6015 27.96 15.6926C27.8238 15.7837 27.6638 15.8326 27.5 15.8333Z" fill="#DDEDFC"/>
                        <path class="icon-button" d="M15 6.49164L5 16.525V26.6666C5 27.1087 5.17559 27.5326 5.48816 27.8452C5.80072 28.1577 6.22464 28.3333 6.66667 28.3333H12.5V20H17.5V28.3333H23.3333C23.7754 28.3333 24.1993 28.1577 24.5118 27.8452C24.8244 27.5326 25 27.1087 25 26.6666V16.4666L15 6.49164Z" fill="#DDEDFC"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_273_494">
                            <rect class="icon-button" width="30" height="30" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>
            </a>
            <span class="text-center label_buttom hidden text-white font-bold">Inicio</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="#" class="button-sidebar rounded-full bg-femisalud-100 p-4">
                <svg class="size-7" width="39" height="29" viewBox="0 0 39 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="icon-button" d="M23.1875 16.4472C22.5051 19.2659 26.2987 19.9832 25.4031 21.9692C24.5071 23.9547 22.5018 23.5578 22.7255 25.5433C22.9498 27.5292 25.6034 27.5572 28.0194 26.3609C32.8508 23.968 33.859 18.7412 31.6725 16.4472C28.9854 13.6284 23.8698 13.6284 23.1875 16.4472Z" fill="#115691" stroke="#115691"/>
                    <path class="icon-button" d="M31.6239 14.2569C32.0294 14.5823 32.7717 14.3745 33.282 13.7928C33.7924 13.2111 33.8774 12.4757 33.4719 12.1503C33.0665 11.8248 32.3241 12.0326 31.8138 12.6143C31.3035 13.1961 31.2185 13.9315 31.6239 14.2569Z" fill="#115691"/>
                    <path class="icon-button" d="M29.4709 13.1061C29.9506 13.32 30.6114 12.9355 30.947 12.2473C31.2825 11.559 31.1656 10.8277 30.6859 10.6137C30.2062 10.3998 29.5454 10.7842 29.2099 11.4725C28.8743 12.1607 28.9912 12.8921 29.4709 13.1061Z" fill="#115691"/>
                    <path class="icon-button" d="M27.0532 12.7689C27.5796 12.8218 28.0736 12.2524 28.1565 11.4972C28.2395 10.742 27.8801 10.0868 27.3537 10.0339C26.8273 9.98101 26.3334 10.5503 26.2504 11.3056C26.1674 12.0608 26.5268 12.7159 27.0532 12.7689Z" fill="#115691"/>
                    <path class="icon-button" d="M23.3638 12.3894C24.1098 12.1297 24.4211 11.1479 24.0591 10.1964C23.697 9.24494 22.7987 8.68418 22.0527 8.94391C21.3067 9.20363 20.9954 10.1855 21.3574 11.137C21.7195 12.0884 22.6178 12.6492 23.3638 12.3894Z" fill="#115691" stroke="#115691"/>
                    <path class="icon-button" d="M33.3636 15.9212C33.7038 16.309 34.4726 16.2277 35.0808 15.7395C35.6889 15.2514 35.9062 14.5413 35.566 14.1535C35.2257 13.7657 34.4569 13.847 33.8488 14.3351C33.2406 14.8233 33.0234 15.5333 33.3636 15.9212Z" fill="#115691"/>
                    <path class="icon-button" d="M15.8125 9.44719C16.4949 12.2659 12.7013 12.9832 13.5969 14.9692C14.4929 16.9547 16.4982 16.5578 16.2745 18.5433C16.0502 20.5292 13.3966 20.5572 10.9806 19.3609C6.14918 16.968 5.14101 11.7412 7.32745 9.44719C10.0146 6.62844 15.1302 6.62844 15.8125 9.44719Z" fill="#115691" stroke="#115691"/>
                    <path class="icon-button" d="M7.3761 7.25688C6.97065 7.5823 6.22828 7.37452 5.71796 6.79279C5.20765 6.21106 5.12263 5.47568 5.52808 5.15026C5.93353 4.82484 6.6759 5.03262 7.18621 5.61435C7.69653 6.19607 7.78154 6.93146 7.3761 7.25688Z" fill="#115691"/>
                    <path class="icon-button" d="M9.5291 6.10606C9.04942 6.32002 8.38856 5.93553 8.05304 5.24729C7.71752 4.55905 7.83439 3.82767 8.31407 3.61372C8.79376 3.39976 9.45461 3.78425 9.79013 4.47249C10.1257 5.16073 10.0088 5.89211 9.5291 6.10606Z" fill="#115691"/>
                    <path class="icon-button" d="M11.9468 5.76886C11.4204 5.82178 10.9264 5.25244 10.8435 4.49721C10.7605 3.74198 11.1199 3.08685 11.6463 3.03393C12.1727 2.98101 12.6666 3.55035 12.7496 4.30558C12.8326 5.06081 12.4732 5.71594 11.9468 5.76886Z" fill="#115691"/>
                    <path class="icon-button" d="M15.6362 5.38945C14.8902 5.12972 14.5789 4.14786 14.9409 3.1964C15.303 2.24494 16.2013 1.68418 16.9473 1.94391C17.6933 2.20363 18.0046 3.18549 17.6426 4.13695C17.2805 5.08841 16.3822 5.64917 15.6362 5.38945Z" fill="#115691" stroke="#115691"/>
                    <path class="icon-button" d="M5.63642 8.92117C5.29621 9.30899 4.5274 9.22767 3.91923 8.73954C3.31106 8.25141 3.09383 7.54132 3.43404 7.1535C3.77425 6.76568 4.54307 6.847 5.15124 7.33513C5.75941 7.82325 5.97663 8.53335 5.63642 8.92117Z" fill="#115691"/>
                </svg>
            </a>
            <span class="text-center label_buttom hidden text-white font-bold">Bebé</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="#" class="button-sidebar rounded-full bg-femisalud-100 p-4">
                <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_273_501)">
                        <path class="icon-button" d="M2.76562 16.875C5.06625 20.325 8.96063 24.1331 15 28.125C21.0394 24.1331 24.9337 20.325 27.2344 16.875H22.5C22.3128 16.875 22.1299 16.8189 21.9748 16.7139C21.8197 16.609 21.6996 16.4601 21.63 16.2863L18.8981 9.45752L15.9019 19.9444C15.8483 20.1325 15.7373 20.2991 15.5843 20.4209C15.4313 20.5427 15.2441 20.6137 15.0488 20.6238C14.8535 20.6339 14.6599 20.5827 14.4952 20.4774C14.3304 20.372 14.2027 20.2178 14.13 20.0363L11.0419 12.315L8.28 16.4588C8.19425 16.587 8.07821 16.692 7.94215 16.7646C7.80609 16.8372 7.65422 16.8751 7.5 16.875H2.76562Z" fill="#115691"/>
                        <path class="icon-button" d="M1.65009 15C-4.55053 3.15002 8.26884 -3.74998 14.6682 2.14314C14.7807 2.24689 14.8907 2.35377 14.9982 2.46377C15.1038 2.35308 15.2139 2.24674 15.3282 2.14502C21.7313 -3.74998 34.5488 3.15002 28.3501 15H23.132L19.6182 6.21377C19.5455 6.03224 19.4178 5.87801 19.253 5.77265C19.0883 5.6673 18.8947 5.6161 18.6994 5.62623C18.5041 5.63635 18.3169 5.7073 18.1639 5.82912C18.011 5.95095 17.8999 6.11757 17.8463 6.30564L14.852 16.7925L12.1201 9.96377C12.0565 9.80536 11.9508 9.66733 11.8145 9.56456C11.6782 9.4618 11.5164 9.39821 11.3466 9.38065C11.1768 9.36309 11.0054 9.39223 10.8509 9.46492C10.6965 9.53762 10.5648 9.6511 10.4701 9.79315L6.99759 15H1.65009Z" fill="#115691"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_273_501">
                            <rect width="30" height="30" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>
            </a>
            <span class="text-center label_buttom hidden text-white font-bold">Ecografías</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="#" class="button-sidebar rounded-full bg-femisalud-100 p-4">
                <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="icon-button" d="M22.5 3.75C23.8261 3.75 25.0978 4.27678 26.0355 5.21447C26.9732 6.15215 27.5 7.42392 27.5 8.75V18.75C27.5 20.0761 26.9732 21.3479 26.0355 22.2855C25.0978 23.2232 23.8261 23.75 22.5 23.75H16.595L10.6425 27.3213C10.4632 27.4288 10.2599 27.4897 10.051 27.4984C9.84208 27.507 9.63436 27.4631 9.44682 27.3707C9.25928 27.2783 9.09792 27.1404 8.97749 26.9695C8.85706 26.7986 8.78143 26.6002 8.7575 26.3925L8.75 26.25V23.75H7.5C6.2172 23.75 4.98346 23.257 4.05398 22.3728C3.12451 21.4887 2.57039 20.2812 2.50625 19L2.5 18.75V8.75C2.5 7.42392 3.02678 6.15215 3.96447 5.21447C4.90215 4.27678 6.17392 3.75 7.5 3.75H22.5ZM17.5 15H10C9.66848 15 9.35054 15.1317 9.11612 15.3661C8.8817 15.6005 8.75 15.9185 8.75 16.25C8.75 16.5815 8.8817 16.8995 9.11612 17.1339C9.35054 17.3683 9.66848 17.5 10 17.5H17.5C17.8315 17.5 18.1495 17.3683 18.3839 17.1339C18.6183 16.8995 18.75 16.5815 18.75 16.25C18.75 15.9185 18.6183 15.6005 18.3839 15.3661C18.1495 15.1317 17.8315 15 17.5 15ZM20 10H10C9.66848 10 9.35054 10.1317 9.11612 10.3661C8.8817 10.6005 8.75 10.9185 8.75 11.25C8.75 11.5815 8.8817 11.8995 9.11612 12.1339C9.35054 12.3683 9.66848 12.5 10 12.5H20C20.3315 12.5 20.6495 12.3683 20.8839 12.1339C21.1183 11.8995 21.25 11.5815 21.25 11.25C21.25 10.9185 21.1183 10.6005 20.8839 10.3661C20.6495 10.1317 20.3315 10 20 10Z" fill="#115691"/>
                </svg>
            </a>
            <span class="text-center label_buttom hidden text-white font-bold">Mensaje</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="#" class="button-sidebar rounded-full bg-femisalud-100 p-4">
                <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="icon-button" d="M14.9063 1.19526C16.582 1.27729 18.7383 1.68744 20.1094 2.19135L20.4492 2.32026L20.7774 3.11713C21.2344 4.23041 21.75 5.26166 22.1133 5.80073C22.3477 6.14057 22.418 6.31635 22.418 6.45698C22.418 7.07807 21.4688 8.03901 20.3555 8.54291C20.1563 8.63666 20.0156 8.73041 20.0391 8.75385C20.0625 8.77729 20.25 8.91791 20.4492 9.05854C20.6484 9.21088 20.9531 9.44526 21.1289 9.5976C21.5508 9.94916 22.8047 11.1679 22.8047 11.2265C22.8047 11.2968 22.2188 11.2734 21.7969 11.1914C21.5742 11.1445 21.1875 11.0273 20.918 10.9453C20.3203 10.746 20.0859 10.746 19.1602 10.9335C18.5391 11.0624 18.4102 11.1093 18.1758 11.2851C18.0234 11.4023 17.6953 11.6249 17.4492 11.7773C17.1914 11.9296 16.9688 12.0937 16.9453 12.1406C16.8984 12.246 17.1914 12.4804 17.3672 12.4804C17.4492 12.4804 17.6719 12.3984 17.8477 12.3046C18.1992 12.1289 19.2539 11.6953 19.2774 11.7187C19.3008 11.7421 18.8555 12.0585 18.6094 12.1757C18.4922 12.2343 18.2461 12.3281 18.0586 12.3749C17.6133 12.5039 17.0391 12.8203 16.2422 13.3828C15.457 13.9335 15.1641 14.2148 15.1992 14.4257C15.2227 14.6718 15.3984 14.6367 15.9844 14.2968C16.2774 14.121 16.7227 13.8867 16.9688 13.7695C17.4141 13.5468 18.3164 13.207 18.3633 13.2539C18.3867 13.289 17.3672 13.7812 17.2852 13.7812C17.1211 13.7812 15.4688 14.7187 15.2109 14.9531C15.0586 15.0937 15.0586 15.2695 15.1875 15.3984C15.2813 15.4804 15.3164 15.4804 15.5156 15.4101C15.6445 15.3632 15.9258 15.2343 16.1484 15.1054C16.5938 14.8593 17.4375 14.5312 18.2227 14.3085C18.5039 14.2265 18.7852 14.1445 18.8203 14.1328C18.8789 14.1093 18.8906 14.121 18.8438 14.1679C18.8086 14.2031 18.5859 14.3085 18.3633 14.3906C18.1289 14.4726 17.5078 14.789 16.9922 15.0703C16.2188 15.5039 16.0313 15.621 15.9961 15.7382C15.9727 15.8203 15.9844 15.914 16.0078 15.9726C16.1133 16.1484 16.3359 16.1015 17.0508 15.7851C17.918 15.3984 19.3711 14.8124 19.4063 14.8476C19.4531 14.8945 18.5274 15.3984 18.1172 15.539C17.6836 15.6914 17.4024 15.8906 17.4024 16.0429C17.4024 16.1601 17.6719 16.371 17.8359 16.371C17.9297 16.371 18.4336 16.2187 18.9727 16.0429C19.5 15.8671 20.2969 15.621 20.7188 15.5273C21.6563 15.3046 22.0899 15.0937 22.9805 14.414C23.9297 13.7109 23.9063 13.7226 24.4805 13.8984C24.8203 14.0039 24.8555 14.0273 24.9844 14.2851C26.2617 16.8046 26.0274 19.8749 24.3399 22.582C23.9297 23.2499 23.3906 23.9296 22.5352 24.8906C22.1016 25.371 21.6445 25.9101 21.5156 26.0976C21.1875 26.5429 21.0352 27.0585 21.0352 27.6914C21.0352 28.1953 21.0938 28.3945 21.3164 28.6992L21.3984 28.8163H13.8281H6.25782L5.82423 28.1367C5.05079 26.9648 4.68751 26.1796 4.41798 25.1249C4.20704 24.3046 4.16017 23.0976 4.33595 22.289C4.48829 21.539 4.91017 20.4257 5.43751 19.4062C5.82423 18.6328 6.55079 17.3788 6.63282 17.332C6.64454 17.3203 7.11329 17.7304 7.65236 18.246C8.71876 19.2656 9.31642 19.7695 9.87892 20.1679C10.0781 20.3085 10.5352 20.6953 10.875 21.0234C11.4961 21.621 11.5078 21.621 12.6445 22.207C13.2656 22.5234 14.1797 23.0039 14.6484 23.2734C15.668 23.8476 16.2891 24.0703 17.5078 24.3164C18.5039 24.5156 19.3945 24.5624 20.7305 24.4921C21.7266 24.4453 21.9024 24.3984 21.832 24.2226C21.7852 24.0937 21.7031 24.0468 21.4922 24.0468C21.1875 24.0468 21.457 23.9531 21.8086 23.9531C22.3477 23.9413 22.5 23.789 22.2422 23.5429C22.1367 23.4374 22.043 23.4023 21.6328 23.3789C20.7656 23.3085 20.7539 23.2499 21.6211 23.2499C22.4649 23.2499 22.5469 23.2265 22.5469 22.9921C22.5469 22.8163 22.2656 22.5117 22.0195 22.4296C21.9024 22.3945 21.4219 22.3476 20.9649 22.3124C20.2969 22.2773 19.9688 22.2304 19.4531 22.0898C17.9766 21.7031 17.1914 21.3632 17.1328 21.082C17.1094 20.9531 17.332 20.9648 18.3047 21.0937C19.6406 21.2929 19.6758 21.2929 19.7813 21.1406C19.8984 20.9765 19.8867 20.8007 19.7695 20.6835C19.7109 20.6249 19.2891 20.4374 18.8203 20.2617C18.3516 20.0859 17.6836 19.8046 17.3203 19.6406C16.9688 19.4765 16.5234 19.3124 16.3359 19.2773C15.9961 19.2187 15.9727 19.2187 14.9531 19.4062C14.0039 19.582 13.207 19.2421 12.0352 18.1523C10.9922 17.1796 9.24611 14.8593 8.1797 13.0195C8.01564 12.7382 7.72267 12.246 7.54689 11.9179C6.48048 10.0898 5.76564 7.80463 5.48439 5.34369L5.40236 4.66401L5.63673 4.40619C6.23439 3.72651 7.30079 2.95307 8.3672 2.42573C10.2422 1.46479 12.3164 1.07807 14.9063 1.19526Z" fill="#115691"/>
                </svg>
            </a>
            <span class="text-center label_buttom hidden text-white font-bold">Perfil</span>
        </li>
    </ul>
    <button type="button" class="flex justify-start items-center gap-3">
        <a href="" class="button-sidebar rounded-full bg-femisalud-100 p-4">
            <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path class="icon-button" d="M29.8799 14.4375C29.7197 14.2969 29.7197 14.1562 29.5595 14.0156L24.7545 9.79688C24.1139 9.23438 23.1529 9.23438 22.5122 9.79688C21.8715 10.3594 21.8715 11.2031 22.5122 11.7656L24.5944 13.5937H17.2267C16.2657 13.5937 15.625 14.1562 15.625 15C15.625 15.8437 16.2657 16.4062 17.2267 16.4062H24.5944L22.5122 18.2344C21.8715 18.7969 21.8715 19.6406 22.5122 20.2031C22.8325 20.4844 23.313 20.625 23.6334 20.625C23.9537 20.625 24.4342 20.4844 24.7545 20.2031L29.5595 15.9844C29.7197 15.8437 29.8799 15.7031 29.8799 15.5625C30.04 15.1406 30.04 14.8594 29.8799 14.4375Z" fill="#115691"/>
                <path class="icon-button" d="M20.5871 25.1667C18.7754 26.1667 16.7991 26.6667 14.8227 26.6667C8.39954 26.6667 3.29394 21.5 3.29394 15C3.29394 8.5 8.39954 3.33333 14.8227 3.33333C16.7991 3.33333 18.7754 3.83333 20.5871 4.83333C21.4106 5.33333 22.3988 5 22.8929 4.16667C23.3869 3.33333 23.0576 2.33333 22.2341 1.83333C19.9283 0.666667 17.4579 0 14.8227 0C6.58787 0 0 6.66667 0 15C0 23.3333 6.58787 30 14.8227 30C17.4579 30 19.9283 29.3333 22.2341 28C23.0576 27.5 23.2222 26.5 22.8929 25.6667C22.3988 25 21.4106 24.6667 20.5871 25.1667Z" fill="#115691"/>
            </svg>
        </a>
        <span class="text-center label_buttom hidden text-white font-bold">Cerrar Sesión</span>
    </button>
</nav>