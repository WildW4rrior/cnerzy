//-------------- js for signature custom file input starts----------------------
const chooseNewSignatureBtn = document.querySelector('.choose-new-signature-btn')
const newSignatureInput = document.querySelector('#signature-input')
const signaturePreviewArea = document.querySelector('.signature-preview-area')

chooseNewSignatureBtn.addEventListener('click',()=>{
    newSignatureInput.click()
})

newSignatureInput.addEventListener('change',function(){
    const image = this.files[0]
    // console.log(this.files[0])
    // if(image.size < 2000){
    // }else{
    // }
    const reader = new FileReader()
    reader.onload = () => {
        const allImg = signaturePreviewArea.querySelectorAll('img')
        allImg.forEach(item =>item.remove());
        const imgUrl = reader.result;
        const img = document.createElement('img')
        img.style.maxWidth="100%"
        img.src = imgUrl;
        signaturePreviewArea.appendChild(img)
        signaturePreviewArea.dataset.img = image.name
    }
    reader.readAsDataURL(image)
})
//-------------- js for signature custom file input ends----------------------


//-------------- js for Change Profile Pic custom file input starts----------------------
const chooseNewProfilePicBtn = document.querySelector('.choose-new-profile-pic')
const profilePicInput = document.querySelector('#profile-pic-input')
const profilePicPreview = document.querySelector('.profile-pic-preview-area')

chooseNewProfilePicBtn.addEventListener('click',()=>{
    profilePicInput.click()
})

profilePicInput.addEventListener('change',function(){
    const image = this.files[0]
    // console.log(this.files[0])
    // if(image.size < 2000){
    // }else{
    // }
    const reader = new FileReader()
    reader.onload = () => {
        const allImg = profilePicPreview.querySelectorAll('img')
        allImg.forEach(item =>item.remove());
        const imgUrl = reader.result;
        const img = document.createElement('img')
        img.style.maxWidth="100%"
        img.src = imgUrl;
        profilePicPreview.appendChild(img)
        profilePicPreview.dataset.img = image.name
    }
    reader.readAsDataURL(image)
})
//-------------- js for signature custom file input ends----------------------
