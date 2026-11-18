function unlockPremiumGrid(event, btn) {
    event.preventDefault(); 

    btn.innerHTML = '<i class="fa-solid fa-box-open"></i> PREMIUM UNLOCKED';
    btn.style.pointerEvents = 'none';

    if (typeof initWallpaperData === "function") {
        initWallpaperData('premium').then(() => {
            let grid = document.getElementById('wallpaperGrid');
            if(grid) {
                grid.style.opacity = '1';
                let cards = grid.querySelectorAll('.wp-card');
                
                cards.forEach(card => {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(50px) scale(0.95)';
                    card.style.transition = 'all 0.5s cubic-bezier(0.25, 0.8, 0.25, 1)';
                });

                cards.forEach((card, index) => {
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0) scale(1)';
                    }, 100 * index); 
                });
            }
            btn.style.pointerEvents = 'all';
            if (navigator.vibrate) navigator.vibrate([50, 50]);
        });
    }
}
