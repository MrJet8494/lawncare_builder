# Lawncare Builder
#### Video Demo: https://youtu.be/cM1SyRHHLOw
#### Description:

**Lawncare Builder** is a web-based application designed to help homeowners and lawn care enthusiasts find the right products tailored to their specific grass type. Whether you're new to lawn care or a seasoned pro, Lawncare Builder simplifies the decision-making process by offering curated product recommendations across five essential categories: lawn mowers, weedwackers, fertilizers, herbicides, and pesticides.

This project was built as a final submission for **CS50x 2025** and aims to demonstrate not only a technical understanding of web development but also how thoughtful design can solve real-world problems. With a clean user interface, robust backend, and logical database design, this application provides a great foundation for future expansion into more advanced lawn care tools.

## Technologies Used

- **Flask (Python)**: A lightweight WSGI web application framework that powers the backend and routing logic.
- **HTML/CSS + JavaScript**: Used for creating an interactive and responsive front-end interface.
- **SQLite**: A relational database that stores data about grass types, products, and their compatibility.

## Features

- **Dynamic Grass Type Selection**: A dropdown allows users to choose from common Florida-friendly grass types, including:
  - St. Augustine
  - Bahia
  - Bermuda
  - Zoysia
  - Centipede

- **Tailored Product Recommendations**: Based on the selected grass type, users receive five personalized product suggestions:
  1. **Lawn Mower** – Chosen based on performance and overall value.
  2. **Weedwacker** – Selected for ease of use and price-performance ratio.
  3. **Fertilizer** – Must be compatible and beneficial to the selected grass type.
  4. **Herbicide** – Safe to use and effective against common weeds.
  5. **Pesticide** – Protects grass while remaining non-toxic to the grass type.

- **External Search Links**: Each product includes a hyperlink to a pre-formatted Google search query so users can explore pricing, reviews, and purchasing options without needing to include brand links directly in the app.

- **Mobile-Friendly Design**: The app is responsive and works well across devices, making it convenient for on-the-go users.

## File Structure

- `app.py`: This is the main Flask application file. It handles route definitions, database connections, querying for compatible products, and rendering of HTML templates with dynamic content.

- `templates/index.html`: The main HTML template rendered by Flask. It includes the dropdown menu for grass type selection and displays the five product recommendations using Jinja templating.

- `static/`: Folder reserved for any external CSS and JavaScript files. If additional styling or front-end interactivity were added, those files would be located here.

- `schema.sql`: This SQL script sets up the database schema, including three main tables: `grasses`, `products`, and `product_compatibility`. It also inserts seed data for grass types, product descriptions, categories, and their compatibilities.

- `lawncare.db`: The SQLite database that houses all product and compatibility data. This database is queried on each grass type selection to provide accurate product suggestions.

- `README.md`: This file, which explains the project structure, purpose, and future directions in detail.

## Database Design

The schema follows a normalized structure, which helps maintain data integrity and enables efficient querying. The tables include:

- `grasses`: Stores the names of each grass type.
- `products`: Includes details such as name, category, and description.
- `product_compatibility`: A many-to-many join table linking products to the grass types they are safe or appropriate for.

By using foreign keys and composite primary keys in the compatibility table, the app ensures referential integrity and simplifies queries for valid products by category and grass type.

## Design Philosophy

The primary design goal was to provide a user-friendly interface that delivers value without overwhelming users with too much information. This guided several of the design decisions:

- **Separation of Logic**: Front-end and back-end components were kept cleanly separated. Flask handles routing and database access, while HTML and JavaScript manage the user interface.
- **Expandability**: The current setup allows for easy addition of new grass types or products without major rewrites.
- **Safety First**: The application ensures that only fertilizers, herbicides, and pesticides that are explicitly marked as safe for a grass type will be recommended.
- **Accessibility**: The UI is designed to be usable even by users with limited technical expertise or lawn care knowledge.

## Future Improvements

Although the current version of Lawncare Builder fulfills its initial requirements, there are several potential improvements and features that could enhance the experience further:

- **User Accounts**: Allow users to log in and save their grass type and favorite products.
- **Weather Integration**: Connect to a weather API to provide recommendations based on local conditions (e.g., avoiding fertilizer on rainy days).
- **Product Ratings and Reviews**: Pull in third-party reviews or allow users to rate products themselves.
- **Filtering Options**: Enable users to filter results by price range, brand, or environmental safety.
- **Localized Recommendations**: Use geolocation to suggest products available at nearby stores.
- **Admin Interface**: Add a dashboard where new products can be entered or edited through a web interface rather than editing the database manually.

## Final Thoughts

Creating Lawncare Builder was an exciting and enriching experience that pulled together all of the foundational skills learned throughout the CS50 course. From structuring a real-world database to building dynamic web routes with Flask and deploying a user-facing interface, this project provided valuable hands-on experience. Most importantly, it solves a practical problem in a simple, elegant way—helping homeowners make informed decisions about how to care for their specific type of grass.

Thank you for checking out Lawncare Builder! I hope you find it helpful—and if you have a lawn of your own, may it always stay green and healthy.

