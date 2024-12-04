const logo = document.querySelector('#logo');
let check = true;

logo.addEventListener('click', () => {
    const sidebar = document.querySelector('#sidebar');
    const labelButton = document.querySelectorAll('.label-button');
    const containerButton = document.querySelectorAll('.container-button');
    if (check) {
        logo.innerHTML = 'FemiSalud';
        sidebar.classList.remove('rounded-full');
        sidebar.classList.add('rounded-xl');
        sidebar.classList.remove('w-[100px]');
        sidebar.classList.add('w-[300px]');
        labelButton.forEach(element => element.classList.remove('hidden'));
        containerButton.forEach(element => {
            element.classList.remove('justify-center')
            element.classList.add('justify-start')
            element.classList.add('pl-4')
        });
    } else {
        logo.innerHTML = 'F';
        sidebar.classList.remove('rounded-xl');
        sidebar.classList.add('rounded-full');
        sidebar.classList.remove('w-[300px]');
        sidebar.classList.add('w-[100px]');
        labelButton.forEach(element => element.classList.add('hidden'));
        containerButton.forEach(element => {
            element.classList.remove('justify-start')
            element.classList.add('justify-center')
            element.classList.remove('pl-4')
        });
    }

    check = !check;
});
