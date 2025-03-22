//--------------------custom-file-upload-section-1 starts here---------------
document.addEventListener('DOMContentLoaded', function () {

    let fileUploadSections = document.querySelectorAll('.custom-file-upload-section-1')
    // console.log(fileUploadSections)
    fileUploadSections.forEach(section => {
        // let section = document.querySelector('.custom-file-upload-section-1');
        let inner_1 = section.querySelector('.inner-1');
        let inner_2 = section.querySelector('.inner-2');
        let filenameBtn = inner_2.querySelector('.filename');
        let click_area = section.querySelector('.click-area');
        let fileInput = section.querySelector('input[type="file"]');
        let documentLinkInput = inner_1.querySelector('input[type="text"]')
        let link_field_group = inner_2.querySelector('.link-field-group')
        let linkSpan = link_field_group.querySelector('span')

        let inputIconEnd = inner_1.querySelector('.input-icon.end')
        let documentErrSpan = inner_1.querySelector('.err-text')
        // console.log(section,fileInput)

        function showError(id, errorMsg) {
            let errSpan = document.getElementById(id)
            errSpan.innerHTML = errorMsg
        }

        function onLinkInput(event) {
            // Use a setTimeout to get the pasted content after the event
            setTimeout(function () {
                let link = documentLinkInput.value;
                if (link) {
                    link_field_group.classList.remove('d-none')
                    if (!filenameBtn.classList.contains('d-none')) {
                        // console.log('hiding btn field')
                        filenameBtn.classList.toggle('d-none')
                    }
                    if (link.length > 20) {
                        linkSpan.innerHTML = link.substr(0, 15) + "..." + link.slice(-5);
                    } else {
                        linkSpan.innerHTML = link;
                    }
                    // toggleInner1(inner_1);
                    // toggleInner2(inner_2);
                    toggleSection(section, 'inner-1')
                    toggleSection(section, 'inner-2')
                    showError(documentErrSpan.id, '')
                } else {
                    showError(documentErrSpan.id, 'Please paste link here')
                }
            }, 0);
        }

        documentLinkInput.addEventListener('change', function () {
            showError(documentErrSpan.id, '')
        })
        documentLinkInput.addEventListener('input', function () {
            showError(documentErrSpan.id, '')
        })
        documentLinkInput.addEventListener('paste', (e) => onLinkInput(e));

        inputIconEnd.addEventListener('click', (e) => onLinkInput(e))

        fileInput.addEventListener("change", uploadImage)
        function uploadImage() {
            let file = fileInput.files[0]
            // console.log(file)
            if (file) {
                filenameBtn.classList.remove('d-none')
                if (!link_field_group.classList.contains('d-none')) {
                    // console.log('hiding link field')
                    link_field_group.classList.toggle('d-none')
                }
                let subStrArray = file.name.split(".");
                if (file.name.length > 15) {
                    filenameBtn.innerHTML = file.name.substr(0, 15) + "..." + subStrArray[subStrArray.length - 1];
                } else {
                    filenameBtn.innerHTML = file.name;
                }
                documentLinkInput.value = ''
                // toggleInner1(inner_1)
                // toggleInner2(inner_2)
                toggleSection(section, 'inner-1')
                toggleSection(section, 'inner-2')
            }
        }

        click_area.addEventListener('click', function () {
            fileInput.click();
        });
        section.addEventListener("dragover", function (e) {
            e.preventDefault()
        });
        section.addEventListener("drop", function (e) {
            e.preventDefault()
            fileInput.files = e.dataTransfer.files;
            uploadImage()

            // Dispatch a custom event for validation
            const dropEvent = new CustomEvent('fileDropped', { detail: { files: e.dataTransfer.files } });
            section.dispatchEvent(dropEvent);

        })

        function toggleInner1(section) {
            inner_1.classList.toggle('d-none')
        }
        function toggleInner2(inner_2) {
            inner_2.classList.toggle('d-none')
        }
        function toggleSection(section, toggledSectionClass) {
            section.querySelector(`.${toggledSectionClass}`).classList.toggle('d-none')
        }
        function chooseAgain(sectionId) {
            let section = document.querySelector(`#${sectionId}`)
            toggleSection(section, 'inner-1')
            toggleSection(section, 'inner-2')

            let inputs = section.querySelectorAll('input,textarea')
            // console.log(sectionId,inputs)
            inputs.forEach(input => {
            if (input.name === 'file' || input.name === 'fileViaLink' || input.tagName.toLowerCase() === 'textarea') {
                input.value = ''; // Empty the value of the input
            }
            })
        }
        // Make chooseAgain function globally accessible
        window.chooseAgain = chooseAgain;

        // function selectionDone(sectionId) {
        //     let section = document.querySelector(`#${sectionId}`)
        //     toggleSection(section, 'inner-2')
        //     toggleSection(section, 'inner-3')

        //     let file = section.querySelector('input[type="file"]').files[0]
        //     console.log(file.name)
        //     let fileName = section.querySelector('.filename-or-link-text')
        //     fileName.innerHTML = file.name

        //     let description = section.querySelector('.description-text')
        // }
        // window.selectionDone = selectionDone;
    });


});

//--------------------custom-file-upload-section-1 ends here-----------------