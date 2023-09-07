import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

const env = loadEnv( process.cwd(), '')

const staticServerUri = "k31a28776702aa" || "";  

// https://vitejs.dev/config/
export default defineConfig({
  base: `/${staticServerUri}/`,
  plugins: [react()],
})