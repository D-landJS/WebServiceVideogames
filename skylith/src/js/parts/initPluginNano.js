import { $, $doc } from './_utility';

/* Nano Scroller */
// TODO: remove nano script since it was removed from template.
function initPluginNano($context) {
    if (typeof $.fn.nanoScroller !== 'undefined') {
        ($context || $doc).find('.nano').nanoScroller();
    }
}

export { initPluginNano };
