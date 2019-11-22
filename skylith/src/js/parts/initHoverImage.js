import { $, wndH, $wnd } from './_utility';

/* Hover Image */
function initHoverImage() {
    const $hoverImages = $('.nk-hover-image');

    if (!$hoverImages.length) {
        return;
    }

    function lazyLoadImage(img, cb) {
        const startTime = new Date().getMilliseconds();
        const tempImg = new Image();
        tempImg.onload = () => {
            cb(new Date().getMilliseconds() - startTime);
        };
        tempImg.src = img;
    }

    function reflow($item) {
        // Trigger a reflow, flushing the CSS changes. This need to place new element in dom and show it, then add opacity 0 with transition.
        // Info here - https://stackoverflow.com/questions/11131875/what-is-the-cleanest-way-to-disable-css-transition-effects-temporarily
        // eslint-disable-next-line
        $item[0].offsetHeight;
    }

    // change image src on links hover
    let hoverInstanceId = 0;
    function setHoverImage($item) {
        hoverInstanceId += 1;
        $item.each(function () {
            const $this = $(this);
            const $hoverImage = $this.closest('.nk-hover-image');
            $hoverImage.find('.nk-hover-image-links a').removeClass('active');
            $this.addClass('active');

            const $img = $hoverImage.find('.nk-hover-image-img:not(.hide):eq(0)');
            const $imgLink = $img.parent('a');
            const $clonedImg = $img.clone();

            $img.attr('src', '');
            $img.after($clonedImg);
            $img.addClass('loading');

            const currentInstance = hoverInstanceId;
            const newSrc = $this.attr('data-hover-image');
            lazyLoadImage(newSrc, (time) => {
                if (currentInstance === hoverInstanceId) {
                    if (time > 70) {
                        $img.css({
                            opacity: 0,
                        });
                    }
                    $img.attr('src', newSrc);
                    $img.removeClass('loading');
                    if (time > 70) {
                        reflow($img);
                        $img.css({
                            opacity: '',
                        });
                    }
                }
            });

            if ($imgLink.length) {
                $imgLink.attr('href', $this.attr('href'));
            }

            reflow($clonedImg);

            $clonedImg.addClass('hide');

            setTimeout(() => {
                $clonedImg.remove();
            }, 500);
        });
    }

    $hoverImages.on('mouseover', '.nk-hover-image-links a:not(.active)', function () {
        setHoverImage($(this));
    });
    setHoverImage($('.nk-hover-image .nk-hover-image-links a.active'));

    // sticky image
    function updateImagePosition() {
        window.requestAnimationFrame(() => {
            $hoverImages.each(function () {
                const $this = $(this);
                const $cont = $this.find('.nk-hover-image-img-cont');
                const $img = $cont.find('.bg-image');
                const thisRect = $this[0].getBoundingClientRect();
                let setTop = 0;
                let fixed = false;

                // if scrolled page - enable sticky
                if (thisRect.top <= 0 && (wndH - thisRect.bottom) <= 0) {
                    fixed = true;

                    // scrolled down - need to stick to the parent bottom
                } else if ((wndH - thisRect.bottom) > 0) {
                    setTop = thisRect.bottom - thisRect.top - wndH;
                }

                $img.css({
                    position: fixed ? 'fixed' : '',
                    left: fixed ? $cont.offset().left : '',
                    width: fixed ? $cont.width() : '',
                    top: setTop || '',
                });
            });
        });
    }
    updateImagePosition();
    $wnd.on('ready load resize orientationchange scroll', updateImagePosition);
}

export { initHoverImage };
