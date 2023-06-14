Hi Team, 

I understand that you'd like to export your deployment logs to a text file so that you can debug your running application. 

I've created a solution that uses the [`railway` cli](https://docs.railway.app/develop/cli) to connect to your deployment on Railway.app to stream the logs to a text file. This does require some configuration on your part with steps outlined below.

* Using a Shell (Linux) install the `railway` cli.  
  * `bash <(curl -fsSL cli.new)`
* Verify that the tool is installed.
  * `railway --version`
* Login to Railway to authenticate the CLI to your Railway account.
  * `railway login`
    * Follow the prompts to complete the login. Any future commands will be run against this project and environment.
* Connect to your project.
  * `railway link <PROJECT-ID>`

Now that the project is linked, you can use the tooling uploaded to this repository to stream logs to a text file. Simply download both the `railway_logs.sh` and `test.py` (in a linux enviornment) in the same directory. You can do this using `wget` or `git pull`.

* Change permissions on the files.
 * `chmod +x railway_logs.sh`
 * `chmod +x test.py`

* Once permissions on the file are set, execute `railway_logs.sh`.
 * `sh railway_logs.sh`
* Check your working directory for the `railway_logs.txt` file which will show the deployment logs for your application.
* `vi railway_logs.txt`

I have tested and validated that this tooling works.

Please let me know if this is a viable solution for your team.

Thanks!

Susie

