# Fakebook
This is an application have some functions like Facebook such as: 

 - Authentication
 - Create/Delete posts
 - Create/Delete comments on the post
 - Add/Remove friendships between users
 - Display List friend of the user 
 - Display strangers who the current user can add friend
 - Access to other users' newsfeeds.
## Technologies 
> PostgreSQL, Rails 6
## Clone this app
    git clone https://github.com/nomian2001/Fakebook.git
You need to run and prepare something after clone this project: 

    yarn install
    bundle install
    yarn add webpack (only run if display error when run rails sever after bundle install )
    rails webpacker:install (only run after yarn add webpack)
Then, you need to modify the environment for webpacker in **Fakebook/config/webpack/environment.js**

    const { environment } = require('@rails/webpacker')
    
    const  webpack = require('webpack')
    environment.plugins.prepend('Provide',new  webpack.ProvidePlugin({
	    $:  'jquery/src/jquery',
	    jQuery:  'jquery/src/jquery',
	    Popper: ['popper.js', 'default']
	    })
    )
    
    module.exports = environment

