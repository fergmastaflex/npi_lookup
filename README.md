# Setup

- run `bin/setup`
- run `yarn install`
- run `bundle exec rails console`
- navigate to `localhost:3000`

# Important notes
- There were serious issues with Ruby clients contacting the NPPES API. The API does not accept ipv6, so the I had to force that when contacting the API. That took quite a while to troubleshoot.
- You can rearrange the rows in the table, and it will persist.
