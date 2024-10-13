const openButton = document.querySelector('#logo');
const navbar = document.querySelector('#navbar');
const labelButtons = document.querySelectorAll('.label_buttom'); //
const buttonSidebar = document.querySelectorAll('.button-sidebar');
const logo = document.getElementById("logo");
let context = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
let isOpen = false;

openButton.addEventListener('click', () => {
    isOpen = !isOpen;

    if (isOpen) {
        navbar.classList.add('w-52');
        navbar.classList.remove('rounded-full');
        navbar.classList.add('rounded-[36px]');
        logo.src = window.location.protocol+"//"+ window.location.host + context + "/assets/img/Femisalud_logo.png";
        logo.classList.remove('w-12');
        logo.classList.add('w-48');
        labelButtons.forEach((label) => label.classList.remove('hidden'));
    } else {
        navbar.classList.remove('w-52');
        navbar.classList.add('rounded-full');
        navbar.classList.remove('rounded-[36px]');
        logo.src = window.location.protocol+"//"+ window.location.host + context + "/assets/img/F_logo.png";
        logo.classList.add('w-12');
        logo.classList.remove('w-48');
        labelButtons.forEach((label) => label.classList.add('hidden'));
    }
});

buttonSidebar.forEach((button, index) => {
    button.addEventListener('click', () => {
        buttonSidebar.forEach((btn, btnIndex) => {
            btn.classList.remove('bg-femisalud-900');
            btn.classList.add('bg-femisalud-100');
            button.classList.remove('border', 'border-solid', 'border-white');
            const iconPaths = btn.querySelectorAll('.icon-button');
            iconPaths.forEach((path) => {
                path.style.fill = '#11568f';
            });
        });

        button.classList.remove('bg-femisalud-100');
        button.classList.add('bg-femisalud-900');
        button.classList.add('border', 'border-solid', 'border-white');

        const selectedIconPaths = button.querySelectorAll('.icon-button');
        selectedIconPaths.forEach((path) => {
            path.style.fill = '#DDEDFC';
        });
    });
});


