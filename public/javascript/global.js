function removeCookie(name) {
    document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/`;
}

document.getElementById('header-logout-button').addEventListener('click', () => {
    removeCookie('apiKey')
    location.href = '/'
})