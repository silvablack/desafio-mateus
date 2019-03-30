### Run application ###
+   Clone this repository:
        `git clone`
+   Install modules:
        `npm install`
+   Start Application:
        `npm start`

### Import DATA ###
+   Create database:
        `create database estoque_mateus;`
+   Import data:
        `mysql -u root -p estoque_mateus < backup.sql`

### Tests ###
+   Run command line:
   + run test unit
        `npm run test-unit`

### Run docker ###
+   Run command line:
   + run docker file
        `docker build .`