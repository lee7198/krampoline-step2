import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

const env = loadEnv( process.cwd(), '')

const staticServerUri = "kd9b1d28519fea" || "";  

// https://vitejs.dev/config/
export default defineConfig({
  base: `/${staticServerUri}/`,
  plugins: [react()],
})