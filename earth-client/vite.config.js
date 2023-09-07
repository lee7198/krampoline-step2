import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

const env = loadEnv( process.cwd(), '')

const staticServerUri = "ka5f92745ae1ea" || "";  

// https://vitejs.dev/config/
export default defineConfig({
  base: `/${staticServerUri}/`,
  plugins: [react()],
})