# Étape 1 : build avec Node.js + Gulp
FROM node:20-alpine AS builder

WORKDIR /app

# Copie les fichiers nécessaires pour installer les dépendances
COPY package*.json ./
COPY gulpfile.js ./
COPY . .

# Installation des dépendances
RUN npm install

# Build du site avec Gulp
RUN npm run build || gulp build

# Étape 2 : serveur nginx pour héberger le site statique
FROM nginx:alpine

# Copie les fichiers buildés (ajuste le chemin si besoin)
COPY --from=builder app/theme/ /usr/share/nginx/html

# Port exposé
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
