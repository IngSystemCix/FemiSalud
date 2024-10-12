const openButton = document.querySelector('#logo');
const navbar = document.querySelector('#navbar');
const labelButtons = document.querySelectorAll('.label_buttom'); //
let isOpen = false;

openButton.addEventListener('click', () => {
    isOpen = !isOpen;

    if (isOpen) {
        navbar.classList.add('w-52');
        navbar.classList.remove('rounded-full');
        navbar.classList.add('rounded-[36px]');
        labelButtons.forEach((label) => label.classList.remove('hidden'));
    } else {
        navbar.classList.remove('w-52');
        navbar.classList.add('rounded-full');
        navbar.classList.remove('rounded-[36px]');
        labelButtons.forEach((label) => label.classList.add('hidden'));
    }
});