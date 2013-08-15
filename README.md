drupalaton_winestore_measurement
================================

Measurement tools for the performance workshop at Drupalaton 2013

measure.sh
----------
The measure.sh invokes the ApacheBench (http://httpd.apache.org/docs/2.4/programs/ab.html)
tool to provide requests / second metrics. It can be executed repeatedly, it generates
datafiles in the current directory.
When using with Drupal, invoke it from root directory of Drupal and with the -u switch,
it's able to measure authenticated performance (Drush is needed for this functionality)
Usage example:
./measure.sh -u 2 -l http://example.local/

Then it will get a cookie for the UID2 user and ivokes ab accordingly.

visualize.sh
------------
Using the R package (http://www.r-project.org/), it visualizes the result of the previous
command, it generates a PNG chart in the current directory.
