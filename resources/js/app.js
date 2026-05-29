import "./bootstrap";

import { createApp, h } from "vue";
import { createInertiaApp, router } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";

const appName = import.meta.env.VITE_APP_NAME || "Mind Gym";

function pathFromUrl(url) {
    return new URL(url || "/", window.location.origin).pathname || "/";
}

function scrollWindowToTop() {
    window.requestAnimationFrame(() => {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: "auto",
        });
    });
}

createInertiaApp({
    title: (title) => (title ? `${title} | ${appName}` : appName),
    resolve: (name) =>
        resolvePageComponent(
            `./Pages/${name}.vue`,
            import.meta.glob("./Pages/**/*.vue"),
        ),
    setup({ el, App, props, plugin }) {
        let previousPath = pathFromUrl(props.initialPage.url);

        router.on("navigate", (event) => {
            const nextPath = pathFromUrl(event.detail.page.url);

            if (nextPath !== previousPath && nextPath !== "/") {
                scrollWindowToTop();
            }

            previousPath = nextPath;
        });

        createApp({ render: () => h(App, props) })
            .use(plugin)
            .mount(el);
    },
});
