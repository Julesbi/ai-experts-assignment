# Stage 1: Dependencies
FROM node:20-alpine

# Create app directory inside container
WORKDIR /app

# Copy package files
COPY package.json ./

# Install dependencies
RUN npm install

# Copy rest of project files
COPY . .

# Run tests by default
CMD ["npm", "test"]
