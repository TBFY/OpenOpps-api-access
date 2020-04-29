
SELECT
  upper(t.buyer),
  upper(t.streetaddress),
  substring(email from '@(.*)$') as email_domain,
  countryname,
  count(ocid)
FROM
  ocds.ocds_tenders_view t
WHERE
  countryname = 'Slovenia' or
  countryname = 'Italy' or
  countryname = 'Spain'
GROUP BY
  upper(t.buyer),
  upper(t.streetaddress),
  email_domain,
  countryname
ORDER BY
  count desc
;OR
  sss like '%
