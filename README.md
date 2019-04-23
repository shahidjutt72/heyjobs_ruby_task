### Task background
We publish our jobs to different marketing sources. To keep track of where the particular job is published, we create Campaign entity in database. Campaigns are periodically synchronized with 3rd party Ad Service.

Campaign properties:

id
job_id
status: one of [enabled, disabled, deleted]
external_reference: corresponds to Ad’s ‘reference’
ad_description: text description of an Ad
Due to various types of failures (Ad Service inavailability, errors in campaign details etc.) local Campaigns can fall out of sync with Ad Service. So we need a way to detect discrepancies between local and remote state.

### TODOs
Develop a Service(as in Service Object pattern), which would get campaigns from external JSON API(example link) and detect discrepancies between local and remote state.
 
output format
You're free to choose the output format which makes sense to you, we suggest the following:



### Solution

### Campaign

`Campaign` properties:

- `id`
- `job_id`
- `status`: one of [enabled, disabled, deleted]
- `reference`: corresponds to Ad’s ‘reference’
- `description`: text description of an Ad

### Ruby
ruby 2.5.3
Rails 5.2.2

### Setup
- `rake db:migrate`
- `rake db:seed`

In Order to fetch only remote campaigns
- `Campaigns::Fetcher.fetch!`

To load Discrepancies
- `Campaigns::Discrepancies::Fetcher.fetch!`

### Service output

```
[
  {
    "remote_reference": "1",
    "discrepancies": [
      "status": {
        "remote": "enabled",
        "local": "disabled"
      },
      "description": {
        "remote": "Description for campaign 11",
        "local": "Ruby on Rails Developer"
      }
    ]
  }
]
```
