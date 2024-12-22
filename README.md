# GitHub Master

GitHub Master is a web application that allows you to search for your GitHub profile and provides insights into your followers, following, and unfollowers.

## Features

- Know your followers list.
- Know those who you follow but don't follow you back.
- Unfollow people.

## Stats

### Installation and Running Locally

To install the dependencies and run the project locally, follow these steps:

1. **Clone the repository:**

   ```sh
   git clone <repository-url>
   cd GitHub_Master
   ```

2. **Install the dependencies:**

   ```sh
   npm install
   ```

3. **Run the project locally:**

   ```sh
   npm run dev
   ```

4. **Open your browser and navigate to:**
   ```
   http://localhost:5173
   ```

This will start the development server and you should be able to see the project running locally.

The application displays your GitHub stats, including the number of followers, following, and unfollowers.

## Environment Variables

To run this project, you will need to add the following environment variables to your `.env` file:

```.env
	VITE_API_USERNAME="your_github_username"
	VITE_API_BASE="your_api_url"
```
