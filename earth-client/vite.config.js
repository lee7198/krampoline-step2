import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

const env = loadEnv( process.cwd(), '')

const staticServerUri = env.VITE_APP_PATH || "";  

// https://vitejs.dev/config/
export default defineConfig({
  base: `/${staticServerUri}/`,
  plugins: [react()],
})