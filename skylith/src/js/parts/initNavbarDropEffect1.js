import { $, tween } from './_utility';

/*------------------------------------------------------------------

  Init Dropdown Effect 1 for side navbars and fullscreen

-------------------------------------------------------------------*/
function initNavbarDropEffect1() {
    const self = this;
    const $navbars = $('.nk-navbar-drop-effect-1');

    // add back item for dropdowns
    $navbars.find('.dropdown').prepend(`<li class="dropdown-back"><a href="#">${self.options.templates.navbarBackItem}</a></li>`);

    // change height of opened dropdown
    function updateSideNavDropdown($item) {
        const $nav = $item.closest('.nk-navbar');
        const $khNav = $nav.find('.nk-nav');
        const $nanoCont = $nav.find('.nano-content');
        const $drop = $nav.find('.nk-drop-item.open > .dropdown:not(.closed)');

        let dropHeight = '';
        if ($drop.length) {
            dropHeight = $drop.innerHeight();
        }

        $khNav.css({
            height: dropHeight,
            minHeight: dropHeight,
        });
        self.initPluginNano($nav);

        // scroll to top
        // TODO: remove nano script since it was removed from template.
        tween.to($nanoCont, 0.3, {
            scrollTo: { y: 0 },
            delay: 0.2,
        });
    }

    // open / close submenu
    function toggleSubmenu(open, $drop) {
        let $newItems = $drop.find('> .dropdown > li > a');
        let $oldItems = $drop.parent().find('> li > a');

        if (open) {
            $drop.addClass('open').parent().addClass('closed');
        } else {
            $drop.removeClass('open').parent().removeClass('closed');

            const tmp = $newItems;
            $newItems = $oldItems;
            $oldItems = tmp;
        }

        // show items
        tween.set($newItems, {
            x: open ? '15%' : '-15%',
            opacity: 0,
            display: 'block',
        }, 0.1);
        tween.staggerTo($newItems, 0.2, {
            x: '0%',
            opacity: 1,
            delay: 0.1,
        }, 0.03);

        // hide items
        tween.staggerTo($oldItems, 0.2, {
            x: open ? '-15%' : '15%',
            opacity: 0,
        }, 0.03, () => {
            $oldItems.css('display', 'none');
        });
    }

    $navbars.on('click', '.nk-drop-item > a', function (e) {
        toggleSubmenu(true, $(this).parent());
        updateSideNavDropdown($(this));
        e.preventDefault();
    });
    $navbars.on('click', '.dropdown-back > a', function (e) {
        toggleSubmenu(false, $(this).parent().parent().parent());
        updateSideNavDropdown($(this));
        e.preventDefault();
    });
}

export { initNavbarDropEffect1 };
