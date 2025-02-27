const timer = document.getElementById('timer');
const lines = timer.querySelector('#lines');
const fins = timer.querySelector('#fins');
const nums = timer.querySelector('#num-container');
const control = document.querySelector('.button-container #control');
const remainTime = document.querySelector('.time-container #remain-time');
const totalTime = document.querySelector('.time-container #total-time');

let endTime = 25

let intervalID = null;
let progressTimeSec = 0;

let isPlay = false;

const imoji =["😀", "😁", "😂", "🤣", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎", "😍", "😘", "🥰", "😗", "😙", "😚", "🙂", "🤗", "🤩", "🤔", "🤨", "😐", "😑", "😶", "🙄", "😏", "😣", "😥", "😮", "🤐", "😯", "😪", "😫", "🥱", "😴", "😌", "😛", "😜", "😝", "🤤", "😒", "😓", "😔", "😕", "🙃", "🤑", "🙁", "😖", "😞", "😟", "😤", "😢", "😭", "😦", "😧", "😨", "😩", "🤯", "😬", "😰", "😱", "🥵", "🥶", "😳", "🤪", "😵", "🥴", "😡", "🤬", "😷", "🤒", "🤕", "🤢", "🤮", "🤧", "😇", "🥺", "🤥", "🤫", "🤭", "🧐", "🤓", "👿"];

function paintLines() {
    for (let i = 0; i < 60; i++) { // 기존 60 → 30으로 변경
        const line = document.createElement('div');
        line.classList.add('line');
        line.style.transform = `rotate(${i * 6}deg)`; // 기존 6도 → 12도로 변경

        if (i % 5 === 0) {
            line.classList.add('thick');
        }

        lines.append(line);
    }
}


function paintNumber() {

    for (let i = 0; i < 6; i++) {
        const numBox = document.createElement('div');
        numBox.classList.add('num-box');
        numBox.style.transform = `rotate(${i * 30}deg)`;

        const spanLeft = document.createElement('span');
        const spanRight = document.createElement('span');

        spanLeft.style.transform = `rotate(${-30 * i}deg)`;
        spanRight.style.transform = `rotate(${-30 * i}deg)`;

        numBox.append(spanLeft, spanRight);
        nums.append(numBox);
    }
}

function paintRemainTime() {
    for (let min = 0; min < endTime; min++) {
        for (let sec = 0; sec < 60; sec++) {
            const remainFin = document.createElement('div');
            remainFin.classList.add('fin');

            const deg = min * 12 + sec * 0.2; // 기존 6 → 12로 변경
            remainFin.style.transform = `rotate(${-deg}deg)`;

            fins.append(remainFin);
        }
    }
}

function tickSec() {
    progressTimeSec++; 
    //console.log(progressTimeSec)

    if (progressTimeSec >= endTime * 60){
		if(endTime == 25){
			progressTimeSec = 0;
			endTime = 5
			paintRemainTime()
			paintTime()
			renderRemainTime();
			//play()
			notifyMe("집중시간 종료", "25분 집중시간이 끝났습니다. 5분간 휴식을 취해주세요")
		}else{
			endTime = 25;
			progressTimeSec = 0;
			paintRemainTime()
			paintTime()
			renderRemainTime();
			//notifyMe("휴식시간 종료", "5분 휴식시간이 끝났습니다. 다시 집중시간을 가지시리면 재생버튼을 눌러주세요")
			pause();
		}	
	 }
    const lastFin = fins.lastChild;
    if (lastFin) {
        lastFin.remove();
    }

    renderRemainTime();
	
	let index = Math.ceil((Math.random() * imoji.length));
	$(".cover2").html(imoji[index]);
}


function play() {
    intervalID = setInterval(tickSec,1000)
    isPlay = true;
    control.innerHTML = `<i class="fas fa-pause"></i>`;
}

function pause() {
	$.ajax({
		url : "pomedorook.jsp",
		type : "post",
		data : {
			id : id
		},
		success : function(result){
			console.log(result);
				if(result.trim() == "success"){
					clearInterval(intervalID);
				    isPlay = false;
				    control.innerHTML = `<i class="fas fa-play"></i>`;
				}else{
					alsert("에러 발생");
				}
		},
		error : function(){
			console.log("에러 발생");
		}
	});
    
}

function onClickControl() {
    if (isPlay) {
        pause();
        
    } else {
        play();
    }
}

function renderRemainTime() {
    const totalSec = endTime * 60 - progressTimeSec;
    const min = Math.floor(totalSec/60);
    const sec = totalSec % 60;

    remainTime.textContent = `
        ${min<10?`0${min}`:min} : 
        ${sec<10?`0${sec}`:sec}
    `;
}

function paintTime() {
    renderRemainTime();
    totalTime.textContent = `(${endTime} : 00)`;
}

if (lines) {
    paintLines();
}

if (nums) {
    paintNumber();
}

if (fins) {
    paintRemainTime();
}

if(control) {
    control.addEventListener('click', onClickControl);
}

if(remainTime && totalTime) {
    paintTime();
}