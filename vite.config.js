// Šis kodas buvo sugeneruotas naudojant ChatGPT, 5,5 versija
// Užklausa: Create a simple Docker setup for a Laravel + Vue/Inertia + Vite project. Use: PHP 8.4, Node 22, MySQL 8.4, Composer, phpMyAdmin, MySQL as the database, include phpMyAdmin

import { defineConfig, loadEnv } from "vite";
import vue from "@vitejs/plugin-vue";
import laravel from "laravel-vite-plugin";
import tailwindcss from "@tailwindcss/vite";
import { fileURLToPath, URL } from "node:url";

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, process.cwd(), "");
    const vitePort = Number(env.VITE_PORT || 5173);

    return {
        plugins: [
            laravel({
                input: ["resources/css/app.css", "resources/js/app.js"],
                refresh: ["resources/views/**", "resources/js/**", "routes/**"],
            }),
            vue(),
            tailwindcss(),
        ],
        server: {
                host: '0.0.0.0',
                port: 5173,
                hmr: {
                    host: 'localhost',
                },
            },
        resolve: {
            alias: {
                "@icons": fileURLToPath(
                    new URL("./resources/images/icons", import.meta.url),
                ),
                "@images": fileURLToPath(
                    new URL("./resources/images", import.meta.url),
                ),
                "ziggy-js": fileURLToPath(
                    new URL("./vendor/tightenco/ziggy", import.meta.url),
                ),
            },
        },
    };
});
