# cloudflare-bulk-delete
A bash script to delete all DNS records for a domain using the Cloudflare API

## Why
I wanted to use Cloudflare for a domain registered at INWX (which had a wildcard A record). After pointing my nameservers to Cloudflare, I had several hundred records added (e.g. 1.example.com, 2.example.com, a.example.com, b.example.com). Currently through the Cloudflare website there is no convenient way to bluk delete. Deleting a record requires selecting and individual record, edit > delete > confirm.

## Using the script
Set the 3 variables at the top of the script.
1. Add the email you used to sign in to Cloudlfare
2. Add your API key*
3. Add the domain for which you wish to bulk delete

*The API key can be obtained by clicking 'My Profile' in the top right, then API Tokens on the left. Create a token with the Zone:Edit:DNS privileges, or use the Global API Key.

## Additional
The Cloudflare API returns 100 records at a time, so if you have more, you'll need to run this script x number of times. 
