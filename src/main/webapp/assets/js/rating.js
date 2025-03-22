
let ratingDivs = document.querySelectorAll('.rating')
ratingDivs.forEach(ratingDiv => {
    const allStar = ratingDiv.querySelectorAll('.star')
    const ratingValue = ratingDiv.querySelector('input')

    allStar.forEach((item, idx) => {
        item.addEventListener('click', function () {
            let click = 0
            ratingValue.value = idx + 1

            allStar.forEach(i => {
                i.innerHTML = 'star_border'
                i.classList.remove('active')
            })

            for (let i = 0; i < allStar.length; i++) {
                if (i <= idx) {
                    allStar[i].innerHTML = 'star'
                    allStar[i].classList.add('active')
                } else {
                    // allStar[i].style.setProperty('--i', click)
                    click++
                }
            }
        })
    })
})