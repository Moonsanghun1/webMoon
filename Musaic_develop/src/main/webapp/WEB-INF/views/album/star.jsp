
<style>
.wrap {
    height: 100vh;
    min-height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 32px;
}

h1 {
    font-size: 40px;
    font-weight: 600;
}

.rating {
    float: none;
    width: 200px;
    display: flex;
}

.rating__input {
    display: none;
}

.rating__label {
    width: 20px;
    overflow: hidden;
    cursor: pointer;
}

.rating__label .star-icon {
    width: 20px;
    height: 40px;
    display: block;
    position: relative;
    left: 0;
    background-image: url('https://velog.velcdn.com/images/jellykelly/post/9957327f-f358-4c25-9989-5bb3dd5755d6/image.svg');
    background-repeat: no-repeat;
    background-size: 40px;
}

.rating__label .star-icon.filled {
    background-image: url('https://velog.velcdn.com/images/jellykelly/post/10caf033-b0ef-4d58-804b-6e33395e4ea5/image.svg');
}

.rating__label--full .star-icon {
    background-position: right;
}

.rating__label--half .star-icon {
    background-position: left;
}

.rating.readonly .star-icon {
    opacity: 0.7;
    cursor: default;
}

    </style>


<div class="wrap">
    <h1>Star rating</h1>
    <div class="rating">
        <label class="rating__label rating__label--half" for="starhalf">
            <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star1">
            <input type="radio" id="star1" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star1half">
            <input type="radio" id="star1half" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star2">
            <input type="radio" id="star2" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star2half">
            <input type="radio" id="star2half" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star3">
            <input type="radio" id="star3" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star3half">
            <input type="radio" id="star3half" class="rating__input" name="rating" checked>
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star4">
            <input type="radio" id="star4" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star4half">
            <input type="radio" id="star4half" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star5">
            <input type="radio" id="star5" class="rating__input" name="rating" value="">
            <span class="star-icon"></span>
        </label>
    </div>
</div>

<script>
    const rateWrap = document.querySelectorAll('.rating'),
    label = document.querySelectorAll('.rating .rating__label'),
    input = document.querySelectorAll('.rating .rating__input'),
    labelLength = label.length,
    opacityHover = '0.5';

let stars = document.querySelectorAll('.rating .star-icon');

checkedRate();

rateWrap.forEach(wrap => {
wrap.addEventListener('mouseenter', () => {
    stars = wrap.querySelectorAll('.star-icon');

    stars.forEach((starIcon, idx) => {
        starIcon.addEventListener('mouseenter', () => {
            initStars(); 
            filledRate(idx, labelLength); 

            for (let i = 0; i < stars.length; i++) {
                if (stars[i].classList.contains('filled')) {
                    stars[i].style.opacity = opacityHover;
                }
            }
        });

        starIcon.addEventListener('mouseleave', () => {
            starIcon.style.opacity = '1';
            checkedRate(); 
        });

        wrap.addEventListener('mouseleave', () => {
            starIcon.style.opacity = '1';
        });
    });
});
});

function filledRate(index, length) {
if (index <= length) {
    for (let i = 0; i <= index; i++) {
        stars[i].classList.add('filled');
    }
}
}

function checkedRate() {
let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');


initStars();
checkedRadio.forEach(radio => {
    let previousSiblings = prevAll(radio);

    for (let i = 0; i < previousSiblings.length; i++) {
        previousSiblings[i].querySelector('.star-icon').classList.add('filled');
    }

    radio.nextElementSibling.classList.add('filled');

    function prevAll() {
        let radioSiblings = [],
            prevSibling = radio.parentElement.previousElementSibling;

        while (prevSibling) {
            radioSiblings.push(prevSibling);
            prevSibling = prevSibling.previousElementSibling;
        }
        return radioSiblings;
    }
});
}

function initStars() {
for (let i = 0; i < stars.length; i++) {
    stars[i].classList.remove('filled');
}
}
</script>

