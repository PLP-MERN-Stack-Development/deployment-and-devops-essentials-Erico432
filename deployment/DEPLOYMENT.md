# Deployment Guide

## Quick Start

1. **Setup Environment Variables**
   ```bash
   npm run setup-env
   ```

2. **Install Dependencies**
   ```bash
   npm run install-all
   ```

3. **Run Pre-deployment Checks**
   ```bash
   npm run pre-deploy
   ```

4. **Deploy**
   ```bash
   npm run deploy
   ```

## Platform-Specific Instructions

### Vercel (Frontend)
```bash
cd frontend
vercel login
vercel --prod
```

### Render (Backend)
1. Push code to GitHub
2. Connect repository in Render dashboard
3. Configure environment variables
4. Deploy automatically

## Environment Variables

### Backend
- `NODE_ENV`
- `PORT`
- `MONGODB_URI`
- `JWT_SECRET`
- `FRONTEND_URL`

### Frontend
- `REACT_APP_API_URL`

## Health Checks

```bash
npm run health-check
```

Or with custom URLs:
```bash
npm run health-check https://your-backend.com https://your-frontend.com
```
