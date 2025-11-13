# Ì∫Ä MERN Stack Deployment - Week 7

## Ìºê Live Deployment

| Service | URL | Status |
|---------|-----|--------|
| **Frontend** | [Update with your URL] | Ì¥¥ Not Deployed |
| **Backend** | [Update with your URL] | Ì¥¥ Not Deployed |
| **Health Check** | [Update with your URL/health] | Ì¥¥ Not Deployed |

## Ì≥ã Quick Start

### 1. Setup Environment
```bash
npm run setup-env
```

### 2. Install Dependencies
```bash
npm run install-all
```

### 3. Configure Environment Variables

Edit the following files with your actual values:
- `backend/.env`
- `frontend/.env`

### 4. Run Pre-deployment Checks
```bash
npm run pre-deploy
```

### 5. Deploy
```bash
npm run deploy
```

## Ì≥Ç Project Structure

```
mern-deployment/
‚îú‚îÄ‚îÄ .github/workflows/    # GitHub Actions CI/CD
‚îú‚îÄ‚îÄ backend/             # Express.js API
‚îú‚îÄ‚îÄ frontend/            # React application
‚îú‚îÄ‚îÄ scripts/             # Deployment scripts
‚îú‚îÄ‚îÄ monitoring/          # Monitoring config
‚îú‚îÄ‚îÄ deployment/          # Deployment docs
‚îî‚îÄ‚îÄ screenshots/         # Screenshots for submission
```

## Ìª†Ô∏è Available Scripts

| Script | Description |
|--------|-------------|
| `npm run setup-env` | Create .env files from templates |
| `npm run install-all` | Install all dependencies |
| `npm run pre-deploy` | Run pre-deployment checks |
| `npm run deploy` | Deploy application |
| `npm run health-check` | Check application health |
| `npm run frontend:dev` | Start frontend development |
| `npm run backend:dev` | Start backend development |
| `npm test` | Run all tests |

## Ì¥ê GitHub Secrets Required

Add these secrets in your GitHub repository:

- `VERCEL_TOKEN` - From Vercel account settings
- `VERCEL_ORG_ID` - From Vercel project settings
- `VERCEL_PROJECT_ID` - From Vercel project settings
- `RENDER_DEPLOY_HOOK_URL` - From Render service settings
- `BACKEND_URL` - Your deployed backend URL
- `REACT_APP_API_URL` - Your backend API URL

## Ì≥∏ Screenshots

Add your screenshots to the `screenshots/` folder:
- GitHub Actions pipeline
- Frontend deployment
- Backend deployment
- Monitoring dashboard

## Ì∞õ Troubleshooting

### CORS Errors
Ensure `CORS_ORIGIN` in backend matches your frontend URL exactly.

### Environment Variables Not Loading
- Verify all variables are set in deployment platform
- Restart services after updating variables
- Check variable names are correct (case-sensitive)

### Build Failures
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
```

## Ì≥ö Documentation

- [Deployment Guide](deployment/DEPLOYMENT.md)
- [MongoDB Atlas Setup](https://docs.atlas.mongodb.com/)
- [Vercel Documentation](https://vercel.com/docs)
- [Render Documentation](https://render.com/docs)

## ‚úÖ Deployment Checklist

- [ ] MongoDB Atlas cluster created
- [ ] Backend deployed to Render/Railway
- [ ] Frontend deployed to Vercel
- [ ] Environment variables configured
- [ ] GitHub Actions workflows working
- [ ] Health checks passing
- [ ] Monitoring set up
- [ ] Screenshots added
- [ ] README updated with URLs

## Ì±§ Author

Your Name - [GitHub Profile](https://github.com/yourusername)

## Ì≥Ñ License

MIT License
