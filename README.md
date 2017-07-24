# Let Me In

Let Me In is an event management system that uses [administrate](https://www.github.com/thoughtbot/administrate).

## Installation

```
git clone https://github.com/DisruptiveAngels/Let-Me-In.git
cd Let-Me-In
bundle install
rails db:create
rails db:migrate
```

You'll need an AWS account with a S3 bucket. Set the following config variables and you're set.

```
LOGIN_NAME
LOGIN_PASSWORD
AWS_KEY
AWS_SECRET
S3_BUCKET
```

## Usage

Access the admin panel at `/admin`, there you will be able to add events, users, attendees and custom fields. To enter the path you'll be asked for a user and password, both will be the ones you set in your config variables as `LOGIN_NAME` and `LOGIN_PASSWORD`.

### Events

Your attendees can preregister at `/your-event/register` and the day of the event check in at `/your-event/checkin`.

You can download a csv file containing your attendees in the admin panel for your event.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
6. ???
7. Profit!

## Credits

Let-Me-In was originally written by @acrogenesis and @balbinas and it's maintained by @DisruptiveAngels

## License

Let-Me-In is Copyright © 2016-2017 Disruptive Angels. It is free software, and may be redistributed under the terms specified in the LICENSE file.
