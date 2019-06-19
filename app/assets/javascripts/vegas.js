$(function() {
    $('#vegas').vegas({
        overlay: 'https://cdnjs.cloudflare.com/ajax/libs/vegas/2.4.0/overlays/01.png',
        delay: 7000,
        timer: true,
        firstTransition: 'fade2',
        firstTransitionDuration: 2000,
        transition: 'fade2',
        transitionDuration: 2000,
        animation: 'kenburns',
        slides: [
        	{ src: 'https://cdn.pixabay.com/photo/2016/02/18/18/57/home-office-1207834_1280.jpg' },
            { src: "https://cdn.pixabay.com/photo/2014/11/03/10/44/camera-514992_1280.jpg" },
            { src: "https://cdn.pixabay.com/photo/2015/10/12/15/18/store-984393_1280.jpg" },
            { src: "https://cdn.pixabay.com/photo/2016/11/18/15/54/apartment-1835482_1280.jpg" }
        ],
    });
});