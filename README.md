# NestJS + Flutter Monorepo

A learning project to explore API development using **NestJS**, image uploads with **Cloudinary**, and building a **Flutter** app that consumes the API.

This is **not an e-commerce app** — the purpose of this project is to practice full-stack development with image handling and CRUD operations.

---

## 🛠️ Tech Stack

### Backend
- **Framework:** [NestJS](https://nestjs.com/)
- **Database:** MongoDB (via Mongoose)
- **Image Upload:** [Cloudinary](https://cloudinary.com/)
- **API Features:**
  - Products CRUD
  - Categories CRUD
  - Image upload & management

### Frontend
- **Framework:** [Flutter](https://flutter.dev/)
- **Purpose:** Consume the API and display products & categories


### Environment Variables
Both apps require environment variables to work correctly. Each subproject has its own .env.example file with the required keys.

#### Backend .env example:
``` env

# Development MongoDB URI
MONGO_URI=your_local_mongo_uri

# Production MongoDB URI (e.g. MongoDB Atlas)
MONGO_URI_PROD=your_mongo_atlas_uri

# Cloudinary credentials
CLOUDINARY_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret


```