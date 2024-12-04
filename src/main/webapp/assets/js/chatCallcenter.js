const clientContact = document.getElementById('client_contact');
const toggleMenuBtn = document.getElementById('toggleMenuBtn');
const chat = document.getElementById('chat');
const toggleMenuBtnClient = document.getElementById('toggleMenuBtnClient');

toggleMenuBtn.addEventListener('click', () => {
    clientContact.classList.add('hidden');
    chat.classList.remove('hidden');
    chat.classList.add('flex', 'flex-col');
});

toggleMenuBtnClient.addEventListener('click', () => {
    clientContact.classList.remove('hidden');
    chat.classList.add('hidden');
    chat.classList.remove('flex', 'flex-col');
});